%{
#include "ccaubio.h"
%}

namespace aubio
{
    struct AWhitening
    {

        aubio_spectral_whitening_t * w;

        AWhitening(size_t buf_size, uint32_t hop_size, uint32_t samplerate)
        {
            w = new_aubio_spectral_whitening(buf_size,hop_size, samplerate);
            assert(w != NULL);
        }
        ~AWhitening() 
        {
            if(w != NULL) del_aubio_spectral_whitening(w);
        }

        void reset() { aubio_spectral_whitening_reset(w); }
        void set_relax_time(double relax_time )
        {
            aubio_spectral_whitening_set_relax_time(w,relax_time);
        }
        double get_relax_time( )
        {
            return aubio_spectral_whitening_get_relax_time(w);
        }
        void set_floor(double floor )
        {
            aubio_spectral_whitening_set_relax_time(w,floor);
        }
        double get_floor( )
        {
            return aubio_spectral_whitening_get_floor(w);
        }
    };
}