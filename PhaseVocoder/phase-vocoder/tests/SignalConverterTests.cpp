#include "assert-utility.hpp"
#include <sbash64/phase-vocoder/SignalConverter.hpp>
#include <gtest/gtest.h>

namespace sbash64::phase_vocoder {
namespace {
class SignalConverterTests : public ::testing::Test {
  protected:
    void assertExpanded(const std::vector<double> &x, index_type P,
        const std::vector<double> &y) {
        std::vector<double> expanded(x.size() * gsl::narrow_cast<size_t>(P), 1);
        converter.expand(x, expanded);
        assertEqual(y, expanded);
    }

    void assertDecimated(const std::vector<double> &x, index_type Q,
        const std::vector<double> &y) {
        std::vector<double> decimated(x.size() / gsl::narrow_cast<size_t>(Q));
        converter.decimate(x, decimated);
        assertEqual(y, decimated);
    }

  private:
    SignalConverterImpl<double> converter;
};

// clang-format off

TEST_F(SignalConverterTests, extractsEveryQthElement) {
    assertDecimated(
        { 1, 0, 0, 2, 0, 0, 3, 0, 0, 4, 0, 0, 5, 0, 0 },
        3,
        { 1, 2, 3, 4, 5 }
    );
}

TEST_F(SignalConverterTests, insertsPMinusOneZeros) {
    assertExpanded(
        { 1, 2, 3, 4, 5 },
        3,
        { 1, 0, 0, 2, 0, 0, 3, 0, 0, 4, 0, 0, 5, 0, 0 }
    );
}

TEST_F(SignalConverterTests, insertsNoZerosWhenPIsOne) {
    assertExpanded(
        { 1, 2, 3, 4, 5 },
        1,
        { 1, 2, 3, 4, 5 }
    );
}

// clang-format on

}
}
