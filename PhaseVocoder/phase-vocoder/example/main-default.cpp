#include "mono-live-vocoding.hpp"

namespace {
class PortAudioStreamModifierStub : public PortAudioStreamModifier {
  public:
    void modify(PaStream *) override {}
};
}

int main() {
    PortAudioStreamModifierStub streamModifier;
    vocodeLiveUsingDefaultAudioDevices(streamModifier);
}
