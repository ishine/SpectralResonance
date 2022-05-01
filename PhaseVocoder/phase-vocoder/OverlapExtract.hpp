#ifndef SBASH64_PHASEVOCODER_OVERLAPEXTRACT_HPP_
#define SBASH64_PHASEVOCODER_OVERLAPEXTRACT_HPP_

#include "model.hpp"

namespace sbash64::phase_vocoder {
template <typename T> class OverlapExtract {
  public:
    OverlapExtract(index_type N, index_type hop);
    void add(const_signal_type<T>);
    auto hasNext() -> bool;
    void next(signal_type<T>);

  private:
    buffer_type<T> buffer;
    const_signal_type<T> onDeck;
    index_type head;
    index_type hop;
    index_type N;
};

extern template class OverlapExtract<index_type>;
extern template class OverlapExtract<float>;
extern template class OverlapExtract<double>;
}

#endif
