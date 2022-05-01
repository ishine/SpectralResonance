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

#pragma once
#include "DistrhoPlugin.hpp"
#include "dsp/SpectralAnalyzer.h"
#include <SpinMutex.h>
#include <RTSemaphore.h>
#include <atomic>
#include <thread>
#include <mutex>
#include <memory>

class PluginSpectralAnalyzer : public Plugin {
public:
    PluginSpectralAnalyzer();
    ~PluginSpectralAnalyzer();

    // -------------------------------------------------------------------

    // Called by editor to indicate visibility status
    void setEditorIsVisible(bool editorVisible) { fEditorVisible = editorVisible; }

protected:
    // -------------------------------------------------------------------
    // Information

    const char *getLabel() const noexcept override
    {
        return "Spectacle";
    }

    const char *getDescription() const override
    {
        return "A graphical spectral analyzer";
    }

    const char *getMaker() const noexcept override
    {
        return "JPC";
    }

    const char *getHomePage() const override
    {
        return "https://github.com/jpcima/spectacle";
    }

    const char *getLicense() const noexcept override
    {
        return "https://spdx.org/licenses/MIT";
    }

    uint32_t getVersion() const noexcept override
    {
        return d_version(0, 1, 0);
    }

    // Go to:
    //
    // http://service.steinberg.de/databases/plugin.nsf/plugIn
    //
    // Get a proper plugin UID and fill it in here!
    int64_t getUniqueId() const noexcept override
    {
        return d_cconst('s', 'p', 'c', 't');
    }

    // -------------------------------------------------------------------
    // Init

    void initParameter(uint32_t index, Parameter &parameter) override;
    void initProgramName(uint32_t index, String &programName) override;

    // -------------------------------------------------------------------
    // Internal data

    float getParameterValue(uint32_t index) const override;
    void setParameterValue(uint32_t index, float value) override;
    void loadProgram(uint32_t index) override;

    // -------------------------------------------------------------------
    // Optional

    // Optional callback to inform the plugin about a sample rate change.
    void sampleRateChanged(double newSampleRate) override;

    // -------------------------------------------------------------------
    // Process

    void activate() override;
    void run(const float **inputs, float **outputs, uint32_t frames) override;

    // -------------------------------------------------------------------

private:
    void runThread();

    // -------------------------------------------------------------------

public:
    SpinMutex fSendMutex;
    uint32_t fSendSize = 0;
    std::vector<float> fSendFrequencies;
    std::vector<float> fSendMagnitudes;

    // -------------------------------------------------------------------

private:
    double fSampleRate = 44100;

    enum { kNumChannels = DISTRHO_PLUGIN_NUM_INPUTS };

    std::unique_ptr<BasicAnalyzer> fStft[kNumChannels];
    SpinMutex fStftMutex;

    std::atomic<bool> fMustReconfigureEnvelope { false };

    const std::unique_ptr<float[]> fParameters;
    const std::unique_ptr<ParameterRanges[]> fParameterRanges;

    std::thread fThread;
    RTSemaphore fThreadSem;
    volatile bool fThreadQuit = false;

    bool fComputationIsActive = false;
    bool fComputationStarts = false;
    volatile bool fEditorVisible = false; // written by editor

    DISTRHO_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR(PluginSpectralAnalyzer)
};
