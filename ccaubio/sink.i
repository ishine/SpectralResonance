%{
#include "ccaubio.h"
%}

namespace aubio
{
    struct Sink
    {
        aubio_sink_t * sink;

        Sink(const char * uri, uint32_t samplerate);
        ~Sink();

        size_t preset_samplerate(size_t samplerate);
        size_t get_samplerate() ;
        size_t get_channels();
        void process(FVec & write_data, size_t write);
        void process_multi(FMat & write_data,size_t write);
        size_t close();
    };

    enum FormatType {
        FORMAT_WAV,
        FORMAT_AIFF,
        FORMAT_FLAC,
        FORMAT_OGG
    };

    struct SinkSoundFile 
    {
        aubio_sink_sndfile_t * file;

        SinkSoundFile(const char * uri, uint32_t samplerate);
        ~SinkSoundFile();

        uint32_t preset_samplerate(uint32_t samplerate);
        uint32_t preset_channels(uint32_t channels);
        uint32_t get_samplerate();
        uint32_t get_channels();
        void process(FVec & write_data, uint32_t write);
        void do_multi(FMat & write_data, uint32_t write);
    };

    struct SinkWavWrite {
        aubio_sink_wavwrite_t * wav;

        SinkWavWrite(const char* uri, uint32_t samplerate);
        ~SinkWavWrite();

        uint32_t preset_samplerate(uint32_t samplerate);
        uint32_t preset_channels(uint32_t channels);

        uint32_t get_samplerate();
        uint32_t get_channels();
        void process(FVec & write_data, uint32_t write);
        void do_multi(FMat & write_data, uint32_t write);
    };
}