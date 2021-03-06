%module qmdsp
%{
#include "base/KaiserWindow.h"
#include "base/Pitch.h"
#include "base/SincWindow.h"
#include "base/Window.h"
#include "base/Restrict.h"
#include "dsp/chromagram/Chromagram.h"
#include "dsp/chromagram/ConstantQ.h"
//#include "dsp/keydetection/GetKeyMode.h"
#include "dsp/mfcc/MFCC.h"
#include "dsp/onsets/DetectionFunction.h"
#include "dsp/onsets/PeakPicking.h"
#include "dsp/phasevocoder/PhaseVocoder.h"
#include "dsp/rateconversion/Decimator.h"
#include "dsp/rateconversion/DecimatorB.h"
#include "dsp/rateconversion/Resampler.h"
#include "dsp/rhythm/BeatSpectrum.h"
#include "dsp/segmentation/ClusterMeltSegmenter.h"
#include "dsp/segmentation/Segmenter.h"
#include "dsp/segmentation/cluster_melt.h"
#include "dsp/segmentation/cluster_segmenter.h"
#include "dsp/segmentation/segment.h"
#include "dsp/signalconditioning/DFProcess.h"
#include "dsp/signalconditioning/FiltFilt.h"
#include "dsp/signalconditioning/Filter.h"
#include "dsp/signalconditioning/Framer.h"
#include "dsp/tempotracking/DownBeat.h"
#include "dsp/tempotracking/TempoTrack.h"
#include "dsp/tempotracking/TempoTrackV2.h"
#include "dsp/tonal/ChangeDetectionFunction.h"
#include "dsp/tonal/TCSgram.h"
#include "dsp/tonal/TonalEstimator.h"
#include "dsp/transforms/DCT.h"
#include "dsp/transforms/FFT.h"
#include "dsp/wavelet/Wavelet.h"
#include "hmm/hmm.h"
#include "maths/Correlation.h"
#include "maths/CosineDistance.h"
#include "maths/KLDivergence.h"
#include "maths/MathAliases.h"
#include "maths/MathUtilities.h"
#include "maths/MedianFilter.h"
#include "maths/Polyfit.h"
#include "maths/nan-inf.h"
#include "maths/pca/pca.h"
%}

%include "std_vector.i"

%include "base/KaiserWindow.h"
%include "base/Pitch.h"
%include "base/SincWindow.h"
%include "base/Window.h"
%include "base/Restrict.h"
%include "dsp/chromagram/Chromagram.h"
%include "dsp/chromagram/ConstantQ.h"
//%include "dsp/keydetection/GetKeyMode.h"
%include "dsp/mfcc/MFCC.h"
%include "dsp/onsets/DetectionFunction.h"
%include "dsp/onsets/PeakPicking.h"
%include "dsp/phasevocoder/PhaseVocoder.h"
%include "dsp/rateconversion/Decimator.h"
%include "dsp/rateconversion/DecimatorB.h"
%include "dsp/rateconversion/Resampler.h"
%include "dsp/rhythm/BeatSpectrum.h"
%include "dsp/segmentation/ClusterMeltSegmenter.h"
%include "dsp/segmentation/Segmenter.h"
%include "dsp/segmentation/cluster_melt.h"
%include "dsp/segmentation/cluster_segmenter.h"
%include "dsp/segmentation/segment.h"
%include "dsp/signalconditioning/DFProcess.h"
%include "dsp/signalconditioning/FiltFilt.h"
%include "dsp/signalconditioning/Filter.h"
%include "dsp/signalconditioning/Framer.h"
%include "dsp/tempotracking/DownBeat.h"
%include "dsp/tempotracking/TempoTrack.h"
%include "dsp/tempotracking/TempoTrackV2.h"
%include "dsp/tonal/ChangeDetectionFunction.h"
%include "dsp/tonal/TCSgram.h"
%include "dsp/tonal/TonalEstimator.h"
%include "dsp/transforms/DCT.h"
%include "dsp/transforms/FFT.h"
%include "dsp/wavelet/Wavelet.h"
%include "hmm/hmm.h"
%include "maths/Correlation.h"
%include "maths/CosineDistance.h"
%include "maths/KLDivergence.h"
%include "maths/MathAliases.h"
%include "maths/MathUtilities.h"
%include "maths/MedianFilter.h"
%include "maths/Polyfit.h"
%include "maths/nan-inf.h"
%include "maths/pca/pca.h"
