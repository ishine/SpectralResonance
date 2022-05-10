%{
#include "ccaubio.h"
%}

namespace aubio
{
    struct FFT
    {
        aubio_fft_t  *fft;

        FFT(uint32_t size);
        ~FFT();

        void forward(const FVec & input, CVec & spectrum);
        void reverse(const CVec & spectrum, FVec & output);
        void forward_complex(const FVec & input, FVec & compspec);
        void inverse_complex(const FVec & compspec, FVec & output);
        static void get_spectrum( const FVec & compspec, CVec & spectrum);
        static void get_realimag( const CVec & spectrum, FVec & compspec);
        static void get_phase( const FVec & compspec, CVec & spectrum);
        static void get_imaginary( const CVec & spectrum, FVec & compspec);
        static void get_norm(const FVec & compspec, CVec & spectrum);
        static void get_real(const CVec & spectrum, FVec & compspec);
    };
}