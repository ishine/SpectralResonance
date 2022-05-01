#include "assert-utility.hpp"
#include <sbash64/phase-vocoder/HannWindow.hpp>
#include <gtest/gtest.h>
#include <vector>
#include <cmath>

namespace sbash64::phase_vocoder {
namespace {
auto sixSamples(double a, double b, double c, double d, double e, double f)
    -> std::vector<double> {
    return {a, b, c, d, e, f};
}

auto fiveSamples(double a, double b, double c, double d, double e)
    -> std::vector<double> {
    return {a, b, c, d, e};
}

auto pi() -> double { return std::acos(-1.); }

auto squared(double x) -> double { return x * x; }

auto sinSquared(double x) -> double { return squared(std::sin(x)); }

class HannWindowTests : public ::testing::Test {};

// clang-format off

#define ASSERT_YIELDS_SIX_WINDOW_SAMPLES(a, b, c, d, e, f, g)\
    assertEqual(sixSamples(b, c, d, e, f, g), hannWindow<double>(a), 1e-15)

#define ASSERT_YIELDS_FIVE_WINDOW_SAMPLES(a, b, c, d, e, f)\
    assertEqual(fiveSamples(b, c, d, e, f), hannWindow<double>(a), 1e-15)

#define HANN_WINDOW_TEST(a)\
    TEST_F(HannWindowTests, a)

HANN_WINDOW_TEST(even) {
    ASSERT_YIELDS_SIX_WINDOW_SAMPLES(
        6,
        sinSquared(pi() * 0. / 6.),
        sinSquared(pi() * 1. / 6.),
        sinSquared(pi() * 2. / 6.),
        sinSquared(pi() * 3. / 6.),
        sinSquared(pi() * 4. / 6.),
        sinSquared(pi() * 5. / 6.)
    );
}

HANN_WINDOW_TEST(odd) {
    ASSERT_YIELDS_FIVE_WINDOW_SAMPLES(
        5,
        sinSquared(pi() * 0. / 5.),
        sinSquared(pi() * 1. / 5.),
        sinSquared(pi() * 2. / 5.),
        sinSquared(pi() * 3. / 5.),
        sinSquared(pi() * 4. / 5.)
    );
}

// clang-format on
}
}
