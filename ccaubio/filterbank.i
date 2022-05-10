%{
#include "ccaubio.h"
%}

namespace aubio
{
    struct FilterBank
    {
        aubio_filterbank_t * bank;

        FilterBank(uint32_t nfilters, uint32_t win_s);
        ~FilterBank();

        void process(const CVec & in, FVec & out);
        FMat get_coeffs() ;
        uint32_t set_coeffs(FMat & m);
        uint32_t set_norm(double norm);
        uint32_t set_power(double power);
        double get_power();
    };
}