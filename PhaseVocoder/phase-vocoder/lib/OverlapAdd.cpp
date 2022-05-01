#include "OverlapAdd.hpp"
#include "utility.hpp"

namespace sbash64::phase_vocoder {
template <typename T> OverlapAdd<T>::OverlapAdd(index_type N) : buffer(N) {}

template <typename T> void OverlapAdd<T>::add(const_signal_type<T> x) {
    addFirstToSecond<T>(x, buffer);
}

template <typename T> void OverlapAdd<T>::next(signal_type<T> y) {
    copyFirstToSecond<T>(buffer, y, size(y));
    shiftLeft<T>(buffer, size(y));
}

template class OverlapAdd<double>;
template class OverlapAdd<float>;
}
