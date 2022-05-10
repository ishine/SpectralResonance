%{
#include "ccaubio.h"
%}

namespace aubio
{
    struct Source {
        aubio_source_t * source;

        Source(const char * uri, uint32_t samplerate, uint32_t hop_size);
        ~Source();

        uint32_t process(FVec & read_to);
        uint32_t process_multi(FMat & read_to);

        uint32_t get_samplerate();
        uint32_t get_channels();

        uint32_t seek(uint32_t pos);
        uint32_t get_duration();
    };

    struct SourceSoundFile 
    {        
        aubio_source_sndfile_t * file; 

        SourceSoundFile(const char * uri, uint32_t samplerate, size_t hop_size);
        ~SourceSoundFile();

        size_t process(FVec & read_to);
        size_t multi_process(FMat & read_to);
        uint32_t get_samplerate();
        uint32_t get_channels();
        uint64_t seek(size_t pos);
        uint32_t get_duration();
        uint32_t close();

    };

    struct SourceWavFile 
    {        
        aubio_source_wavread_t * file; 

        SourceWavFile(const char * uri, uint32_t samplerate, size_t hop_size);
        ~SourceWavFile();

        size_t process(FVec & read_to);
        size_t multi_process(FMat & read_to);
        uint32_t get_samplerate();
        uint32_t get_channels();
        uint64_t seek(size_t pos);
        uint32_t get_duration();
        uint32_t close();

    };
}