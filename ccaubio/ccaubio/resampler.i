%{
#include "ccaubio.h"
%}

namespace aubio
{
    enum ResamplerType
    {
        SRC_SINC_BEST_QUALITY		= 0,
        SRC_SINC_MEDIUM_QUALITY		= 1,
        SRC_SINC_FASTEST			= 2,
        SRC_ZERO_ORDER_HOLD			= 3,
        SRC_LINEAR					= 4,
    } ;

    struct Resampler
    {
        aubio_resampler_t * resampler;

        Resampler(Sample ratio, ResamplerType type);        
        ~Resampler();

        void process(const FVec & input, FVec & output);        
    };
}