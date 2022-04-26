%module essentia
%{
#include "essentia/types.h"
#include "essentia/essentia.h"
#include "essentia/algorithm.h"
#include "essentia/algorithmfactory.h"
#include "essentia/algorithmfactory_impl.h"
#include "essentia/configurable.h"
#include "essentia/debugging.h"
#include "essentia/iotypewrappers.h"
#include "essentia/parameter.h"
#include "essentia/pool.h"
#include "essentia/range.h"
#include "essentia/streamconnector.h"
#include "essentia/streamutil.h"
#include "essentia/stringutil.h"
#include "essentia/threading.h"
//#include "essentia/scheduler/graphutils.h"
//#include "essentia/scheduler/network.h" 
//#include "essentia/scheduler/networkparser.h"



#include "src/algorithms/standard/autocorrelation.h"
#include "src/algorithms/standard/binaryoperator.h"
#include "src/algorithms/standard/binaryoperatorstream.h"
#include "src/algorithms/standard/bpf.h"
#include "src/algorithms/standard/chromagram.h"
#include "src/algorithms/standard/clipper.h"
#include "src/algorithms/standard/constantq.h"
#include "src/algorithms/standard/crosscorrelation.h"
#include "src/algorithms/standard/cubicspline.h"
#include "src/algorithms/standard/dct.h"
#include "src/algorithms/standard/derivative.h"
#include "src/algorithms/standard/envelope.h"
#include "src/algorithms/standard/fftacomplex.h"
#include "src/algorithms/standard/ffta.h"
#include "src/algorithms/standard/fftkcomplex.h"
#include "src/algorithms/standard/fftk.h"
#include "src/algorithms/standard/fftwcomplex.h"
#include "src/algorithms/standard/fftw.h"
#include "src/algorithms/standard/framecutter.h"
#include "src/algorithms/standard/frametoreal.h"
#include "src/algorithms/standard/idct.h"
#include "src/algorithms/standard/ifftacomplex.h"
#include "src/algorithms/standard/iffta.h"
#include "src/algorithms/standard/ifftkcomplex.h"
#include "src/algorithms/standard/ifftk.h"
#include "src/algorithms/standard/ifftwcomplex.h"
#include "src/algorithms/standard/ifftw.h"
#include "src/algorithms/standard/maxfilter.h"
#include "src/algorithms/standard/minmax.h"
#include "src/algorithms/standard/monomixer.h"
#include "src/algorithms/standard/multiplexer.h"
#include "src/algorithms/standard/noiseadder.h"
#include "src/algorithms/standard/nsgconstantq.h"
#include "src/algorithms/standard/nsgconstantqstreaming.h"
#include "src/algorithms/standard/nsgiconstantq.h"
#include "src/algorithms/standard/overlapadd.h"
#include "src/algorithms/standard/peakdetection.h"
#include "src/algorithms/standard/pooltotensor.h"
#include "src/algorithms/standard/powerspectrum.h"
#include "src/algorithms/standard/realaccumulator.h"
#include "src/algorithms/standard/replaygain.h"
#include "src/algorithms/standard/resample.h"
#include "src/algorithms/standard/scale.h"
#include "src/algorithms/standard/silencerate.h"
#include "src/algorithms/standard/slicer.h"
#include "src/algorithms/standard/spectrumCQ.h"
#include "src/algorithms/standard/spectrum.h"
#include "src/algorithms/standard/spline.h"
#include "src/algorithms/standard/startstopsilence.h"
#include "src/algorithms/standard/stereodemuxer.h"
#include "src/algorithms/standard/stereomuxer.h"
#include "src/algorithms/standard/stereotrimmer.h"
#include "src/algorithms/standard/tensornormalize.h"
#include "src/algorithms/standard/tensortopool.h"
#include "src/algorithms/standard/tensortovectorreal.h"
#include "src/algorithms/standard/tensortranspose.h"
#include "src/algorithms/standard/trimmer.h"
#include "src/algorithms/standard/unaryoperator.h"
#include "src/algorithms/standard/unaryoperatorstream.h"
#include "src/algorithms/standard/vectorrealaccumulator.h"
#include "src/algorithms/standard/vectorrealtotensor.h"
#include "src/algorithms/standard/viterbi.h"
#include "src/algorithms/standard/warpedautocorrelation.h"
#include "src/algorithms/standard/welch.h"
#include "src/algorithms/standard/windowing.h"

using namespace essentia;
using namespace essentia::standard;
%}

#define ESSENTIA_API
%ignore streaming;
%include "essentia/types.h"
%include "essentia/essentia.h"
%include "essentia/algorithm.h"
%include "essentia/algorithmfactory.h"
%include "essentia/algorithmfactory_impl.h"
%include "essentia/configurable.h"
%include "essentia/debugging.h"
%include "essentia/iotypewrappers.h"
%include "essentia/parameter.h"
%include "essentia/pool.h"
%include "essentia/range.h"
%include "essentia/streamconnector.h"
%include "essentia/streamutil.h"
%include "essentia/stringutil.h"
%include "essentia/threading.h"
//%include "essentia/scheduler/graphutils.h"
//%include "essentia/scheduler/network.h"
//%include "essentia/scheduler/networkparser.h"


%include "src/algorithms/standard/autocorrelation.h"
%include "src/algorithms/standard/binaryoperator.h"
%include "src/algorithms/standard/binaryoperatorstream.h"
%include "src/algorithms/standard/bpf.h"
%include "src/algorithms/standard/chromagram.h"
%include "src/algorithms/standard/clipper.h"
%include "src/algorithms/standard/constantq.h"
%include "src/algorithms/standard/crosscorrelation.h"
%include "src/algorithms/standard/cubicspline.h"
%include "src/algorithms/standard/dct.h"
%include "src/algorithms/standard/derivative.h"
%include "src/algorithms/standard/envelope.h"
%include "src/algorithms/standard/fftacomplex.h"
%include "src/algorithms/standard/ffta.h"
%include "src/algorithms/standard/fftkcomplex.h"
%include "src/algorithms/standard/fftk.h"
%include "src/algorithms/standard/fftwcomplex.h"
%include "src/algorithms/standard/fftw.h"
%include "src/algorithms/standard/framecutter.h"
%include "src/algorithms/standard/frametoreal.h"
%include "src/algorithms/standard/idct.h"
%include "src/algorithms/standard/ifftacomplex.h"
%include "src/algorithms/standard/iffta.h"
%include "src/algorithms/standard/ifftkcomplex.h"
%include "src/algorithms/standard/ifftk.h"
%include "src/algorithms/standard/ifftwcomplex.h"
%include "src/algorithms/standard/ifftw.h"
%include "src/algorithms/standard/maxfilter.h"
%include "src/algorithms/standard/minmax.h"
%include "src/algorithms/standard/monomixer.h"
%include "src/algorithms/standard/multiplexer.h"
%include "src/algorithms/standard/noiseadder.h"
%include "src/algorithms/standard/nsgconstantq.h"
%include "src/algorithms/standard/nsgconstantqstreaming.h"
%include "src/algorithms/standard/nsgiconstantq.h"
%include "src/algorithms/standard/overlapadd.h"
%include "src/algorithms/standard/peakdetection.h"
%include "src/algorithms/standard/pooltotensor.h"
%include "src/algorithms/standard/powerspectrum.h"
%include "src/algorithms/standard/realaccumulator.h"
%include "src/algorithms/standard/replaygain.h"
%include "src/algorithms/standard/resample.h"
%include "src/algorithms/standard/scale.h"
%include "src/algorithms/standard/silencerate.h"
%include "src/algorithms/standard/slicer.h"
%include "src/algorithms/standard/spectrumCQ.h"
%include "src/algorithms/standard/spectrum.h"
%include "src/algorithms/standard/spline.h"
%include "src/algorithms/standard/startstopsilence.h"
%include "src/algorithms/standard/stereodemuxer.h"
%include "src/algorithms/standard/stereomuxer.h"
%include "src/algorithms/standard/stereotrimmer.h"
%include "src/algorithms/standard/tensornormalize.h"
%include "src/algorithms/standard/tensortopool.h"
%include "src/algorithms/standard/tensortovectorreal.h"
%include "src/algorithms/standard/tensortranspose.h"
%include "src/algorithms/standard/trimmer.h"
%include "src/algorithms/standard/unaryoperator.h"
%include "src/algorithms/standard/unaryoperatorstream.h"
%include "src/algorithms/standard/vectorrealaccumulator.h"
%include "src/algorithms/standard/vectorrealtotensor.h"
%include "src/algorithms/standard/viterbi.h"
%include "src/algorithms/standard/warpedautocorrelation.h"
%include "src/algorithms/standard/welch.h"
%include "src/algorithms/standard/windowing.h"
