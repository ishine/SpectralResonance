%module keyfinder
%{
#include "keyfinder.h"
using namespace KeyFinder;
%}

%ignore KeyFinder::ChromaTransform::ChromaTransformWrapper;
%ignore KeyFinder::LowPassFilter::LowPassFilterWrapper;
%ignore KeyFinder::TemporalWindow::TemporalWindowWrapper;

%include "constants.h"
//%include "exception.h"
%include "audiodata.h"
%include "binode.h"
%include "chromagram.h"
%include "chromatransformfactory.h"
%include "chromatransform.h"
%include "fftadapter.h"
%include "keyclassifier.h"
%include "lowpassfilterfactory.h"
%include "lowpassfilter.h"
%include "spectrumanalyser.h"
%include "temporalwindowfactory.h"
%include "toneprofiles.h"
%include "windowfunctions.h"
%include "workspace.h"
