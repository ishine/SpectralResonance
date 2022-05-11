%module phase_vocoder
%{
extern "C" {
#include "phase_vocoder.h"
#include "stb_fft.h"
}
%}

%include "stdint.i"
%include "std_vector.i"

%template(float_vector) std::vector<float>;

%ignore phase_modulo;
%include "phase_vocoder.h"
%include "stb_fft.h"
