%{
#include "ccaubio.h"
%}

namespace aubio
{
    struct Pitch
    {
        aubio_pitch_t * p;

        Pitch(const char * method, size_t buf_size, uint32_t hop_size, uint32_t samplerate);
        ~Pitch();

        void process(const FVec  &in, FVec &out);
        size_t set_tolerance(double tol);
        double get_tolerance();
        size_t set_unit(const char * mode);
        size_t set_silence(const Pitch& silence, double s);
        double get_silence();
        double get_confidence();
    };

    struct PitchFComb
    {
        aubio_pitchfcomb_t * pitch;

        PitchFComb(uint32_t buf_size, uint32_t hop_size);
        ~PitchFComb();

        void process(const FVec & input, FVec & output);
    };

    struct PitchMComb
    {
        aubio_pitchmcomb_t * pitch;

        PitchMComb(uint32_t buf_size, uint32_t hop_size);
        ~PitchMComb();

        void process(const CVec & input, FVec & output);
    };

    struct PitchSchmitt
    {
        aubio_pitchschmitt_t * pitch;

        PitchSchmitt(uint32_t buf_size);
        ~PitchSchmitt();

        void process(const FVec & input, FVec & output);
    };

    struct PitchSpecACF
    {
        aubio_pitchspecacf_t * pitch;

        PitchSpecACF(uint32_t buf_size);
        ~PitchSpecACF();

        Sample get_tolerance();
        uint32_t set_tolerance(Sample tol);
        Sample get_confidence();
        void process(const FVec & input, FVec & output);
    };

    struct PitchYin
    {
        aubio_pitchyin_t * pitch;

        PitchYin(uint32_t buf_size);
        ~PitchYin();

        Sample get_tolerance();
        uint32_t set_tolerance(Sample tol);
        Sample get_confidence();
        void process(const FVec & input, FVec & output);
    };

    struct PitchYinFast
    {
        aubio_pitchyinfast_t * pitch;

        PitchYinFast(uint32_t buf_size);
        ~PitchYinFast();

        Sample get_tolerance();
        uint32_t set_tolerance(Sample tol);
        Sample get_confidence();
        void process(const FVec & input, FVec & output);
    };

    struct PitchYinFFT
    {
        aubio_pitchyinfft_t * pitch;

        PitchYinFFT(uint32_t sr, uint32_t buf_size);
        ~PitchYinFFT();

        Sample get_tolerance();
        uint32_t set_tolerance(Sample tol);

        Sample get_confidence();
        void process(const FVec & input, FVec & output);
    };
}