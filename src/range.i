%{
#include "essentia.h"
#include "range.h"
%}

    class Range {
    public:
        virtual ~Range();
        static Range* create(const std::string& s);
        virtual bool contains(const Parameter& param) const = 0;
    };

    class Everything : public Range {
    public:
        virtual bool contains(const Parameter& param) const;
    };

    class Interval : public Range {
    public:
        Interval(const std::string& s);
        virtual ~Interval() {}
        virtual bool contains(const Parameter& param) const;
    };

    class Set : public Range {
    public:
        Set(const std::string& s);
        virtual ~Set();
        virtual bool contains(const Parameter& param) const;
        void test() const;
    };
}
