#ifndef SBASH64_PHASEVOCODER_INTERPOLATEFRAMES_HPP_
#define SBASH64_PHASEVOCODER_INTERPOLATEFRAMES_HPP_

#include "model.hpp"
#include <vector>
#include <functional>

namespace sbash64::phase_vocoder {
template <typename T> class InterpolateFrames {
  public:
    InterpolateFrames(index_type P, index_type Q, index_type N);
    void add(const_complex_signal_type<T> x);
    auto hasNext() -> bool;
    void next(complex_signal_type<T> x);

  private:
    void accumulatePhaseIfNeeded();
    void updateHasNext();
    auto phaseDifference(const complex_type<T> &, const complex_type<T> &) -> T;
    void transformFrames(buffer_type<T> &,
        const std::function<T(
            const complex_type<T> &a, const complex_type<T> &b)> &);
    auto resampleMagnitude(const complex_type<T> &, const complex_type<T> &)
        -> T;

    using frame_type = complex_buffer_type<T>;
    frame_type previousFrame;
    frame_type currentFrame;
    buffer_type<T> accumulatedPhase;
    buffer_type<T> phaseAdvance;
    buffer_type<T> resampledMagnitude;
    std::vector<bool> patternPhaseSequence;
    std::vector<bool> phaseSequence;
    index_type phaseSequenceHead{0};
    index_type numerator;
    index_type P;
    index_type Q;
    bool hasNext_{};
    bool preliminaryPhaseSequenceComplete{};
};

extern template class InterpolateFrames<float>;
extern template class InterpolateFrames<double>;
}

#endif
