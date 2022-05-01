#include "assert-utility.hpp"
#include <sbash64/phase-vocoder/OverlapAddFilter.hpp>
#include <gtest/gtest.h>

namespace sbash64::phase_vocoder {
namespace {
template <typename T> void copy(const_signal_type<T> x, signal_type<T> y) {
    std::copy(x.begin(), x.end(), y.begin());
}

template <typename T>
void resizeToMatch(std::vector<T> &x, const_signal_type<T> y) {
    x.resize(size(y));
}

template <typename T>
class FourierTransformerStub : public FourierTransformer<T> {
    using complex_buffer_type = std::vector<complex_type<T>>;
    using real_buffer_type = std::vector<T>;
    std::vector<std::vector<T>> dftReals_;
    complex_buffer_type dftComplex_;
    complex_buffer_type idftComplex_;
    real_buffer_type dftReal_;
    real_buffer_type idftReal_;

  public:
    [[nodiscard]] auto dftReal() const { return dftReal_; }

    [[nodiscard]] auto dftReals(size_t n) const { return dftReals_.at(n); }

    [[nodiscard]] auto idftComplex() const { return idftComplex_; }

    void dft(signal_type<T> x, complex_signal_type<T> y) override {
        resizeToMatch<T>(dftReal_, x);
        copy<T>(x, dftReal_);
        copy<complex_type<T>>(dftComplex_, y);
        dftReals_.push_back(dftReal_);
    }

    void setDftComplex(complex_buffer_type x) { dftComplex_ = std::move(x); }

    void setIdftReal(real_buffer_type x) { idftReal_ = std::move(x); }

    void idft(complex_signal_type<T> x, signal_type<T> y) override {
        resizeToMatch<complex_type<T>>(idftComplex_, x);
        copy<complex_type<T>>(x, idftComplex_);
        copy<T>(idftReal_, y);
    }

    class FactoryStub : public FourierTransformer<T>::Factory {
        std::shared_ptr<FourierTransformer<T>> transform;
        index_type N_{};

      public:
        explicit FactoryStub(std::shared_ptr<FourierTransformer<T>> transform)
            : transform{std::move(transform)} {}

        auto make(index_type N)
            -> std::shared_ptr<FourierTransformer<T>> override {
            N_ = N;
            return transform;
        }

        [[nodiscard]] auto N() const { return N_; }
    };
};

class OverlapAddFilterTests : public ::testing::Test {
  protected:
    std::shared_ptr<FourierTransformerStub<double>> fourierTransformer_ =
        std::make_shared<FourierTransformerStub<double>>();
    FourierTransformerStub<double>::FactoryStub factory{fourierTransformer_};
    std::vector<double> b;
    std::vector<double> signal;

    auto construct() -> OverlapAddFilter<double> { return {b, factory}; }

    void assertDftRealEquals(const std::vector<double> &x) {
        assertEqual(x, fourierTransformer_->dftReal());
    }

    void assertIdftComplexEquals(const std::vector<complex_type<double>> &x) {
        assertEqual(x, fourierTransformer_->idftComplex());
    }

    void setTapCount(size_t n) { b.resize(n); }

    void setDftComplex(std::vector<complex_type<double>> x) {
        fourierTransformer_->setDftComplex(std::move(x));
    }

    void setIdftReal(std::vector<double> x) {
        fourierTransformer_->setIdftReal(std::move(x));
    }

    void filter(OverlapAddFilter<double> &overlapAdd) {
        overlapAdd.filter(signal);
    }

    void assertXEquals(const std::vector<double> &x_) {
        assertEqual(x_, signal);
    }

    void resizeX(size_t n) { signal.resize(n); }

    void assertDftRealEquals(const std::vector<double> &x, size_t n) {
        assertEqual(x, fourierTransformer_->dftReals(n));
    }
};

// clang-format off

#define OVERLAP_ADD_FILTER_TEST(a)\
    TEST_F(OverlapAddFilterTests, a)

OVERLAP_ADD_FILTER_TEST(
    constructorCreatesTransformWithSizeGreaterThanTapsNearestPowerTwo
) {
    b = { 1, 2, 3 };
    construct();
    assertEqual(index_type{4}, factory.N());
}

OVERLAP_ADD_FILTER_TEST(
    constructorTransformsTapsZeroPaddedToNearestGreaterPowerTwo
) {
    b = { 1, 2, 3 };
    construct();
    assertDftRealEquals({ 1, 2, 3, 0 });
}

OVERLAP_ADD_FILTER_TEST(filterPassesEachBlockLSamplesToTransformZeroPaddedToN) {
    setTapCount(4 - 1);
    auto overlapAdd = construct();
    signal = { 5, 6, 7, 8, 9, 10 };
    filter(overlapAdd);
    assertDftRealEquals({5, 6, 0, 0}, 1);
    assertDftRealEquals({7, 8, 0, 0}, 2);
    assertDftRealEquals({9, 10, 0, 0}, 3);
}

OVERLAP_ADD_FILTER_TEST(
    filterPassesEachBlockLSamplesToTransformZeroPaddedToN2
) {
    setTapCount(4 - 1);
    auto overlapAdd = construct();
    signal = { 5, 6, 7 };
    filter(overlapAdd);
    assertDftRealEquals({5, 6, 0, 0}, 1);
    assertDftRealEquals({7, 0, 0, 0}, 2);
}

OVERLAP_ADD_FILTER_TEST(filterPassesTransformProductToInverseTransform) {
    setTapCount(8 - 1);
    setDftComplex({ 5, 6, 7, 8, 9 });
    auto overlapAdd = construct();
    setDftComplex({ 11, 12, 13, 14, 15 });
    resizeX(2);
    filter(overlapAdd);
    assertIdftComplexEquals({ 5*11, 6*12, 7*13, 8*14, 9*15 });
}

OVERLAP_ADD_FILTER_TEST(filterOverlapAddsInverseTransform) {
    setTapCount(8 - 1);
    setDftComplex({ 0, 0, 0, 0, 0 });
    auto overlapAdd = construct();
    resizeX(2);
    setIdftReal({5, 6, 7, 8, 9, 10, 11, 12});
    filter(overlapAdd);
    assertXEquals({ 5, 6 });
}

OVERLAP_ADD_FILTER_TEST(filterOverlapAddsInverseTransform2) {
    setTapCount(4 - 1);
    setDftComplex({ 0, 0, 0 });
    auto overlapAdd = construct();
    resizeX(4);
    setIdftReal({5, 6, 7, 8});
    filter(overlapAdd);
    assertXEquals({ 5, 6, 5+7, 6+8 });
}

OVERLAP_ADD_FILTER_TEST(filterOverlapAddsInverseTransform3) {
    setTapCount(4 - 1);
    setDftComplex({ 0, 0, 0 });
    auto overlapAdd = construct();
    resizeX(2);
    setIdftReal({5, 6, 7, 8});
    filter(overlapAdd);
    assertXEquals({ 5, 6 });
    setIdftReal({9, 10, 11, 12});
    filter(overlapAdd);
    assertXEquals({ 9+7, 10+8 });
}

OVERLAP_ADD_FILTER_TEST(filterOverlapAddsInverseTransform4) {
    setTapCount(4 - 1);
    setDftComplex({ 0, 0, 0 });
    auto overlapAdd = construct();
    resizeX(3);
    setIdftReal({5, 6, 7, 8});
    filter(overlapAdd);
    assertXEquals({ 5, 6, 5+7 });
}

OVERLAP_ADD_FILTER_TEST(filterOverlapAddsInverseTransform5) {
    setTapCount(4 - 1);
    setDftComplex({ 0, 0, 0 });
    auto overlapAdd = construct();
    resizeX(3);
    setIdftReal({5, 6, 7, 8});
    filter(overlapAdd);
    assertXEquals({ 5, 6, 5+7 });
    setIdftReal({9, 10, 11, 12});
    filter(overlapAdd);
    assertXEquals({ 6+8+9, 7+10, 8+11+9 });
}
// clang-format on
}
}
