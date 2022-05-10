%{
#include "ccaubio.h"
%}

namespace aubio
{
    struct Histogram
    {
        aubio_hist_t * hist;

        Histogram(Sample flow, Sample fhig, uint32_t nelems);
        ~Histogram();

        void process(FVec & input);
        void process_notnull(FVec & input);
        Sample hist_mean();
        void hist_weight();
        void dyn_notnull(FVec & input);
    };

}