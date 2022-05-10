%{
#include "ccaubio.h"
%}

namespace aubio
{
    struct PeakPicker {
        aubio_peakpicker_t * pick;

        PeakPicker();
        ~PeakPicker();

        void process(FVec & in, FVec & out);
        FVec get_thresholded_input();
        uint32_t set_threshold(Sample thresh);
        Sample get_threshold();
    };

}