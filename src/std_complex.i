%{
#include <complex>
%}

namespace std 
{
    template<typename T>
    class complex {
    public:        
        complex(const T& re = T(), const T& im = T());        
        complex(const complex<T>& other);

        T real() const;
        T imag() const;
        void real(T re);
        void imag(T im);

        complex<T>& operator = (const complex<T> &b) { *$self = b; return *this; }

        %extend {
            complex<T> __add__(const complex<T> &b) { return *$self + b; }
            complex<T> __sub__(const complex<T> &b) { return *$self - b; }
            complex<T> __div__(const complex<T> &b) { return *$self / b; }        
            complex<T> __mul__(const complex<T> &b) { return *$self * b; }
            complex<T> __pow__(const complex<T> &b) { return std::pow(*$self,b); }
            complex<T> __pow__(const T &b) { return std::pow(*$self,b); }
            bool       __eq__(const complex<T> &b) { return *$self == b; }
            //bool       __lt__(const complex<T> &b) { return *$self < b; }
            //bool       __le__(const complex<T> &b) { return *$self <= b; }
        }

    };

    template<typename T> T real(const complex<T> & z);
    template<typename T> T imag(const complex<T> & z);

    template<typename T> T abs(const complex<T> & z);
    template<typename T> T arg(const complex<T> & z);
    template<typename T> T norm(const complex<T> & z);
    template<typename T> T proj(const complex<T> & z);
    template<typename T> T polar(const complex<T> * r, const T& theta=T());

    template<typename T> T exp(const complex<T> & z);
    template<typename T> T log(const complex<T> & z);
    template<typename T> T log10(const complex<T> & z);
    template<typename T> T pow(const complex<T>& x, const complex<T> & z);
    template<typename T> T pow(const complex<T>& x, const T& z);
    template<typename T> T pow(const T& x, const complex<T> & z);

    template<typename T> T sqrt(const complex<T> & z);
    
    template<typename T> T sin(const complex<T> & z);
    template<typename T> T cos(const complex<T> & z);
    template<typename T> T tan(const complex<T> & z);

    template<typename T> T asin(const complex<T> & z);
    template<typename T> T acos(const complex<T> & z);
    template<typename T> T atan(const complex<T> & z);

    template<typename T> T sinh(const complex<T> & z);
    template<typename T> T cosh(const complex<T> & z);
    template<typename T> T tanh(const complex<T> & z);

    template<typename T> T asinh(const complex<T> & z);
    template<typename T> T acosh(const complex<T> & z);
    template<typename T> T atanh(const complex<T> & z);
};