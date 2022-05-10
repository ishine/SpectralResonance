%{
#include "ccaubio.h"
%}

namespace aubio
{
    struct Notes {
        aubio_notes_t * notes;

        Notes(uint32_t buf_size, uint32_t hop_size, uint32_t sample_rate);
        ~Notes();

        void process(const FVec & input, FVec & output);
        uint32_t set_silence(Sample silence);
        Sample get_silence();
        Sample get_minioi_ms();
        uint32_t set_minitoi_ms(Sample minioi_ms);
        uint32_t release_drop(Sample release_drop);
    };
}