%{
#include "ccaubio.h"    
%}

namespace aubio
{
    struct AWeighting : public Filter
    {
        AWeighting(uint32_t samplerate);

        size_t set_a_weighting(uint32_t samplerate);
    };

    struct CWeighting : public Filter
    {
        CWeighting(uint32_t samplerate);

        size_t set_c_weighting(uint32_t samplerate);
    };
}