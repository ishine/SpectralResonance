#include "SignalConverter.hpp"
#include "utility.hpp"

namespace sbash64::phase_vocoder {
template <typename T>
void SignalConverterImpl<T>::expand(const_signal_type<T> x, signal_type<T> y) {
    const auto P{size(y) / size(x)};
    zero(y);
    for (index_type i{0}; i < size(x); ++i)
        element(y, i * P) = element(x, i);
}

template <typename T>
void SignalConverterImpl<T>::decimate(
    const_signal_type<T> x, signal_type<T> y) {
    const auto Q{size(x) / size(y)};
    for (index_type i{0}; i < size(y); ++i)
        element(y, i) = element(x, i * Q);
}

template class SignalConverterImpl<double>;
template class SignalConverterImpl<float>;
}
