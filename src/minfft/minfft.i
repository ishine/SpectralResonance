%module minfft
%{
#include "minfft.h"
%}
%include "std_vector.i"
%template(float_vector) std::vector<float>;
%include "minfft.h"
