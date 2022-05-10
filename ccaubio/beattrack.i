%{
#include "ccaubio.h"
%}

namespace aubio
{
    struct BeatTrack 
    {
        aubio_beattracking_t * bt;

        BeatTrack(size_t winlen, uint32_t hop_size, uint32_t samplerate);
        ~BeatTrack();

        void process(const FVec & dfframes, FVec & out);
        double get_period();
        double get_period_s();
        double get_bpm();
        double get_confidence();
    };
}