#include "HannWindow.hpp"
#include "utility.hpp"
#include <algorithm>
#include <vector>
#include <cmath>

namespace sbash64::phase_vocoder {
template <typename T> auto pi() -> T { return std::acos(T{-1}); }

template <typename T> auto hannWindow(index_type N) -> std::vector<T> {
    std::vector<T> window(N);
    std::generate(begin(window), end(window), [=, n = 0]() mutable {
        return T{0.5} * (1 - std::cos(2 * pi<T>() * n++ / N));
    });
    return window;
}

template auto hannWindow<double>(index_type N) -> std::vector<double>;
template auto hannWindow<float>(index_type N) -> std::vector<float>;
}
