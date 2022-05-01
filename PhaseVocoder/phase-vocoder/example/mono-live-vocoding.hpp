#ifndef PHASE_VOCODER_EXAMPLE_MONOLIVEVOCODING_HPP_
#define PHASE_VOCODER_EXAMPLE_MONOLIVEVOCODING_HPP_

#include <portaudio.h>

class PortAudioStreamModifier {
  public:
    virtual ~PortAudioStreamModifier() = default;
    virtual void modify(PaStream *) = 0;
};

void vocodeLiveUsingDefaultAudioDevices(PortAudioStreamModifier &);

#endif
