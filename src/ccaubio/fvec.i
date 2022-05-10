%{
#include "ccaubio.h"
%}

namespace aubio
{
    struct FVec 
    {
        fvec_t * pvec;

        FVec(const FVec & c);
        FVec(fvec_t * p);
        FVec(size_t len);
        ~FVec();

        FVec& operator = (const FVec & v);

        void copy(const FVec & v);
        void weighted_copy( const FVec & in, const FVec & w);

        Sample get_sample(uint_t position);
        void   set_sample(uint_t pos, Sample v);
        Sample& operator[](size_t index);
        Sample __getitem(size_t index);
        void   __setitem(size_t index, Sample value);

        size_t size() const;

        void resize(size_t n);

        Buffer<Sample> get_data();
        void set_data(const Buffer<Sample> & v);
        void set_data(const SampleBuffer<Sample> & v);

        void print();
        void setall(Sample v);
        void zeros();
        void ones();
        void reverse();
        void weight(FVec & v);
        
        Sample zero_crossing_rate();
        Sample level_lin();
        Sample db_spl();
        size_t silence_detection(Sample threshold);
        Sample level_detection(Sample threshold);
        void clamp(Sample absmax);

        void exp();
        void cos();
        void sin();
        void abs();
        void sqrt();
        void log10();
        void log();
        void floor();
        void ceil();
        void round();
        void pow(Sample pow);
    };

    inline FVec*  new_window(char* name, size_t size);
    inline size_t set_window(FVec & window, char * window_type);
    
}