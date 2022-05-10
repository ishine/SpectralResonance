%{
#include "ccaubio.h"
%}

namespace aubio
{
    typedef float Sample;
    
    template<typename T> 
    struct BufferBase {
        T *      buffer;
        size_t   len;

        BufferBase();
        BufferBase(T * p, size_t n);
        BufferBase(size_t n);
        virtual ~BufferBase();

        T& operator[](size_t i);
        T  __getitem(size_t i);
        void    __setitem(size_t i, const T s);

        BufferBase<T>& operator = (const BufferBase<T> & s);
        void copy(const BufferBase<T> & s);
        void copy(const T * p, size_t len);
    };

    template<typename T>
    struct SampleBuffer : public BufferBase<T> {
        
        SampleBuffer();
        SampleBuffer(size_t len);
        ~SampleBuffer();

        SampleBuffer<T>& operator = (const SampleBuffer<T> & s);
    };

    template<typename T>
    struct Buffer : public BufferBase<T> 
    {
        Buffer();
        Buffer(T * p, size_t n);
        Buffer(size_t size);

        Buffer<T>& operator = (const Buffer<T> & s);
    };

    inline Sample mean(FVec & s);
    inline Sample max(FVec & s);
    inline Sample min(FVec & s);
    inline uint32_t min_elem(FVec & s);
    inline uint32_t max_elem(FVec & s);
    inline void shift(FVec & s);
    inline void ishift(FVec & s);
    inline void push(FVec & s, Sample new_elem);
    inline Sample sum(FVec & s);
    inline Sample local_hfc(FVec & s);
    inline Sample alpha_norm(FVec & s, Sample p);
    inline void alpha_normalise(FVec & s, Sample p);
    inline void add(FVec & v, Sample c);
    inline void mul(FVec & v, Sample c);
    inline void remove_min(FVec & v);
    inline Sample moving_threshold(FVec & v, FVec & tmp, uint32_t post, uint32_t pre, uint32_t pos);
    inline void adapt_threshold(FVec & v, FVec & tmp, uint32_t post, uint32_t pre);
    inline Sample median(FVec & v);
    inline Sample quadratic_peak_pos(FVec & x, uint32_t p);
    inline Sample quadratic_peak_mag(FVec &x, Sample p);
    inline Sample quadfrac(Sample s0, Sample s1, Sample s2, Sample s3);
    inline Sample peakpick(FVec & v, uint32_t p);
    inline bool is_power_of_two(uint32_t x);
    inline uint32_t next_power_of_two(uint32_t x);
    inline uint32_t power_of_two_order(uint32_t x);
    inline void autocorr(FVec & input, FVec & output);

}
