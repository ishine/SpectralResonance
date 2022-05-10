%{
#include "ccaubio.h"
%}

namespace aubio
{
    struct SpecDesc
    {
        aubio_specdesc_t * sd;

        SpecDesc(const char * method, size_t buf_size);
        ~SpecDesc();

        void process(const CVec& fftgrain, FVec & desc);
    };
}