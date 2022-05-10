%{
#include "ccaubio.h"
%}

namespace aubio
{
    struct DCT
    {
        aubio_dct_t * dct; 

        DCT(uint32_t size);
        ~DCT();

        void forward( const FVec & input, const FVec &output);
        void reverse( const FVec & input, const FVec &output);
    };

}