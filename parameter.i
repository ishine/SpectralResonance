%{
#include "essentia.h"
#include "parameter.h"
%}

namespace essentia 
{
    class Parameter 
    {    
    public:

        enum ParamType {
            UNDEFINED,

            REAL,
            STRING,
            BOOL,
            INT,
            STEREOSAMPLE,

            VECTOR_REAL,
            VECTOR_STRING,
            VECTOR_BOOL,
            VECTOR_INT,
            VECTOR_STEREOSAMPLE,

            VECTOR_VECTOR_REAL,
            VECTOR_VECTOR_STRING,
            VECTOR_VECTOR_STEREOSAMPLE,

            VECTOR_MATRIX_REAL,

            MAP_VECTOR_REAL,
            MAP_VECTOR_STRING,
            MAP_VECTOR_INT,
            MAP_REAL,

            MATRIX_REAL
        };

        Parameter(ParamType tp);

        
        Parameter (const std::string& x);
        Parameter (const essentia::Real x);
        Parameter (const bool x);
        Parameter (const int x);
        Parameter (const double x);
        Parameter (const uint x);
        Parameter (const StereoSample& x);
        Parameter(const char* x);

        
        Parameter(const std::vector<Real>& v);
        Parameter(const std::vector<std::string>& v);
        Parameter(const std::vector<bool>& v);
        Parameter(const std::vector<int>& v);
        Parameter(const std::vector<StereoSample>& v);
        Parameter(const std::vector<std::vector<Real>>& v);
        Parameter(const std::vector<std::vector<std::string>>& v);
        Parameter(const std::vector<std::vector<StereoSample >>& v);
        Parameter(const Parameter& p);
        Parameter(const Parameter* p);
        ~Parameter();

        void clear();
        Parameter& operator=(const Parameter& p);
        bool operator==(const Parameter& p) const;
        bool operator!=(const Parameter& p) const;
        //ParamType type() const;
        bool isConfigured() const;
        std::string toString(int precision = 12) const;
        std::string toLower() const;

        bool toBool() const;
        double toDouble() const;
        float toFloat() const;
        StereoSample toStereoSample() const;

        int toInt() const;
        Real toReal() const;

        std::vector<Real> toVectorReal() const;
        std::vector<std::string> toVectorString() const;
        std::vector<int> toVectorInt() const;
        std::vector<bool> toVectorBool() const;
        std::vector<StereoSample> toVectorStereoSample() const;

        std::vector<std::vector<Real>> toVectorVectorReal() const;
        std::vector<std::vector<std::string>> toVectorVectorString() const;
        std::vector<std::vector<StereoSample>> toVectorVectorStereoSample() const;
        
        std::map<std::string,std::vector<Real>> toMapVectorReal() const;
        std::map<std::string,std::vector<std::string>> toMapVectorString() const;
        std::map<std::string,std::vector<int>> toMapVectorInt() const;
        std::map<std::string,Real> toMapReal() const;
        
        TNT::Array2D<Real> toMatrixReal() const;
    };

    class ParameterMap 
    {
    public:
    void add(const std::string& name, const Parameter& value);

    const Parameter& operator[](const std::string& key) const;
    Parameter& operator[](const std::string& key);
    };
}
