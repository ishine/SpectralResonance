#ifndef SBASH64_PHASEVOCODER_UTILITY_HPP_
#define SBASH64_PHASEVOCODER_UTILITY_HPP_

#include "model.hpp"
#include <algorithm>
#include <functional>
#include <vector>

namespace sbash64::phase_vocoder {
template <typename T> auto size(const signal_type<T> &x) -> index_type {
    return x.size();
}

template <typename T> auto size(const const_signal_type<T> &x) -> index_type {
    return x.size();
}

template <typename T>
auto element(const signal_type<T> &x, index_type i) -> T & {
    return at(x, i);
}

template <typename T>
auto element(const const_signal_type<T> &x, index_type i) -> const T & {
    return at(x, i);
}

template <typename T> void zero(signal_type<T> x) {
    std::fill(begin(x), end(x), T{0});
}

template <typename T>
void zero(
    signal_reverse_iterator_type<T> b, signal_reverse_iterator_type<T> e) {
    fill(b, e, T{0});
}

template <typename T>
void zero(buffer_iterator_type<T> b, buffer_iterator_type<T> e) {
    fill(b, e, T{0});
}

template <typename T>
void zero(
    buffer_reverse_iterator_type<T> b, buffer_reverse_iterator_type<T> e) {
    fill(b, e, T{0});
}

template <typename T> void shiftLeft(signal_type<T> x, index_type n) {
    for (index_type i{0}; i < size(x) - n; ++i)
        element(x, i) = element(x, i + n);
    zero<T>(rbegin(x), rbegin(x) + n);
}

template <typename T>
void addFirstToSecond(const_signal_type<T> x, signal_type<T> y) {
    transform(begin(y), end(y), begin(x), begin(y), std::plus<>{});
}

template <typename T>
void multiplyFirstToSecond(const_signal_type<T> x, signal_type<T> y) {
    std::transform(begin(y), end(y), begin(x), begin(y), std::multiplies<>{});
}

template <typename T>
void copyFirstToSecond(const_signal_iterator_type<T> sourceBegin,
    const_signal_iterator_type<T> sourceEnd,
    signal_iterator_type<T> destination) {
    std::copy(sourceBegin, sourceEnd, destination);
}

template <typename T>
void copyFirstToSecond(
    const_signal_type<T> source, signal_type<T> destination) {
    copyFirstToSecond<T>(begin(source), end(source), begin(destination));
}

template <typename T>
void copyFirstToSecond(
    const_signal_type<T> source, signal_type<T> destination, index_type n) {
    copyFirstToSecond<T>(begin(source), begin(source) + n, begin(destination));
}

template <typename T>
void transform(const complex_buffer_type<T> &first,
    const complex_buffer_type<T> &second, buffer_type<T> &out,
    std::function<T(const complex_type<T> &, const complex_type<T> &)> f) {
    transform(begin(first), end(first), begin(second), begin(out), f);
}
}

#endif
