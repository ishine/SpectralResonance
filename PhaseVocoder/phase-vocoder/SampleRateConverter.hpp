#ifndef SBASH64_PHASEVOCODER_SAMPLERATECONVERTER_HPP_
#define SBASH64_PHASEVOCODER_SAMPLERATECONVERTER_HPP_

#include "model.hpp"
#include <memory>

namespace sbash64::phase_vocoder {
template <typename T> class SignalConverter {
  public:
    virtual ~SignalConverter() = default;
    virtual void expand(const_signal_type<T>, signal_type<T>) = 0;
    virtual void decimate(const_signal_type<T>, signal_type<T>) = 0;
};

template <typename T> class Filter {
  public:
    virtual ~Filter() = default;
    virtual void filter(signal_type<T>) = 0;

    class Factory {
      public:
        virtual ~Factory() = default;
        virtual auto make() -> std::shared_ptr<Filter> = 0;
    };
};

template <typename T> class SampleRateConverter {
  public:
    SampleRateConverter(index_type P, index_type hop,
        SignalConverter<T> &converter, typename Filter<T>::Factory &factory)
        : buffer(P * hop), filter{factory.make()}, converter{converter} {}

    void convert(const_signal_type<T> x, signal_type<T> y) {
        converter.expand(x, buffer);
        filter->filter(buffer);
        converter.decimate(buffer, y);
    }

  private:
    buffer_type<T> buffer;
    std::shared_ptr<Filter<T>> filter;
    SignalConverter<T> &converter;
};
}

#endif
