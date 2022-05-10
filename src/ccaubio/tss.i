%{
#include "ccaubio.h"
%}

namespace aubio
{
    struct TSS 
    {
        aubio_tss_t *tss;

        TSS(size_t buf_size, uint32_t hop_size);
        ~TSS();

        void process(const CVec & in, CVec & out, CVec & stead);
        size_t set_threshold(double thrs);
        size_t set_alpha(double alpha);
        size_t set_beta(double beta);
    };

}