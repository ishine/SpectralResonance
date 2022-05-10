%{
#include "essentia.h"
#include "configurable.h"    
}

namespace essentia {

    class Configurable {
    public:
        virtual ~Configurable();
        const std::string& name() const;
        void setName(const std::string& name);
        virtual void declareParameters() = 0;
        virtual void setParameters(const ParameterMap& params);
        virtual void configure(const ParameterMap& params);
        virtual void configure();
        const ParameterMap& defaultParameters() const;
        const Parameter& parameter(const std::string& key) const;
    };
}

