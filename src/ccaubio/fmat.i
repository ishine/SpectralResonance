%{
#include "ccaubio.h"
%}

namespace aubio
{
    struct FMat
    {
        fmat_t * m;

        FMat(size_t height, size_t width);
        FMat(fmat_t * q);
        ~FMat();

        Sample get_sample(size_t channel, size_t pos);
        void set_sample(Sample data, size_t channel, size_t pos);
        void get_channel(size_t channel, FVec & output);

        void set_channel_data(size_t channel, const Buffer<Sample> & buffer);
        void set_channel_data(size_t channel, const SampleBuffer<Sample> & buffer);
        Buffer<Sample> get_channel_data(size_t channel);

        size_t size() const;
        size_t rows() const;
        size_t cols() const;

        void resize(size_t h, size_t l);
        void print();
        void set(Sample v);
        void zeros();
        void ones();
        void reverse();
        void weight(const FMat & w);
        
        Sample operator()(size_t h, size_t w);
        FMat& operator = (const FMat & a);
        
        void  copy(const FMat & a) ;

        void  vecmul(const FVec & scale, const FVec & output);

        FVec operator * (const FVec & input);
    };
}