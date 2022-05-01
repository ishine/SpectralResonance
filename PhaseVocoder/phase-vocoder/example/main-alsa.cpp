#include "mono-live-vocoding.hpp"
#include <pa_linux_alsa.h>

namespace {
class EnablesRealtimeSchedulingForAlsa : public PortAudioStreamModifier {
  public:
    void modify(PaStream *stream) override {
        PaAlsa_EnableRealtimeScheduling(stream, 1);
    }
};
}

int main() {
    EnablesRealtimeSchedulingForAlsa streamModifier;
    vocodeLiveUsingDefaultAudioDevices(streamModifier);
}
