/*
 * Spectral Analyzer audio effect based on DISTRHO Plugin Framework (DPF)
 *
 * SPDX-License-Identifier: MIT
 *
 * Copyright (C) 2019 Jean Pierre Cimalando <jpcima@protonmail.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 */

#include "PluginSpectralAnalyzer.hpp"
#include "Parameters.h"
#include "dsp/STFT.h"
#include "dsp/MultirateSTFT.h"
#include "dsp/AnalyzerDefs.h"
#include "dsp/FFTPlanner.h"
#include "blink/DenormalDisabler.h"
#include <memory>
#include <cstring>

PluginSpectralAnalyzer::PluginSpectralAnalyzer()
    : Plugin(kParameterCount, 0, 0),
      fParameters(new float[kParameterCount]),
      fParameterRanges(new ParameterRanges[kParameterCount])
{
    for (uint32_t c = 0; c < kNumChannels; ++c)
        fStft[c].reset(new STFT);

    for (uint32_t i = 0; i < kParameterCount; ++i) {
        Parameter p;
        InitParameter(i, p);
        fParameters[i] = p.ranges.def;
        fParameterRanges[i] = p.ranges;
    }

    constexpr uint32_t specMaxSize = kStftMaxSize / 2 + 1;
    fSendFrequencies.resize(kNumChannels * specMaxSize);
    fSendMagnitudes.resize(kNumChannels * specMaxSize);

    sampleRateChanged(getSampleRate());

    fThread = std::thread([this]() { runThread(); });
}

PluginSpectralAnalyzer::~PluginSpectralAnalyzer()
{
    fThreadQuit = true;
    fThreadSem.post();
    fThread.join();
}

// -----------------------------------------------------------------------
// Init

void PluginSpectralAnalyzer::initParameter(uint32_t index, Parameter &parameter)
{
    DISTRHO_SAFE_ASSERT_RETURN(index < kParameterCount, );
    InitParameter(index, parameter);
}

/**
  Set the name of the program @a index.
  This function will be called once, shortly after the plugin is created.
*/
void PluginSpectralAnalyzer::initProgramName(uint32_t index, String &programName)
{
    (void)index;
    (void)programName;
    DISTRHO_SAFE_ASSERT(false);
}

// -----------------------------------------------------------------------
// Internal data

/**
  Optional callback to inform the plugin about a sample rate change.
*/
void PluginSpectralAnalyzer::sampleRateChanged(double newSampleRate)
{
    fSampleRate = newSampleRate;
    fThreadSem.post();
}

/**
  Get the current value of a parameter.
*/
float PluginSpectralAnalyzer::getParameterValue(uint32_t index) const
{
    DISTRHO_SAFE_ASSERT_RETURN(index < kParameterCount, 0.0);
    return fParameters[index];
}

/**
  Change a parameter value.
*/
void PluginSpectralAnalyzer::setParameterValue(uint32_t index, float value)
{
    DISTRHO_SAFE_ASSERT_RETURN(index < kParameterCount, );
    fParameterRanges[index].fixValue(value);
    fParameters[index] = value;

    switch (index) {
    case kPidFftSize:
    case kPidStepSize:
    case kPidAlgorithm:
        fThreadSem.post();
        break;
    case kPidAttackTime:
    case kPidReleaseTime:
        fMustReconfigureEnvelope.store(true);
        break;
    }
}

/**
  Load a program.
  The host may call this function from any context,
  including realtime processing.
*/
void PluginSpectralAnalyzer::loadProgram(uint32_t index)
{
    (void)index;
    DISTRHO_SAFE_ASSERT(false);
}

// -----------------------------------------------------------------------
// Process

void PluginSpectralAnalyzer::activate()
{
    fComputationStarts = true;

#if !defined(SKIP_FFT_PRECACHING)
    // precache FFT plans for quicker use
    for (uint32_t sizeLog2 = kStftMinSizeLog2; sizeLog2 <= kStftMaxSizeLog2; ++sizeLog2) {
        uint32_t size = 1u << sizeLog2;
        FFTPlanner::getInstance().forwardFFT(size);
    }
#endif

    fThreadSem.post();
}

void PluginSpectralAnalyzer::run(const float **inputs, float **outputs, uint32_t frames)
{
    WebCore::DenormalDisabler dd;

    bool computationShouldBeActive = fEditorVisible;

    if (fComputationIsActive != computationShouldBeActive) {
        fComputationIsActive = computationShouldBeActive;
        if (computationShouldBeActive)
            fComputationStarts = true;
    }

    if (computationShouldBeActive) {
        std::unique_lock<SpinMutex> stftLock(fStftMutex, std::try_to_lock);

        if (stftLock.owns_lock()) {
            if (fComputationStarts) {
                for (uint32_t c = 0; c < kNumChannels; ++c) {
                    BasicAnalyzer &stft = *fStft[c];
                    stft.clear();
                }
                fComputationStarts = false;
            }

            if (fMustReconfigureEnvelope.exchange(false)) {
                for (uint32_t c = 0; c < kNumChannels; ++c)
                    fStft[c]->setAttackAndRelease(fParameters[kPidAttackTime], fParameters[kPidReleaseTime]);
            }

            for (uint32_t c = 0; c < kNumChannels; ++c) {
                BasicAnalyzer &stft = *fStft[c];
                const float *input = inputs[c];
                stft.process(input, frames);
            }

            std::unique_lock<SpinMutex> sendLock(fSendMutex, std::try_to_lock);
            if (sendLock.owns_lock()) {
                uint32_t numBins;
                const float* freqs[kNumChannels] = {};
                const float* mags[kNumChannels] = {};

                numBins = fStft[0]->getNumBins();
                for (uint32_t c = 0; c < kNumChannels; ++c) {
                    BasicAnalyzer &stft = *fStft[c];
                    freqs[c] = stft.getFrequencies();
                    mags[c] = stft.getMagnitudes();
                }

                for (uint32_t c = 0; c < kNumChannels; ++c) {
                    fSendSize = numBins;
                    std::memcpy(
                        &fSendFrequencies[c * numBins], freqs[c],
                        numBins * sizeof(float));
                    std::memcpy(
                        &fSendMagnitudes[c * numBins], mags[c],
                        numBins * sizeof(float));
                }
            }
        }
    }

    for (uint32_t c = 0; c < kNumChannels; ++c) {
        if (inputs[c] != outputs[c])
            std::memcpy(outputs[c], inputs[c], frames * sizeof(float));
    }
}

// -----------------------------------------------------------------------

void PluginSpectralAnalyzer::runThread()
{
    for (;;) {
        for (fThreadSem.wait(); fThreadSem.try_wait(); );

        if (fThreadQuit)
            break;

        std::lock_guard<SpinMutex> lock(fStftMutex);

        Configuration config;
        config.sampleRate = fSampleRate;
        config.windowSize = 1u << (uint32_t)fParameters[kPidFftSize];
        config.stepSize = 1u << (uint32_t)fParameters[kPidStepSize];
        config.attackTime = fParameters[kPidAttackTime];
        config.releaseTime = fParameters[kPidReleaseTime];

        for (uint32_t c = 0; c < kNumChannels; ++c) {
            BasicAnalyzer *stft;
            switch ((Algorithm)fParameters[kPidAlgorithm]) {
            case kAlgoStft: default:
                stft = new STFT;
                break;
            case kAlgoMultirateStftX2:
                stft = new MultirateSTFT<2>;
                break;
            case kAlgoMultirateStftX3:
                stft = new MultirateSTFT<3>;
                break;
            case kAlgoMultirateStftX4:
                stft = new MultirateSTFT<4>;
                break;
            case kAlgoMultirateStftX5:
                stft = new MultirateSTFT<5>;
                break;
            case kAlgoMultirateStftX6:
                stft = new MultirateSTFT<6>;
                break;
            case kAlgoMultirateStftX7:
                stft = new MultirateSTFT<7>;
                break;
            case kAlgoMultirateStftX8:
                stft = new MultirateSTFT<8>;
                break;
            }
            fStft[c].reset(stft);
            stft->configure(config);
            stft->clear();
        }
    }
}

// -----------------------------------------------------------------------

Plugin *DISTRHO::createPlugin()
{
    return new PluginSpectralAnalyzer();
}
