%{
#include "ccaubio.h"
%}

namespace aubio
{
    struct LVec 
    {
        lvec_t * pvec;

        LVec(size_t len);
        LVec(lvec_t * p);
        
        ~LVec();
        
        double get_sample(uint_t position);
        void   set_sample(uint_t pos, double v);
        
        double& operator[](size_t index);
        double __getitem(size_t index);
        void  __setitem(size_t index, double value);

        Buffer<double> get_data();

        void set_data(const Buffer<double> & v);
        
        void set_data(const SampleBuffer<double> & v);
            
        void print();
        void setall(double v);
        void zeros();
        void ones();
    };
}