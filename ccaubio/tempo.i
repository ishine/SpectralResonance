%{
#include "ccaubio.h"
%}

namespace aubio
{
    struct Tempo
    {
        aubio_tempo_t * tempo;

        Tempo(const char * method, size_t buf_size, uint32_t hop_size, uint32_t samplerate);
        ~Tempo();

        void process(const FVec &in, FVec & out);
        size_t get_last();
        double get_last_s() ;
        double get_last_ms();
        size_t set_silence(double silence);
        double get_silence();
        size_t set_threshold(double threshold);
        double get_threshold();
        double get_period();
        double get_period_s();
        double get_bpm();
        double get_confidence();
        size_t get_set_tatum_signature(uint_t x);
        size_t was_tatum();
        double get_last_tatum();
        double get_delay();
        double get_delay_s();
        double get_delay_ms();
        size_t set_delay(int delay);
        size_t set_delay_s(int delay);
        size_t set_delay_ms(int delay);
    };
}