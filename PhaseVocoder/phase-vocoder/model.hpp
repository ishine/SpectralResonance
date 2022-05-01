#ifndef SBASH64_PHASEVOCODER_MODEL_HPP_
#define SBASH64_PHASEVOCODER_MODEL_HPP_

#include <gsl/gsl>
#include <complex>
#include <vector>

namespace sbash64::phase_vocoder {
using index_type = typename gsl::index;

template <typename T> using signal_type = gsl::span<T>;

template <typename T> using const_signal_type = signal_type<const T>;

template <typename T>
using signal_iterator_type = typename signal_type<T>::iterator;

template <typename T>
using const_signal_iterator_type = typename const_signal_type<T>::iterator;

template <typename T>
using signal_reverse_iterator_type = typename signal_type<T>::reverse_iterator;

template <typename T> using complex_type = std::complex<T>;

template <typename T> using complex_signal_type = signal_type<complex_type<T>>;

template <typename T>
using const_complex_signal_type = const_signal_type<complex_type<T>>;

template <typename T> using buffer_type = std::vector<T>;

template <typename T>
using buffer_iterator_type = typename buffer_type<T>::iterator;

template <typename T>
using buffer_reverse_iterator_type = typename buffer_type<T>::reverse_iterator;

template <typename T> using complex_buffer_type = buffer_type<complex_type<T>>;
}

#endif
