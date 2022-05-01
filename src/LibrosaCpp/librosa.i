%module librosa
%{
#include "librosa.h"
%}
%include "../std_complex.i"
%include "std_vector.i"

%template(float_complex) std::complex<float>;
%template(float_vector)  std::vector<float>;
%template(float_matrix)  std::vector<std::vector<float>>;
%template(complex_matrix)  std::vector<std::vector<std::complex<float>>>;

%include "librosa.h"
