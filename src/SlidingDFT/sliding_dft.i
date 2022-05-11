%module sliding_dft
%{
#include "sliding_dft.hpp"
%}
%include "std_vector.i"
%template(float_vector) std::vector<float>;
%include "sliding_dft.hpp"
