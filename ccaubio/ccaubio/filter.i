%{
#include "ccaubio.h"
%}

namespace aubio
{
    struct Filter 
    {
        aubio_filter_t  *filter;

        Filter();
        Filter(uint32_t order);
        ~Filter();

        void process(FVec & input);
        void do_outplace(const FVec & in, FVec & out);
        void do_filtfilt(FVec & input, FVec & temp);
        LVec& get_feedback(LVec & vec);
        LVec&  get_feedforward(LVec & vec);
        uint32_t get_order();
        uint32_t get_samplerate();
        void set_samplerate(uint32_t samplerate);
        void do_reset();
    };

    struct BiQuad : public Filter
    {
        BiQuad(double b0, double b1, double b2, double a1, double a2);

        void set_biquad(double b0, double b1, double b2, double a1, double a2);        
    };

}