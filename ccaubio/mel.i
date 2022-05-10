%{
#include "ccaubio.h"
%}

namespace aubio
{
    struct MelFilterBank
    {
        aubio_filterbank_t * fb;

        MelFilterBank(uint32_t nfilters, uint32_t win_s);
        ~MelFilterBank() ;

        size_t set_triangle_bands(const FVec & freqs, double samplerate);
        size_t set_mel_coeffs_slaney( double samplerate);
        size_t set_mel_coeffs( double samplerate, double fmin, double fmax);
        size_t set_mel_coeffs_htk( double samplerate, double fmin, double fmax);
    };


    struct MFCC
    {
        aubio_mfcc_t * mfcc; 

        MFCC(size_t buf_size, uint32_t nfilters, size_t size_coeffs, uint32_t samplerate);
        ~MFCC();

        void process(const CVec &in, FVec & out);
        size_t set_power(double power);
        double get_power();
        size_t set_scale(double power);
        double get_scale();

        size_t set_mel_coeffs(double fmin, double fmax);
        size_t set_mel_coeffs_htk(double fmin, double fmax);
        size_t set_mel_coeffs_slaney();
    };
}