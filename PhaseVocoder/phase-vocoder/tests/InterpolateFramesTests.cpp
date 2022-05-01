#include "assert-utility.hpp"
#include <sbash64/phase-vocoder/model.hpp>
#include <sbash64/phase-vocoder/InterpolateFrames.hpp>
#include <gtest/gtest.h>

namespace sbash64::phase_vocoder {
namespace {
using std::complex_literals::operator""i;

auto magnitude(const complex_type<double> &x) -> double { return std::abs(x); }

auto phase(const complex_type<double> &x) -> double { return std::arg(x); }

auto complex(double magnitude, double radians) -> complex_type<double> {
    return std::polar(magnitude, radians);
}

auto exp(const complex_type<double> &x) -> complex_type<double> {
    return std::exp(x);
}

auto nthPhase(const complex_type<double> &x, index_type n)
    -> complex_type<double> {
    return x * exp(phase(x) * (n - 1) * 1i);
}

auto doublePhase(const complex_type<double> &x) -> complex_type<double> {
    return nthPhase(x, 2);
}

auto triplePhase(const complex_type<double> &x) -> complex_type<double> {
    return nthPhase(x, 3);
}

auto transform(std::vector<complex_type<double>> v,
    complex_type<double> (*f)(const complex_type<double> &))
    -> std::vector<complex_type<double>> {
    std::transform(
        v.begin(), v.end(), v.begin(), [=](auto x) { return (*f)(x); });
    return v;
}

auto doublePhase(std::vector<complex_type<double>> x)
    -> std::vector<complex_type<double>> {
    return transform(std::move(x), doublePhase);
}

auto triplePhase(std::vector<complex_type<double>> x)
    -> std::vector<complex_type<double>> {
    return transform(std::move(x), triplePhase);
}

auto averageMagnitude(
    const complex_type<double> &a, const complex_type<double> &b) -> double {
    return (magnitude(a) + magnitude(b)) / 2;
}

auto summedPhase(const complex_type<double> &a, const complex_type<double> &b)
    -> double {
    return phase(a) + phase(b);
}

auto doublePhaseSecondMinusFirst(
    const complex_type<double> &a, const complex_type<double> &b) -> double {
    return 2 * phase(b) - phase(a);
}

auto magnitudeSecondAndDoublePhaseSecondMinusFirst(
    const complex_type<double> &a, const complex_type<double> &b)
    -> complex_type<double> {
    return complex(magnitude(b), doublePhaseSecondMinusFirst(a, b));
}

auto averageMagnitudesAndPhaseSecond(const complex_type<double> &a,
    const complex_type<double> &b) -> complex_type<double> {
    return complex(averageMagnitude(a, b), phase(b));
}

auto transform(std::vector<complex_type<double>> a,
    const std::vector<complex_type<double>> &b,
    complex_type<double> (*f)(const complex_type<double> &,
        const complex_type<double> &)) -> std::vector<complex_type<double>> {
    std::transform(a.begin(), a.end(), b.begin(), a.begin(),
        [=](auto a_, auto b_) { return (*f)(a_, b_); });
    return a;
}

auto transform(std::vector<complex_type<double>> a,
    const std::vector<complex_type<double>> &b,
    const std::vector<complex_type<double>> &c,
    complex_type<double> (*f)(const complex_type<double> &,
        const complex_type<double> &, const complex_type<double> &))
    -> std::vector<complex_type<double>> {
    for (std::size_t i = 0; i < a.size(); ++i)
        a.at(i) = (*f)(a.at(i), b.at(i), c.at(i));
    return a;
}

auto magnitudeSecondAndDoublePhaseSecondMinusFirst(
    std::vector<complex_type<double>> a,
    const std::vector<complex_type<double>> &b)
    -> std::vector<complex_type<double>> {
    return transform(
        std::move(a), b, magnitudeSecondAndDoublePhaseSecondMinusFirst);
}

auto averageMagnitudesSecondAndThirdAndSumPhasesSecondAndThirdMinusFirst(
    const complex_type<double> &a, const complex_type<double> &b,
    const complex_type<double> &c) -> complex_type<double> {
    return complex(
        (magnitude(b) + magnitude(c)) / 2, phase(b) + phase(c) - phase(a));
}

auto averageMagnitudesSecondAndThirdAndSumPhasesSecondAndThirdMinusFirst(
    std::vector<complex_type<double>> a,
    const std::vector<complex_type<double>> &b,
    const std::vector<complex_type<double>> &c)
    -> std::vector<complex_type<double>> {
    return transform(std::move(a), b, c,
        averageMagnitudesSecondAndThirdAndSumPhasesSecondAndThirdMinusFirst);
}

auto averageMagnitudesAndPhaseSecond(std::vector<complex_type<double>> a,
    const std::vector<complex_type<double>> &b)
    -> std::vector<complex_type<double>> {
    return transform(std::move(a), b, averageMagnitudesAndPhaseSecond);
}

auto halfMagnitudeZeroPhase(std::vector<complex_type<double>> a)
    -> std::vector<complex_type<double>> {
    for (auto &x_ : a)
        x_ = complex(magnitude(x_) / 2, phase(0));
    return a;
}

auto twoThirdsMagnitudeFirstPlusOneThirdSecondAndDoublePhaseFirstPlusSecond(
    const complex_type<double> &a, const complex_type<double> &b)
    -> complex_type<double> {
    return complex(
        (2 * magnitude(a) + magnitude(b)) / 3, 2 * phase(a) + phase(b));
}

auto twoThirdsMagnitudeFirstPlusOneThirdSecondAndDoublePhaseFirst(
    const complex_type<double> &a, const complex_type<double> &b)
    -> complex_type<double> {
    return complex((2 * magnitude(a) + magnitude(b)) / 3, 2 * phase(a));
}

auto twoThirdsMagnitudeThirdPlusOneThirdSecondAndPhaseFirstPlusThird(
    const complex_type<double> &a, const complex_type<double> &b,
    const complex_type<double> &c) -> complex_type<double> {
    return complex((2 * magnitude(c) + magnitude(b)) / 3, phase(a) + phase(c));
}

auto magnitudeSecondAndSummedPhase(const complex_type<double> &a,
    const complex_type<double> &b) -> complex_type<double> {
    return complex(magnitude(b), summedPhase(a, b));
}

auto oneThirdMagnitudeFirstPlusTwoThirdsSecondAndPhaseFirstPlusDoubleSecond(
    const complex_type<double> &a, const complex_type<double> &b)
    -> complex_type<double> {
    return complex(
        (magnitude(a) + 2 * magnitude(b)) / 3, phase(a) + 2 * phase(b));
}

auto magnitudeSecondAndPhaseFirst(const complex_type<double> &a,
    const complex_type<double> &b) -> complex_type<double> {
    return complex(magnitude(b), phase(a));
}

auto averageMagnitudesAndPhaseFirst(const complex_type<double> &a,
    const complex_type<double> &b) -> complex_type<double> {
    return complex(averageMagnitude(a, b), phase(a));
}

auto twoThirdsMagnitudeFirstPlusOneThirdSecondAndDoublePhaseFirst(
    std::vector<complex_type<double>> a,
    const std::vector<complex_type<double>> &b)
    -> std::vector<complex_type<double>> {
    return transform(std::move(a), b,
        twoThirdsMagnitudeFirstPlusOneThirdSecondAndDoublePhaseFirst);
}

auto twoThirdsMagnitudeThirdPlusOneThirdSecondAndPhaseFirstPlusThird(
    std::vector<complex_type<double>> a,
    const std::vector<complex_type<double>> &b,
    const std::vector<complex_type<double>> &c)
    -> std::vector<complex_type<double>> {
    return transform(std::move(a), b, c,
        twoThirdsMagnitudeThirdPlusOneThirdSecondAndPhaseFirstPlusThird);
}

auto magnitudeSecondAndSummedPhase(std::vector<complex_type<double>> a,
    const std::vector<complex_type<double>> &b)
    -> std::vector<complex_type<double>> {
    return transform(std::move(a), b, magnitudeSecondAndSummedPhase);
}

auto twoThirdsMagnitudeFirstPlusOneThirdSecondAndDoublePhaseFirstPlusSecond(
    std::vector<complex_type<double>> a,
    const std::vector<complex_type<double>> &b)
    -> std::vector<complex_type<double>> {
    return transform(std::move(a), b,
        twoThirdsMagnitudeFirstPlusOneThirdSecondAndDoublePhaseFirstPlusSecond);
}

auto oneThirdMagnitudeFirstPlusTwoThirdsSecondAndPhaseFirstPlusDoubleSecond(
    std::vector<complex_type<double>> a,
    const std::vector<complex_type<double>> &b)
    -> std::vector<complex_type<double>> {
    return transform(std::move(a), b,
        oneThirdMagnitudeFirstPlusTwoThirdsSecondAndPhaseFirstPlusDoubleSecond);
}

auto magnitudeSecondAndPhaseFirst(std::vector<complex_type<double>> a,
    const std::vector<complex_type<double>> &b)
    -> std::vector<complex_type<double>> {
    return transform(std::move(a), b, magnitudeSecondAndPhaseFirst);
}

auto averageMagnitudesAndPhaseFirst(std::vector<complex_type<double>> a,
    const std::vector<complex_type<double>> &b)
    -> std::vector<complex_type<double>> {
    return transform(std::move(a), b, averageMagnitudesAndPhaseFirst);
}

class InterpolateFramesFacade {
    InterpolateFrames<double> interpolate;
    index_type N;

  public:
    InterpolateFramesFacade(index_type P, index_type Q, index_type N)
        : interpolate{P, Q, N}, N{N} {}

    void assertYieldsNoFrames(const std::vector<complex_type<double>> &x) {
        add(x);
        assertDoesNotHaveNext();
    }

    void assertInterpolatedFrames(const std::vector<complex_type<double>> &x,
        const std::vector<std::vector<complex_type<double>>> &frames,
        double tolerance) {
        add(x);
        for (const auto &frame : frames) {
            assertHasNext();
            assertNextEquals(frame, tolerance);
        }
        assertDoesNotHaveNext();
    }

    void assertHasNext() { EXPECT_TRUE(hasNext()); }

    void assertDoesNotHaveNext() { EXPECT_FALSE(hasNext()); }

    auto hasNext() -> bool { return interpolate.hasNext(); }

    void add(const std::vector<complex_type<double>> &x) { interpolate.add(x); }

    void consumeAdd(const std::vector<complex_type<double>> &x) {
        add(x);
        while (hasNext())
            next();
    }

    auto next() -> std::vector<complex_type<double>> {
        std::vector<complex_type<double>> out(gsl::narrow_cast<size_t>(N));
        interpolate.next(out);
        return out;
    }

    void assertNextEquals(
        const std::vector<complex_type<double>> &expected, double tolerance) {
        assertEqual(expected, next(), tolerance);
    }
};

void consumeAdd(InterpolateFramesFacade &interpolate,
    const std::vector<complex_type<double>> &x) {
    interpolate.consumeAdd(x);
}

void assertInterpolatedFrames(InterpolateFramesFacade &interpolate,
    const std::vector<complex_type<double>> &x,
    const std::vector<std::vector<complex_type<double>>> &frames,
    double tolerance) {
    interpolate.assertInterpolatedFrames(x, frames, tolerance);
}

void assertYieldsNoFrames(InterpolateFramesFacade &interpolate,
    const std::vector<complex_type<double>> &x) {
    interpolate.assertYieldsNoFrames(x);
}

class InterpolateFramesP1Q1Tests : public ::testing::Test {
    index_type P = 1;
    index_type Q = 1;
    index_type N = 3;
    InterpolateFramesFacade interpolate{P, Q, N};

  protected:
    void assertInterpolatedFrames(const std::vector<complex_type<double>> &x,
        const std::vector<std::vector<complex_type<double>>> &frames,
        double tolerance) {
        phase_vocoder::assertInterpolatedFrames(
            interpolate, x, frames, tolerance);
    }

    void consumeAdd(const std::vector<complex_type<double>> &x) {
        phase_vocoder::consumeAdd(interpolate, x);
    }
};

// clang-format off

TEST_F(
	InterpolateFramesP1Q1Tests,
	interpolatesComplexMagnitudesAndAdvancesPhase
) {
	assertInterpolatedFrames(
		{1. + 2i, 3. + 4i, 5. + 6i},
		{
			{1. + 2i, 3. + 4i, 5. + 6i}
		},
		1e-15
	);
}

TEST_F(
	InterpolateFramesP1Q1Tests,
	interpolatesComplexMagnitudesAndAdvancesPhase2
) {
	consumeAdd({ 1. + 2i, 3. + 4i, 5. + 6i });
	assertInterpolatedFrames(
		{ 7. + 8i, 9. + 10i, 11. + 12i },
		{
			{ 7. + 8i, 9. + 10i, 11. + 12i }
		},
		1e-15
	);
}

TEST_F(
	InterpolateFramesP1Q1Tests,
	interpolatesComplexMagnitudesAndAdvancesPhase3
) {
	consumeAdd({ 1. + 2i, 3. + 4i, 5. + 6i });
	consumeAdd({ 7. + 8i, 9. + 10i, 11. + 12i });
	assertInterpolatedFrames(
		{ 13. + 14i, 15. + 16i, 17. + 18i },
		{
			{ 13. + 14i, 15. + 16i, 17. + 18i }
		},
		1e-15
	);
}

// clang-format on

class InterpolateFramesP1Q2Tests : public ::testing::Test {
    index_type P = 1;
    index_type Q = 2;
    index_type N = 3;
    InterpolateFramesFacade interpolate{P, Q, N};

  protected:
    void assertInterpolatedFrames(const std::vector<complex_type<double>> &x,
        const std::vector<std::vector<complex_type<double>>> &frames,
        double tolerance) {
        phase_vocoder::assertInterpolatedFrames(
            interpolate, x, frames, tolerance);
    }

    void consumeAdd(const std::vector<complex_type<double>> &x) {
        phase_vocoder::consumeAdd(interpolate, x);
    }
};

// clang-format off

TEST_F(
	InterpolateFramesP1Q2Tests,
	interpolatesComplexMagnitudesAndAdvancesPhase
) {
	assertInterpolatedFrames(
		{1. + 2i, 3. + 4i, 5. + 6i},
		{
			halfMagnitudeZeroPhase({1. + 2i, 3. + 4i, 5. + 6i}),
			{1. + 2i, 3. + 4i, 5. + 6i}
		},
		1e-15
	);
}

TEST_F(
	InterpolateFramesP1Q2Tests,
	interpolatesComplexMagnitudesAndAdvancesPhase2
) {
	consumeAdd({ 1. + 2i, 3. + 4i, 5. + 6i });
	assertInterpolatedFrames(
		{ 7. + 8i, 9. + 10i, 11. + 12i },
		{
			averageMagnitudesAndPhaseSecond(
				{ 1. + 2i, 3. + 4i, 5. + 6i },
				{ 7. + 8i, 9. + 10i, 11. + 12i }
			),
			magnitudeSecondAndDoublePhaseSecondMinusFirst(
				{ 1. + 2i, 3. + 4i, 5. + 6i },
				{ 7. + 8i, 9. + 10i, 11. + 12i }
			),
		},
		1e-15
	);
}

TEST_F(
	InterpolateFramesP1Q2Tests,
	interpolatesComplexMagnitudesAndAdvancesPhase3
) {
	consumeAdd({ 1. + 2i, 3. + 4i, 5. + 6i });
	consumeAdd({ 7. + 8i, 9. + 10i, 11. + 12i });
	assertInterpolatedFrames(
		{ 13. + 14i, 15. + 16i, 17. + 18i },
		{
			averageMagnitudesSecondAndThirdAndSumPhasesSecondAndThirdMinusFirst(
                { 1. + 2i, 3. + 4i, 5. + 6i },
				{ 7. + 8i, 9. + 10i, 11. + 12i },
				{ 13. + 14i, 15. + 16i, 17. + 18i }
			),
			magnitudeSecondAndDoublePhaseSecondMinusFirst(
                { 1. + 2i, 3. + 4i, 5. + 6i },
				{ 13. + 14i, 15. + 16i, 17. + 18i }
			),
		},
		1e-15
	);
}

// clang-format on

class InterpolateFramesP2Q3Tests : public ::testing::Test {
    index_type P = 2;
    index_type Q = 3;
    index_type N = 3;
    InterpolateFramesFacade interpolate{P, Q, N};

  protected:
    void assertInterpolatedFrames(const std::vector<complex_type<double>> &x,
        const std::vector<std::vector<complex_type<double>>> &frames,
        double tolerance) {
        phase_vocoder::assertInterpolatedFrames(
            interpolate, x, frames, tolerance);
    }

    void consumeAdd(const std::vector<complex_type<double>> &x) {
        phase_vocoder::consumeAdd(interpolate, x);
    }
};

// clang-format off

TEST_F(
	InterpolateFramesP2Q3Tests,
	DISABLED_interpolatesComplexMagnitudesAndAdvancesPhase
) {
	assertInterpolatedFrames(
		{ 1. + 2i, 3. + 4i, 5. + 6i },
		{
			{ 2.*(1. + 2i)/3., 2.*(3. + 4i)/3., 2.*(5. + 6i)/3. }
		},
		1e-15
	);
}

TEST_F(
	InterpolateFramesP2Q3Tests,
	DISABLED_interpolatesComplexMagnitudesAndAdvancesPhase2
) {
	consumeAdd({ 1. + 2i, 3. + 4i, 5. + 6i });
	assertInterpolatedFrames(
		{ 7. + 8i, 9. + 10i, 11. + 12i },
		{
			twoThirdsMagnitudeFirstPlusOneThirdSecondAndDoublePhaseFirst(
				{ 1. + 2i, 3. + 4i, 5. + 6i },
				{ 7. + 8i, 9. + 10i, 11. + 12i }
			),
			magnitudeSecondAndSummedPhase(
				{ 1. + 2i, 3. + 4i, 5. + 6i },
				{ 7. + 8i, 9. + 10i, 11. + 12i }
			)
		},
		1e-15
	);
}

TEST_F(
	InterpolateFramesP2Q3Tests,
	DISABLED_interpolatesComplexMagnitudesAndAdvancesPhase3
) {
	consumeAdd({ 1. + 2i, 3. + 4i, 5. + 6i });
	consumeAdd({ 7. + 8i, 9. + 10i, 11. + 12i });
	assertInterpolatedFrames(
		{ 13. + 14i, 15. + 16i, 17. + 18i },
		{
			twoThirdsMagnitudeThirdPlusOneThirdSecondAndPhaseFirstPlusThird(
				{ 1. + 2i, 3. + 4i, 5. + 6i },
				{ 7. + 8i, 9. + 10i, 11. + 12i },
				{ 13. + 14i, 15. + 16i, 17. + 18i }
			)
		},
		1e-15
	);
}

// clang-format on

class InterpolateFramesP1Q3Tests : public ::testing::Test {
    index_type P = 1;
    index_type Q = 3;
    index_type N = 3;
    InterpolateFramesFacade interpolate{P, Q, N};

  protected:
    void assertInterpolatedFrames(const std::vector<complex_type<double>> &x,
        const std::vector<std::vector<complex_type<double>>> &frames,
        double tolerance) {
        phase_vocoder::assertInterpolatedFrames(
            interpolate, x, frames, tolerance);
    }

    void consumeAdd(const std::vector<complex_type<double>> &x) {
        phase_vocoder::consumeAdd(interpolate, x);
    }
};

// clang-format off

TEST_F(
	InterpolateFramesP1Q3Tests,
	interpolatesComplexMagnitudesAndAdvancesPhase
) {
	assertInterpolatedFrames(
		{ 1. + 2i, 3. + 4i, 5. + 6i },
		{
			{ (1. + 2i)/3., (3. + 4i)/3., (5. + 6i)/3. },
			doublePhase({ 2.*(1. + 2i)/3., 2.*(3. + 4i)/3., 2.*(5. + 6i)/3. }),
			triplePhase({ 1. + 2i, 3. + 4i, 5. + 6i })
		},
		1e-15
	);
}

TEST_F(
	InterpolateFramesP1Q3Tests,
	interpolatesComplexMagnitudesAndAdvancesPhase2
) {
	consumeAdd({ 1. + 2i, 3. + 4i, 5. + 6i });
	assertInterpolatedFrames(
		{ 7. + 8i, 9. + 10i, 11. + 12i },
		{
			twoThirdsMagnitudeFirstPlusOneThirdSecondAndDoublePhaseFirstPlusSecond(
				{ 1. + 2i, 3. + 4i, 5. + 6i },
				{ 7. + 8i, 9. + 10i, 11. + 12i }
			),
			oneThirdMagnitudeFirstPlusTwoThirdsSecondAndPhaseFirstPlusDoubleSecond(
				{ 1. + 2i, 3. + 4i, 5. + 6i },
				{ 7. + 8i, 9. + 10i, 11. + 12i }
			),
			triplePhase({ 7. + 8i, 9. + 10i, 11. + 12i })
		},
		1e-15
	);
}

// clang-format on

class InterpolateFramesP2Q1Tests : public ::testing::Test {
    index_type P = 2;
    index_type Q = 1;
    index_type N = 3;
    InterpolateFramesFacade interpolate{P, Q, N};

  protected:
    void assertInterpolatedFrames(const std::vector<complex_type<double>> &x,
        const std::vector<std::vector<complex_type<double>>> &frames,
        double tolerance) {
        phase_vocoder::assertInterpolatedFrames(
            interpolate, x, frames, tolerance);
    }

    void assertYieldsNoFrames(const std::vector<complex_type<double>> &x) {
        phase_vocoder::assertYieldsNoFrames(interpolate, x);
    }

    void consumeAdd(const std::vector<complex_type<double>> &x) {
        phase_vocoder::consumeAdd(interpolate, x);
    }
};

// clang-format off

TEST_F(
	InterpolateFramesP2Q1Tests,
    interpolatesComplexMagnitudesAndAdvancesPhase
) {
	assertInterpolatedFrames(
		{ 1. + 2i, 3. + 4i, 5. + 6i },
		{
			{ 1. + 2i, 3. + 4i, 5. + 6i }
		},
		1e-15
	);
}

TEST_F(
	InterpolateFramesP2Q1Tests,
	interpolatesComplexMagnitudesAndAdvancesPhase2
) {
	consumeAdd({ 1. + 2i, 3. + 4i, 5. + 6i });
	assertYieldsNoFrames({ 7. + 8i, 9. + 10i, 11. + 12i });
	assertInterpolatedFrames(
		{ 13. + 14i, 15. + 16i, 17. + 18i },
		{
			magnitudeSecondAndPhaseFirst(
				{ 7. + 8i, 9. + 10i, 11. + 12i },
				{ 13. + 14i, 15. + 16i, 17. + 18i }
			)
		},
		1e-15
	);
}

// clang-format on

class InterpolateFramesP3Q2Tests : public ::testing::Test {
    index_type P = 3;
    index_type Q = 2;
    index_type N = 3;
    InterpolateFramesFacade interpolate{P, Q, N};

  protected:
    void assertInterpolatedFrames(const std::vector<complex_type<double>> &x,
        const std::vector<std::vector<complex_type<double>>> &frames,
        double tolerance) {
        phase_vocoder::assertInterpolatedFrames(
            interpolate, x, frames, tolerance);
    }

    void assertYieldsNoFrames(const std::vector<complex_type<double>> &x) {
        phase_vocoder::assertYieldsNoFrames(interpolate, x);
    }

    void consumeAdd(const std::vector<complex_type<double>> &x) {
        phase_vocoder::consumeAdd(interpolate, x);
    }
};

// clang-format off

TEST_F(
	InterpolateFramesP3Q2Tests,
	interpolatesComplexMagnitudesAndAdvancesPhase
) {
	assertInterpolatedFrames(
		{ 1. + 2i, 3. + 4i, 5. + 6i },
		{
			{ 1. + 2i, 3. + 4i, 5. + 6i }
		},
		1e-15
	);
}

TEST_F(
	InterpolateFramesP3Q2Tests,
	interpolatesComplexMagnitudesAndAdvancesPhase2
) {
	consumeAdd({ 1. + 2i, 3. + 4i, 5. + 6i });
	assertYieldsNoFrames({ 7. + 8i, 9. + 10i, 11. + 12i });
	assertInterpolatedFrames(
		{ 13. + 14i, 15. + 16i, 17. + 18i },
		{
			averageMagnitudesAndPhaseFirst(
				{ 7. + 8i, 9. + 10i, 11. + 12i },
				{ 13. + 14i, 15. + 16i, 17. + 18i }
			)
		},
		1e-15
	);
}

// clang-format on
}
}
