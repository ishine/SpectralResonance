%module phasevocoder
%{
extern "C" {
#include "phasevocoder.h"
}
%}
%include "stdint.i"
%include "std_vector.i"
%template(float_vector) std::vector<float>;
%ignore locate_peaks;
%include "phasevocoder.h"
