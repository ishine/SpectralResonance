#include "mono-live-vocoding.hpp"
#include "FftwTransform.hpp"
#include <sbash64/phase-vocoder/PhaseVocoder.hpp>
#include <portaudio.h>
#include <gsl/gsl>
#include <algorithm>
#include <iostream>
#include <cstdio>

template <typename T> static void zero(gsl::span<T> x) {
    std::fill(begin(x), end(x), T{0});
}

template <typename T>
static void copy(gsl::span<const T> source, gsl::span<T> destination) {
    std::copy(begin(source), end(source), begin(destination));
}

template <typename T>
static auto vocode(const void *opaqueInput, void *opaqueOutput,
    unsigned long framesPerBuffer, const PaStreamCallbackTimeInfo *,
    PaStreamCallbackFlags, void *vocoder) -> int {
    auto *output = static_cast<T *>(opaqueOutput);
    const auto *input = static_cast<const T *>(opaqueInput);
    if (input == nullptr)
        zero<T>({output, framesPerBuffer});
    else
        copy<T>({input, framesPerBuffer}, {output, framesPerBuffer});
    static_cast<sbash64::phase_vocoder::PhaseVocoder<T> *>(vocoder)->vocode(
        {output, framesPerBuffer});

    return paContinue;
}

void vocodeLiveUsingDefaultAudioDevices(
    PortAudioStreamModifier &streamModifier) {
    constexpr auto framesPerBuffer{1024};
    sbash64::phase_vocoder::FftwTransformer<float>::FftwFactory factory;
    sbash64::phase_vocoder::PhaseVocoder<float> vocoder{
        3, 2, framesPerBuffer, factory};

    Pa_Initialize();

    PaStream *stream{};
    constexpr auto sampleRateHz{48000};
    constexpr auto channels{1};
    constexpr auto inputChannels{channels};
    constexpr auto outputChannels{channels};
    Pa_OpenDefaultStream(&stream, inputChannels, outputChannels, paFloat32,
        sampleRateHz, framesPerBuffer, vocode<float>, &vocoder);
    streamModifier.modify(stream);
    Pa_StartStream(stream);
    std::cout << "Press ENTER to exit: ";
    std::getchar();
    Pa_CloseStream(stream);
    Pa_Terminate();
}
