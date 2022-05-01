#ifndef SBASH64_PHASEVOCODER_SIGNALCONVERTER_HPP_
#define SBASH64_PHASEVOCODER_SIGNALCONVERTER_HPP_

#include "model.hpp"
#include "SampleRateConverter.hpp"

namespace sbash64::phase_vocoder {
template <typename T> class SignalConverterImpl : public SignalConverter<T> {
  public:
    void expand(const_signal_type<T> x, signal_type<T> y) override;
    void decimate(const_signal_type<T> x, signal_type<T> y) override;
};

extern template class SignalConverterImpl<double>;
extern template class SignalConverterImpl<float>;
}

#endif
