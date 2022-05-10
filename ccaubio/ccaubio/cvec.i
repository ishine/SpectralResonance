%{
#include "ccaubio.h"
%}

namespace aubio 
{
    struct CVec
    {
        cvec_t * cvec;

        CVec(size_t len);
        CVec(cvec_t * c);
        ~CVec();

        CVec& operator = (const CVec & a);
        
        void copy(const CVec & a);

        void norm_zeros();
        void norm_ones();
        void phas_set_all(Sample v);
        void phas_zeros();
        void phas_ones();
        void zeros();
        void logmag(Sample lambda);

        size_t size() const;
        
        void norm_set_sample( Sample v, size_t p);
        void phas_set_sample( Sample v, size_t p);
        
        Sample norm_get_sample(size_t p);
        Sample phas_get_sample(size_t p);
        
        Buffer<Sample> norm_get_data();
        Buffer<Sample> phas_get_data();
    };
}