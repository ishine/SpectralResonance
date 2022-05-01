%module af 
%{
#include <cstdint>
#include "af.h"
using namespace ArrayFire;
%}

%include "stdint.i"
%include "std_vector.i"


typedef long long   dim_t;
#define AFDLL

%include<af/defines.h>


#undef AFAPI
#define AFAPI 
#undef AF_DEPRECATED
#define AF_DEPRECATED(x)

%include<af/constants.h>
%include<af/complex.h>
%include<af/dim4.hpp>
%include<af/index.h>
%include<af/seq.h>
%include<af/util.h>
%include<arrayfire.h>
%include<af/random.h>
%include<af/algorithm.h>
%include<af/arith.h>
%include<af/random.h>
%include<af/blas.h>
%include<af/features.h>
%include<af/graphics.h>
%include<af/image.h>
%include<af/lapack.h>
%include<af/ml.h>
%include<af/signal.h>
%include<af/sparse.h>
%include<af/statistics.h>
%include<af/vision.h>


%include "af.h"


%template(float_vector) std::vector<float>;
%template(double_vector) std::vector<double>;

%template(FloatArray) ArrayFire::Array<float>;
%template(DoubleArray) ArrayFire::Array<double>;

//%template(af_complex32) ArrayFire::Array<Complex<float>>;
//%template(af_complex64) ArrayFire::Array<Complex<double>>;

// missing af_write
//%template(af_bool) ArrayFire::Array<bool,b8>;

%template(UInt8Array) ArrayFire::Array<uint8_t>;
%template(Int16Array) ArrayFire::Array<int16_t>;
%template(UInt16Array) ArrayFire::Array<uint16_t>;
%template(Int32Array) ArrayFire::Array<int32_t>;
%template(UInt32Array) ArrayFire::Array<uint32_t>;

// not sure why int64_t is a problem.
%template(Int64Array) ArrayFire::Array<long long int>;
%template(UInt64Array) ArrayFire::Array<unsigned long long int>;

//%template(af_half) ArrayFire::Array<float,fp16>;
//%template(af_float_1d) Array1D<float,f32>;
//%template(af_float_1d) Array2D<float,f32>;


%template(FloatVector) ArrayFire::Vector<float>;
%template(DoubleVector) ArrayFire::Vector<double>;

%template(FloatMatrix) ArrayFire::Matrix<float>;
%template(DoubleMatrix) ArrayFire::Matrix<double>;

%inline %{

    void  set_float(float * p, size_t i, float v) { p[i] = v; }
    float get_float(float * p, size_t i) { return p[i]; }
%}