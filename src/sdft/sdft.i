%module sdft
%{
#include "sdft.h"
%}
%include "std_vector.i"
%template(float_vector) std::vector<float>;
%include "sdft.h"
