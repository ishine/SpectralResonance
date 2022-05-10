%{
#include "ccaubio.h"
%}

namespace aubio {
    struct PhaseVocoder 
    {
        aubio_pvoc_t * pvoc; 

        PhaseVocoder(uint32_t win_s, uint32_t hop_s);
        ~PhaseVocoder();

        void forward(const FVec & in, CVec& fftgrain);
        void reverse(const CVec & fftgrain, FVec& out);
        size_t get_win();
        size_t get_hop();

        size_t set_window(const char * window_type);
    };
}