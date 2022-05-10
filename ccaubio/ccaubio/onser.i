%{
#include "ccaubio.h"
%}

namespace aubio
{

    struct Onset {
        aubio_onset_t * onset;

        Onset(uint32_t buf_size, uint32_t hop_size, uint32_t samplerate);
        ~Onset();

        void process(const FVec & input, FVec & output);
        uint32_t get_last();
        Sample get_last_s();
        Sample get_last_ms();
        uint32_t set_awhitening(uint32_t enable);
        Sample get_awhitening();
        uint32_t set_compression(Sample lambda);
        Sample get_compression();
        uint32_t set_silence(Sample silence);
        Sample get_silence();
        Sample get_thresholded_descriptor();
        uint32_t set_threshold(Sample thresh);
        uint32_t set_minioi(uint32_t minioi);
        uint32_t set_minioi_s(Sample mini);
        uint32_t set_minioi_ms(Sample mini);
        uint32_t set_delay(uint32_t delay);
        uint32_t set_delay_s(Sample delay);
        uint32_t set_delay_ms(Sample ms);
        uint32_t get_minioi();
        Sample get_minioi_ms();
        uint32_t get_delay();
        Sample get_delay_s();
        Sample get_delay_ms();
        Sample get_threshold();
        uint32_t set_default_parameters(const char* onset_mode);
        void reset();
    };
}