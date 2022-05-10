%{
#include "ccaubio.h"
%}

namespace aubio
{
    struct Sampler
    {
        aubio_sampler_t * sampler;

        Sampler(uint32_t samplerate, size_t hop_size);
        ~Sampler();

        uint32_t load(const char * uri);
        void process(const FVec & input, FVec & output);
        void process_multi(const FMat & input, FMat & output);
    };
}