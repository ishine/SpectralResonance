%module audiofft
%{
#include "AudioFFT.h"
#include <vector>
using namespace audiofft;
%}

%include "std_vector.i"
%template(float_vector) std::vector<float>;

%include "AudioFFT.h"
