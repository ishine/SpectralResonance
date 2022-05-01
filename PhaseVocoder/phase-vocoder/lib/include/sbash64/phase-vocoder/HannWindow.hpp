#ifndef SBASH64_PHASEVOCODER_HANNWINDOW_HPP_
#define SBASH64_PHASEVOCODER_HANNWINDOW_HPP_

#include "model.hpp"
#include <vector>

namespace sbash64::phase_vocoder {
template <typename T> auto hannWindow(index_type N) -> std::vector<T>;

extern template auto hannWindow<double>(index_type N) -> std::vector<double>;
extern template auto hannWindow<float>(index_type N) -> std::vector<float>;
}

#endif
