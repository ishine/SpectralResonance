#include "assert-utility.hpp"
#include <sbash64/phase-vocoder/SampleRateConverter.hpp>
#include <gtest/gtest.h>
#include <string>

namespace sbash64::phase_vocoder {
namespace {
void append(std::string &s, const std::string &what) { s += what; }

template <typename T>
class SampleRateConverterShunt : public SignalConverter<T>, public Filter<T> {
  public:
    [[nodiscard]] auto log() const { return log_; }

    [[nodiscard]] auto decimateInput() const { return decimateInput_; }

    [[nodiscard]] auto expandInput() const { return expandInput_; }

    [[nodiscard]] auto expandOutput() const { return expandOutput_; }

    [[nodiscard]] auto decimateOutput() const { return decimateOutput_; }

    [[nodiscard]] auto filterInput() const { return filterInput_; }

    void decimate(const_signal_type<T> x, signal_type<T> y) override {
        append(log_, "decimate");
        decimateInput_ = x;
        decimateOutput_ = y;
    }

    void expand(const_signal_type<T> x, signal_type<T> y) override {
        expandInput_ = x;
        expandOutput_ = y;
        append(log_, "expand ");
    }

    void filter(signal_type<T> x) override {
        append(log_, "filter ");
        filterInput_ = x;
    }

  private:
    const_signal_type<T> decimateInput_;
    const_signal_type<T> expandInput_;
    signal_type<T> expandOutput_;
    signal_type<T> decimateOutput_;
    signal_type<T> filterInput_;
    std::string log_;
};

template <typename T>
class SampleRateConverterShuntFactory : public Filter<T>::Factory {
  public:
    auto make() -> std::shared_ptr<Filter<T>> override { return filter_; }

    explicit SampleRateConverterShuntFactory(std::shared_ptr<Filter<T>> f)
        : filter_{std::move(f)} {}

  private:
    std::shared_ptr<Filter<T>> filter_;
};

constexpr auto P = 3;
constexpr auto hop = 5;

class SampleRateConverterTests : public ::testing::Test {
  protected:
    void convert() { converter.convert(x, y); }

    [[nodiscard]] auto conversionLog() const { return shunt->log(); }

    [[nodiscard]] auto input() const { return x; }

    [[nodiscard]] auto output() const { return y; }

    [[nodiscard]] auto decimateInput() const { return shunt->decimateInput(); }

    [[nodiscard]] auto expandInput() const { return shunt->expandInput(); }

    [[nodiscard]] auto expandOutput() const { return shunt->expandOutput(); }

    [[nodiscard]] auto decimateOutput() const {
        return shunt->decimateOutput();
    }

    [[nodiscard]] auto filterInput() const { return shunt->filterInput(); }

  private:
    std::vector<double> x;
    std::vector<double> y;
    std::shared_ptr<SampleRateConverterShunt<double>> shunt =
        std::make_shared<SampleRateConverterShunt<double>>();
    SampleRateConverterShuntFactory<double> factory{shunt};
    SampleRateConverter<double> converter{P, hop, *shunt, factory};
};

// clang-format off

#define ASSERT_EQUAL(a, b)\
    EXPECT_EQ(a, b)

#define ASSERT_CONVERSION_LOG(a)\
    ASSERT_EQUAL(a, conversionLog())

#define ASSERT_DECIMATE_INPUT_SIZE(a)\
    assertEqual(a, size(decimateInput()))

#define ASSERT_INPUT_PASSED_TO_EXPAND()\
    assertEqual(input(), expandInput())

#define ASSERT_OUTPUT_PASSED_TO_DECIMATE()\
    assertEqual(output(), decimateOutput())

#define ASSERT_EXPAND_OUTPUT_SIZE(a)\
    assertEqual(a, size(expandOutput()))

#define ASSERT_FILTER_INPUT_SIZE(a)\
    assertEqual(a, size(filterInput()))

#define SAMPLE_RATE_CONVERTER_TEST(a)\
    TEST_F(SampleRateConverterTests, a)

SAMPLE_RATE_CONVERTER_TEST(convertPerformsOperationsInOrder) {
    convert();
    ASSERT_CONVERSION_LOG("expand filter decimate");
}

SAMPLE_RATE_CONVERTER_TEST(convertPassesInputToExpand) {
    convert();
    ASSERT_INPUT_PASSED_TO_EXPAND();
}

SAMPLE_RATE_CONVERTER_TEST(convertPassesOutputToDecimate) {
    convert();
    ASSERT_OUTPUT_PASSED_TO_DECIMATE();
}

SAMPLE_RATE_CONVERTER_TEST(convertPassesBufferOfSizeHopTimesPToExpand) {
    convert();
    ASSERT_EXPAND_OUTPUT_SIZE(index_type{3 * 5});
}

SAMPLE_RATE_CONVERTER_TEST(convertPassesBufferOfSizeHopTimesPToFilter) {
    convert();
    ASSERT_FILTER_INPUT_SIZE(index_type{3 * 5});
}

SAMPLE_RATE_CONVERTER_TEST(convertPassesBufferOfSizeHopTimesPToDecimate) {
    convert();
    ASSERT_DECIMATE_INPUT_SIZE(index_type{3 * 5});
}

// clang-format on

}
}
