%{
#include "essentia.h"
#include "connector.h"
%}

namespace essentia::streaming
{

    class Connector{
    Connector(Algorithm* parent = 0, const std::string& name = "Unnamed");
    Connector(const std::string& name);
    const Algorithm* parent() const;
    Algorithm* parent();
    void setParent(Algorithm* parent);
    std::string parentName() const;
    std::string fullName() const;

    };
} // namespace essentia