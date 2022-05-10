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
}
