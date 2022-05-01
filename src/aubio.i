%module aubio 
%{
#define AUBIO_UNSTABLE 1
#include "aubio.h"
#include "stdlite.h"
#include <cassert>
#include <vector>

using namespace Std;

%}

%include "stdlite.i"


%constant const char * sdesc_complex = "complex";
%constant const char * sdesc_energy = "energy";
%constant const char * sdesc_hfc = "hfc";
%constant const char * sdesc_kl = "kl";
%constant const char * sdesc_mkl = "mkl";
%constant const char * sdesc_phase = "phase";
%constant const char * sdesc_specdiff = "specdiff";
%constant const char * sdesc_wphase = "wphase";
%constant const char * sdesc_centroid = "centroid";
%constant const char * sdesc_decrease = "decrease";
%constant const char * sdesc_kurtosis = "kurtosis";
%constant const char * sdesc_rolloff = "rolloff";
%constant const char * sdesc_skewness = "skewness";
%constant const char * sdesc_slope = "slope";
%constant const char * sdesc_spread = "spread";

%constant const char * rectangle_window = "rectangle";
%constant const char * hamming_window = "hamming";
%constant const char * hanning_window = "hanning";
%constant const char * hanningz_window = "hanningz";
%constant const char * blackman_window = "blackman";
%constant const char * blackman_harris_window = "blackman_harris";
%constant const char * gaussian_window = "gaussian";
%constant const char * welch_window = "welch";
%constant const char * parzen_window = "parzen";
%constant const char * default_window = "default";

%constant const char* pitch_mcomb = "mcomb";
%constant const char* pitch_yinfast = "yinfast";
%constant const char* pitch_yinfft = "yinfft";
%constant const char* pitch_yin = "yin";
%constant const char* pitch_schmitt = "scmitt";
%constant const char* pitch_fcomb = "fcomb";
%constant const char* pitch_specacf = "specacf";
%constant const char* pitch_default = "default";

//%include "ccaubio.h"
%include "types.h"
%include "fvec.h"
%include "cvec.h"
%include "lvec.h"
%include "musicutils.h"
%include "temporal/resampler.h"
%include "temporal/filter.h"
%include "temporal/biquad.h"
%include "temporal/a_weighting.h"
%include "temporal/c_weighting.h"
%include "spectral/fft.h"
%include "spectral/dct.h"
%include "spectral/phasevoc.h"
%include "spectral/filterbank_mel.h"
%include "spectral/filterbank.h"
%include "spectral/mfcc.h"
%include "spectral/awhitening.h"
%include "spectral/tss.h"
%include "spectral/specdesc.h"
%include "pitch/pitch.h" 
%include "tempo/tempo.h"
%include "io/source.h"
%include "io/sink.h"
%include "synth/wavetable.h"
%include "utils/parameter.h"
%include "utils/log.h"
%include "mathutils.h"
%include "io/source_sndfile.h"
//%include "io/source_apple_audio.h"
%include "io/source_avcodec.h"
%include "io/source_wavread.h"
%include "io/sink_sndfile.h"
//%include "io/sink_apple_audio.h"
%include "io/sink_wavwrite.h"
//%include "io/audio_unit.h"
%include "onset/peakpicker.h"
%include "pitch/pitchmcomb.h"
%include "pitch/pitchyin.h"
%include "pitch/pitchyinfft.h"
%include "pitch/pitchyinfast.h"
%include "pitch/pitchschmitt.h"
%include "pitch/pitchfcomb.h"
%include "pitch/pitchspecacf.h"
%include "tempo/beattracking.h"
%include "effects/pitchshift.h"
%include "effects/timestretch.h"
%include "utils/scale.h"
%include "utils/hist.h"

