#ifndef SBASH64_PHASEVOCODER_FFTWTRANSFORM_HPP_
#define SBASH64_PHASEVOCODER_FFTWTRANSFORM_HPP_

#include <sbash64/phase-vocoder/utility.hpp>
#include <sbash64/phase-vocoder/OverlapAddFilter.hpp>
#include <fftw3.h>
#include <vector>

namespace sbash64::phase_vocoder {
template <typename T> auto data(std::vector<T> &x) { return x.data(); }

inline auto to_fftw_complex(std::vector<complex_type<float>> &x) -> auto * {
    return reinterpret_cast<fftwf_complex *>(x.data());
}

inline auto make_fftw_plan(int a, float *b, fftwf_complex *c, unsigned int d)
    -> auto * {
    return fftwf_plan_dft_r2c_1d(a, b, c, d);
}

inline auto make_fftw_plan(int a, fftwf_complex *b, float *c, unsigned int d)
    -> auto * {
    return fftwf_plan_dft_c2r_1d(a, b, c, d);
}

template <typename T> class FftwTransformer : public FourierTransformer<T> {
    using complex_buffer_type = std::vector<complex_type<T>>;
    using real_buffer_type = std::vector<T>;
    impl::complex_buffer_type<T> dftComplex;
    impl::complex_buffer_type<T> idftComplex;
    real_buffer_type dftReal;
    real_buffer_type idftReal;
    using is_double = std::is_same<double, T>;
    using fftw_plan_type =
        std::conditional_t<is_double::value, fftw_plan, fftwf_plan>;
    fftw_plan_type dftPlan;
    fftw_plan_type idftPlan;
    using unused_type = std::conditional_t<is_double::value, float, double>;
    index_type N;

  public:
    explicit FftwTransformer(index_type N)
        : dftComplex(N / 2 + 1), idftComplex(N / 2 + 1), dftReal(N),
          idftReal(N), dftPlan{make_fftw_plan(N, data(dftReal),
                           to_fftw_complex(dftComplex), FFTW_ESTIMATE)},
          idftPlan{make_fftw_plan(
              N, to_fftw_complex(idftComplex), data(idftReal), FFTW_ESTIMATE)},
          N{N} {}

    ~FftwTransformer() override {
        fftwf_destroy_plan(dftPlan);
        fftwf_destroy_plan(idftPlan);
    }

    void dft(signal_type<T> x, complex_signal_type<T> y) override {
        impl::copyFirstToSecond<T>(x, dftReal);
        fftwf_execute(dftPlan);
        impl::copyFirstToSecond<complex_type<T>>(dftComplex, y);
    }

    void idft(complex_signal_type<T> x, signal_type<T> y) override {
        impl::copyFirstToSecond<complex_type<T>>(x, idftComplex);
        fftwf_execute(idftPlan);
        impl::copyFirstToSecond<T>(idftReal, y);
        for (auto &y_ : y)
            y_ /= N;
    }

    class FftwFactory : public FourierTransformer<T>::Factory {
      public:
        auto make(index_type N_)
            -> std::shared_ptr<FourierTransformer<T>> override {
            return std::make_shared<FftwTransformer>(N_);
        }
    };
};
}

#endif
