#pragma once 

#include <arrayfire.h>
#include <complex>
#include <iostream>
#include <vector>
#include <cassert>
#include <cstdint>
#include <memory>


#define IDX2F(i,j,M) ((j-1)*(M)+(i)-1)
#define IDX3F(i,j,k,M,N) ((k-1)*(N)+(j-1)*(M)+(i)-1)
#define IDX4F(i,j,k,w,M,N,O) ((w-1)*(O)+(k-1)*(N)+(j-1)*(M)+(i)-1)

namespace ArrayFire {
typedef int array_index;


//////////////////////////////////////////////////////////////////////////
// Dim
//////////////////////////////////////////////////////////////////////////
struct Dim
{
    dim_t d;

    Dim() : d(0) {}
    Dim(dim_t x) : d(x) {}
    

    Dim& operator = (long long dim) {  d = dim; return *this; }
    Dim& operator = (const Dim& dim) { d = dim.d; return *this; }

    long long get_dim() { return d; }
};

//////////////////////////////////////////////////////////////////////////
// Dim4
//////////////////////////////////////////////////////////////////////////
struct Dim4 
{
    af::dim4 dim;

    Dim4() {} 
    Dim4(long long first, long long second=1, long long third=1, long long fourth=1)
      : dim(first,second,third,fourth){}

    Dim4(Dim first, Dim second=1,Dim third=1,Dim fourth=1)
      : dim(first.d,second.d,third.d,fourth.d){}

    
    Dim4(const af::dim4 & d) : dim(d) {} 

    bool operator == (const Dim4 & d) { return dim == d.dim; }
    bool operator != (const Dim4 & d) { return dim != d.dim; }

    long long operator[](const unsigned idx) { return dim[idx]; }

    long long __getitem(const unsigned idx) { return dim[idx]; }
    
    void __setitem(const unsigned idx, long long value) 
    { dim[idx] = value;  }

    Dim elements() { return Dim(dim.elements());}
    Dim ndims() { 
      Dim temp;
      temp.d = (dim.ndims()); 
      return temp;
    }    
    dim_t* get() { return dim.get(); }
};


//////////////////////////////////////////////////////////////////////////
// random engine
//////////////////////////////////////////////////////////////////////////
struct RandomEngine
{
  af::randomEngine re; 

  
  RandomEngine(af::randomEngineType typeIn = AF_RANDOM_ENGINE_DEFAULT, unsigned long long seed = 0) 
  : re(typeIn,seed) {}
  RandomEngine(const RandomEngine & r) : re(r.re) {} 
  RandomEngine(const af::randomEngine & r) : re(r) {} 
  RandomEngine(af_random_engine r) : re(r) {} 

  RandomEngine& operator = (const RandomEngine & r)  
  {
    re = r.re;
    return *this;
  }

  void setType(const af::randomEngineType type) { re.setType(type); }
  af::randomEngineType getType() { return re.getType(); }
  void setSeed(const unsigned long long seed) { re.setSeed(seed); }
  unsigned long long getSeed() { return re.getSeed(); }
  af_random_engine get() const { return re.get(); }
};


//////////////////////////////////////////////////////////////////////////
// seq 
//////////////////////////////////////////////////////////////////////////
struct Seq 
{
    af::seq sq;

    Seq(double len=0): sq(len) {} 
    Seq(double begin, double end, double step=1) : sq(begin,end,step) {} 
    Seq(const af::seq& other, bool is_gfor) : sq(other,is_gfor) {} 
    Seq(const af_seq & s_) : sq(s_) {} 
    Seq(const af::seq & s) : sq(s ) {}
   
    Seq& operator = (const Seq& s) { sq = s.sq; return *this; }

    Seq operator -() { return Seq(-sq); }
    Seq operator +(double x) { return Seq(sq+x);}
    Seq operator -(double x) { return Seq(sq-x);}
    Seq operator *(double x) { return Seq(sq*x);}
   
};


//////////////////////////////////////////////////////////////////////////
// features
//////////////////////////////////////////////////////////////////////////
struct Features 
{
    af::features features; 

    Features() {} 
    Features(const size_t n) : features(n) {} 
    Features(af_features f) : features(f) {} 
    Features(const Features & f) : features(f.features) {} 

    Features& operator = (const Features & f) { features = f.features; return *this; }
    
    // I want to avoid templated functions because of interface.
    // in lua call af_float(f.getX()) it will cput it in an Array<float>
    af::array getX() const { return features.getX(); }
    af::array getY() const { return features.getX(); }
    af::array getScore() const { return features.getScore(); }
    af::array getOritentation() const { return features.getOrientation(); }
    af::array getSize() const { return features.getSize(); }
    af_features get() const { return features.get(); }
};



////////////////////////////////////////////////////////////////////////////
// Array
////////////////////////////////////////////////////////////////////////////
template<typename T>
class Array
{
public:

    af::array array;
    T * p_host;

    inline af::dtype deduce_type()
    {
        if(typeid(T) == typeid(float)) return f32;
        if(typeid(T) == typeid(double)) return f64;
        if(typeid(T) == typeid(std::complex<float>)) return c32;
        if(typeid(T) == typeid(std::complex<double>)) return c64;
        if(typeid(T) == typeid(bool)) return b8;
        if(typeid(T) == typeid(uint8_t)) return u8;
        if(typeid(T) == typeid(int32_t)) return s32;
        if(typeid(T) == typeid(uint32_t)) return u32;
        if(typeid(T) == typeid(int64_t)) return s64;
        if(typeid(T) == typeid(uint64_t)) return u64;
        if(typeid(T) == typeid(int16_t)) return s16;
        if(typeid(T) == typeid(uint16_t)) return u16;
        return f32;
    }

public:

    Array() {
        p_host = nullptr;
    }
    Array(size_t i) {
        af::dtype type = deduce_type();
        array = af::array(i,type);
        p_host = new T[i];
        assert(p_host != NULL);
    }
    Array(size_t i, size_t j) {
        af::dtype type = deduce_type();
        array = af::array(i,j,type);
        p_host = new T[i*j];
        assert(p_host != NULL);
    }
    Array(size_t i, size_t j, size_t k) {
        af::dtype type = deduce_type();
        array = af::array(i,j,k,type);
        p_host = new T[i*j*k];
        assert(p_host != NULL);
    }
    Array(size_t i, size_t j, size_t k, size_t w) {
        af::dtype type = deduce_type();
        array = af::array(i,j,k,w,type);
        p_host = new T[i*j*k*w];
        assert(p_host != NULL);
    }
    Array(size_t i, const T * ptr, af::source src = afHost) {
        array = af::array(i,ptr,src);
        p_host = new T[i];
        assert(p_host != NULL);
    }
    Array(size_t i, size_t j, const T * ptr, af::source src = afHost) {
        array = af::array(i,j,ptr,src);
        p_host = new T[i*j];
        assert(p_host != NULL);
    }
    Array(size_t i, size_t j, size_t k, const T * ptr, af::source src = afHost) {
        array = af::array(i,j,k,ptr,src);
        p_host = new T[i*j*k];
        assert(p_host != NULL);
    }
    Array(size_t i, size_t j, size_t k, size_t w, const T * ptr, af::source src = afHost) {
        array = af::array(i,j,k,w,ptr,src);
        p_host = new T[i*j*k*w];
        assert(p_host != NULL);
    }
    Array(const Dim4 & d, const T & val) {
      array = af::array(d.dim);
      fill(val);
    }
    Array(const af_array handle) : array(handle) {
        int i = M();
        int j = N();
        int k = O();
        int w = P();
        int s = i * (j > 0? j:1) * (k > 0? k:1) * (w > 0? w:1);
        p_host = new T[i*j*k*w];
        assert(p_host != NULL);
    }
    Array(const af::array & in) : array(in) {
        int i = M();
        int j = N();
        int k = O();
        int w = P();
        int s = i * (j > 0? j:1) * (k > 0? k:1) * (w > 0? w:1);
        p_host = new T[i*j*k*w];
        assert(p_host != NULL);
    }
    Array(const Array<T> & a) {
        array = a.array;
    }
    ~Array() {
        if(p_host) delete [] p_host;
    }

//  array

    void download_host() {
      host(p_host);
    }  
    void upload_device() {
      write(p_host,size()*sizeof(T));
    }

    void copy(const Array & a) { array = a.array; }    
    //void copy(const Array & src, size_t idx0, size_t idx1=af::span, size_t idx2=af::span, size_t idx3=af::span ) {
    //  af::copy(array,src.array,idx0,idx1,idx2,idx3);
    //}
    af_array  getarray() { return array.get(); }    
    Dim       elements() const { return Dim(array.elements()); }    
    af::dtype type() const { return array.type(); }
    Dim4      dims() const { return Dim4(array.dims()); }    
    Dim       dims(unsigned dim) const { return Dim(array.dims(dim)); }    
    unsigned  numdims() const { return array.numdims(); }
    size_t    bytes() const { return array.bytes(); }
    //size_t allocated() const { return array.allocated(); }

    size_t    size(size_t d)
    {      
      size_t n = numdims();
      size_t total = M();
      if(N() > 0) total *= N();
      if(O() > 0) total *= O();
      if(P() > 0) total *= P();
      return total;
    }    

    size_t M() { return dims(0).d; }
    size_t N() { return dims(1).d; }
    size_t O() { return dims(2).d; }
    size_t P() { return dims(3).d; }

    void fill(const T & value) {
      download_host();
      for(size_t i = 0; i < size(); i++) array(i) = value;
      upload_device();
    }
    long long size() { return M() * (N()>0? N():1) * (O()>0?O():1) * (P()>0?P():1); }
    T*     host() { return array.host<T>(); }
    T*     device() { return array.device<T>(); }
    void   host(T * p) { array.host(p); }
    void   write(T * p, size_t bytes, af::source src = afHost)
    {      array.write<T>(p,bytes,afHost);    }
    bool isempty() const { return array.isempty(); }
    bool isscalar() const { return array.isscalar(); }
    bool isvector() const { return array.isvector(); }
    bool isrow() const { return array.isrow(); }
    bool iscolumn() const { return array.iscolumn(); }
    bool iscomplex() const { return array.iscomplex(); }
    inline bool isreal() const { return !iscomplex(); }
    bool isdouble() const { return array.isdouble(); }
    bool issingle() const { return array.issingle(); }
    //bool ishalf() const { return array.ishalf(); }

    bool isrealfloating() const { return array.isrealfloating(); }
    bool isfloating() const { return array.isfloating(); }
    bool isinteger() const { return array.isinteger(); }
    bool isbool() const { return array.isbool(); }

    void eval() const { array.eval(); }
    
    Array as(af::dtype type) const { return Array(array.as(type)); }    
    Array t() const { return Array(array.T()); }
    Array h() const { return Array(array.H()); }
    T scalar() const { return array.scalar<T>(); }
    T* device() const { return array.device<T>(); }
    void unlock() const { array.unlock(); }
    void lock() const { array.lock(); }
    //bool isLocked() const { return array.isLocked(); }

    int nonzeros() const { return array.nonzeros(); }

    static void addToEachRow(Array & a,Array & b, Array & c)
    {        for(size_t i = 0; i < a.size(0); i++) c.array(i) = a.array(i) + b.array(0);   }

    T scalar(af::array::array_proxy & ap)
    { return ap.scalar<T>(); }
    
    std::vector<T>& get_vector(std::vector<T> & v, size_t r)
    {
      v.resize(size(1));        
      array.host(v.data());
      return v;
    }
    
    void join(const int dim, const Array & first, const Array & second)
    { array = af::join(dim,first.array, second.array); }
    void join(const int dim, const Array & first, const Array & second, const Array & third)
    { array = af::join(dim,first.array, second.array, third.array); }
    void join(const int dim, const Array & first, const Array & second, const Array & third, const Array & fourth)
    { array = af::join(dim,first.array, second.array, third.array, fourth.array); }

    void moddims(const Dim4 & dims) { array = af::moddims(array,dims.dim); }
    void reorder(const unsigned x, const unsigned y=1, const unsigned z=2, const unsigned w=3)
    { array = af::reorder(array,x,y,z,w); }
    void replace(const Array & cond, const Array & b)
    { af::replace(array,cond.array,b.array); }
    Array select(const Array & cond, const Array & b)
    {      return Array(af::select(cond.array,array,b.array));     }
    Array shift(const int x, const int y=0, const int z=0, const int w=0)
    {     return Array(af::shift(array,x,y,z,w)); }
    Array tile(const unsigned x, const unsigned y =1, const unsigned z=1, const unsigned w=1)
    {   return Array(af::tile(array,x,y,z,w)); }

// cereal
    void readArray(const char * filename, const unsigned index)
    { array = af::readArray(filename,index);  }
    
    void readArray(const char * filename, const char * key, Array<T>& a)
    { array = af::readArray(filename,key);    }
    
    void readArray_check(const char * filename, const char * key, Array<T>& a)
    { array = af::readArray(filename,key);    }

    int saveArray(const char * key, const Array<T> & arr, const char * filename, const bool append=false)    
    {  return af::saveArray(key,array,filename, append);    }
    

// operators 

    Array<T>& operator = (const Array<T>& a) { array = a.array; return *this; }
    
    Array<T> operator + (const Array<T>& a) { return Array<T>(array + a.array); }
    Array<T> operator - (const Array<T>& a) { return Array<T>(array - a.array); }
    Array<T> operator - () { return Array<T>(-array); }
    Array<T> operator * (const Array<T>& a) { return Array<T>(array * a.array); }
    Array<T> operator / (const Array<T>& a) { return Array<T>(array / a.array); }
    Array<T> operator % (const Array<T>& a) { return Array<T>(array % a.array); }

    // won't swig for Lua
    Array<T>& operator += (const Array<T>& a) { array += a.array; return *this; }
    Array<T>& operator -= (const Array<T>& a) { array -= a.array; return *this; }
    Array<T>& operator *= (const Array<T>& a) { array *= a.array; return *this; }
    Array<T>& operator /= (const Array<T>& a) { array /= a.array; return *this; }
    
    Array<T> operator == (const Array<T>&a) { return Array<T>(array == a.array); } 
    Array<T> operator != (const Array<T>&a) { return Array<T>(array != a.array); } 
    Array<T> operator < (const Array<T>&a) { return Array<T>(array  < a.array); } 
    Array<T> operator <= (const Array<T>&a) { return Array<T>(array <= a.array); } 
    Array<T> operator > (const Array<T>&a) { return Array<T>(array  > a.array); } 
    Array<T> operator >= (const Array<T>&a) { return Array<T>(array >= a.array); } 

    // won't swig for Lua
    Array<T> operator && (const Array<T>&a) { return Array<T>(array && a.array); } 
    Array<T> operator || (const Array<T>&a) { return Array<T>(array || a.array); } 
    Array<T> operator | (const Array<T>&a) { return Array<T>(array | a.array); } 
    Array<T> operator & (const Array<T>&a) { return Array<T>(array & a.array); } 
    Array<T> operator ^ (const Array<T>&a) { return Array<T>(array ^ a.array); }     
    Array<T> operator << (const Array<T>&a) { return Array<T>(array << a.array); } 
    Array<T> operator >> (const Array<T>&a) { return Array<T>(array >> a.array); } 

// index
    T operator[](size_t i) {      
      return p_host[i];
    }
    T operator()(size_t i, size_t j) { 
      return p_host[IDX2F(i,j,M())];
    }
    T operator()(size_t i, size_t j, size_t k) { 
      return p_host[IDX3F(i,j,M(),N(),O())];
    }
    T operator()(size_t i, size_t j, size_t k, size_t w) { 
      return p_host[IDX4F(i,j,k,w,M(),N(),O())];
    }
        
    T __getitem(Dim4& index) {
      return p_host[IDX4F(index[0],index[1],index[2],index[3],M(),N(),O())];
    }
    void __setitem(Dim4 &index, T value) {
      p_host[IDX4F(index[0],index[1],index[2],index[3],M(),N(),O())] = value;
    }
    
    T get(size_t i)    {      
      return p_host[i];
    }
    T get(size_t i, size_t j) { 
      return p_host[IDX2F(i,j,M())];
    }
    T get(size_t i, size_t j, size_t k) {
      return p_host[IDX3F(i,j,k,M(),N())];
    }
    T get(size_t i, size_t j, size_t k, size_t l) {
      return p_host[IDX4F(i,j,k,l,M(),N(),O())];
    }
        
    void set(size_t i, const T& v) {
      p_host[i] = v;
    }
    void set(size_t i, size_t j, const T& v) {
      p_host[IDX2F(i,j,M())] = v;
    }
    void set(size_t i, size_t j, size_t k, const T& v)    {     
      p_host[IDX3F(i,j,k,M(),N())] = v;
    }
    void set(size_t i, size_t j, size_t k, size_t l, const T& v) {
      p_host[IDX4F(i,j,k,l,M(),N(),O())] = v;
    }
    
    Array<T> count(const int dim=-1) {return Array<T>(af::count(array,dim)); }
    Array<T> flip(const unsigned dim) { return Array<T>(af::flip(array,dim)); } 

    void print(const char * exp="Array") { af::print(exp,array); }
    void print(const char * exp, const int precision) { af::print(exp,array,precision); }

    Array<T> sort(const unsigned dim=0,const bool isAscending = true)
    { return Array<T>(af::sort(array,dim,isAscending));}


// generators    
    Array<T> iota(const Dim4& dims, const Dim4& tile_dims)
    { return Array<T>(af::iota(dims.dim,tile_dims.dim,deduce_type()));  }


// rows, columns, slice
    Array<T> row(size_t row)
    {
      auto x = array.row(row);
      Array<T> r;
      r.array = x;
      return r;      
    }    
    void row(size_t row, const Array<T>& a) {      
      auto x = array.row(row);      
      x = a.array;   
    }

    Array<T> col(size_t col)    {
      auto x = array.col(col);
      Array<T> r;
      r.array = x;
      return r;
    }
    void col(size_t col, const T& v) {
      auto x = array.col(col);      
      x  = v;    
    }

    Array<T> slice_rows(size_t i,size_t j)    {
      auto x = array.rows(i,j);
      Array<T> r;
      r.array = x;
      return r;
    }

    Array<T> slice_cols(size_t i,size_t j)    {
      auto x = array.cols(i,j);
      Array<T> r;
      r.array = x;
      return r;
    }
    // array is 3d
    Array<T> slice_matrix(size_t index)    {
      auto x = array.slice(index);
      Array<T> r;
      r.array = x;
      return r;
    }
    // array is 4d
    Array<T> slice_matrix(int first, int last) {
      auto x = array.slices(first,last);
      Array<T> r;
      r.array = x;
      return r;    
    }
};



// comparison
template<typename T> Array<T> eq(const Array<T> & lhs, const Array<T> & rhs) { return Array<T>(lhs.array == rhs.array); }
template<typename T> Array<T> neq(const Array<T> & lhs,const Array<T> & rhs){ return Array<T>(lhs.array != rhs.array); }
template<typename T> Array<T> ge(const Array<T> & lhs,const Array<T> & rhs) { return Array<T>(lhs.array >= rhs.array); }
template<typename T> Array<T> gt(const Array<T> & lhs,const Array<T> & rhs) { return Array<T>(lhs.array > rhs.array); }
template<typename T> Array<T> le(const Array<T> & lhs,const Array<T> & rhs) { return Array<T>(lhs.array <= rhs.array); }
template<typename T> Array<T> lt(const Array<T> & lhs,const Array<T> & rhs) { return Array<T>(lhs.array < rhs.array); }

// logic 
template<typename T> Array<T> logical_and(const Array<T> & lhs,const Array<T> & rhs) {return Array<T>(lhs.array && rhs.array); }
template<typename T> Array<T> logical_or(const Array<T> & lhs,const Array<T> & rhs) {return Array<T>(lhs.array || rhs.array); }
template<typename T> Array<T> logical_not(const Array<T> & lhs,const Array<T> & rhs) {return Array<T>(!lhs.array); }


// bitwise
template<typename T> Array<T> bshiftl(const Array<T> & lhs,const Array<T> & rhs) { return Array<T>(lhs.array  << rhs.array); }                            
template<typename T> Array<T> bshiftr(const Array<T> & lhs,const Array<T> & rhs) { return Array<T>(lhs.array  >> rhs.array); }                          
template<typename T> Array<T> bor(const Array<T> & lhs,const Array<T> & rhs) { return Array<T>(lhs.array | rhs.array); }   
template<typename T> Array<T> band(const Array<T> & lhs, const Array<T> & rhs) { return Array<T>(lhs.array & rhs.array); }                            
template<typename T> Array<T> bxor(const Array<T> & lhs, const Array<T> & rhs) { return Array<T>(lhs.array  ^ rhs.array); }    

template<typename T> 
Array<T> bnot(const Array<T> & lhs)    {        
  Array<T> out(lhs);
  af_array t = out.getarray();
  af_bitnot(&t,lhs.getarray());
  out.array = t;
  return out;
}       
// 2's complement
template<typename T> Array<T> twoc(const Array<T> & lhs) {    return Array<T>(bnot(lhs)+1); }                       


// complex
/*
af_err complex(const Array<T> & real, const Array<T> & imag)
{ array = af::complex(real.getarray(),imag.getarray()); }  

af_err complex(const Array<T> & real, const double imag)
{ array = af::complex(real.getarray(),imag); }  

af_err complex(const double real, const Array<T> & imag)
{ array = af::complex(real,imag.getarray()); }  
*/
template<typename T> Array<T> conjg(const Array<T> & a) { return Array<T>(af::conjg(a.array));}
template<typename T> Array<T> imag(const Array<T> & a) { return Array<T>(af::imag(a.array));}
template<typename T> Array<T> real(const Array<T> & a) { return Array<T>(af::real(a.array));}
template<typename T> Array<T> arg(const Array<T> & a) { return Array<T>(af::arg(a.array));}    

// statistics
// compiler doesn't find it
template<typename T>  T corrcoef(const Array<T> & a,const Array<T> & y) { return (af::corrcoef<T>(a.array,y.array)); }
template<typename T>  Array<T>  cov(const Array<T> & a,const Array<T> & y, const bool isbiased=false) { return Array<T>(af::cov(a.array,y.array,isbiased)); }
template<typename T>  Array<T>  cov(const Array<T> & a,const Array<T> & y, const af_var_bias bias) { return Array<T>(af::cov(a.array,y.array,bias)); }
template<typename T>  Array<T>  mean(const Array<T> & a,const long long dim) { return Array<T>(af::mean(a.array,dim)); }
template<typename T>  Array<T>  mean(const Array<T> & a,const Array<T> & w, const long long dim) { return Array<T>(af::mean(a.array,w.array,dim)); }
template<typename T>  T         mean(const Array<T> & a) { return (af::mean<T>(a.array)); }
template<typename T>  T         mean(const Array<T> & a,const Array<T> & w) { return (af::mean<T>(a.array,w.array)); }
template<typename T>  Array<T>  median(const Array<T> & a,const long long dim) { return Array<T>(af::median(a.array,dim)); }
template<typename T>  T         median(const Array<T> & a) { return (af::median<T>(a.array)); }
template<typename T>  Array<T>  stdev(const Array<T> & a,const long long dim) { return Array<T>(af::stdev(a.array,dim)); }
template<typename T>  Array<T>  stdev(const Array<T> & a,const af_var_bias bias,const long long dim=-1) { return Array<T>(af::stdev(a.array,bias,dim)); }
template<typename T>  T         stdev(const Array<T> & a) { return (af::stdev<T>(a.array)); }
template<typename T>  void      topk( const Array<T> & a,Array<T> & values, Array<T> & indices, const int k, const int dim=-1, af::topkFunction order = AF_TOPK_MAX )  { af::topk(values.array,indices.array,a.array,k,dim,order); }                          
//Array<T>  var(const bool isbiased=false, const long long dim=-1) { return Array<T>(af::var(array,isbiased,dim)); }
//Array<T>  var(const af_var_bias bias, const long long dim=-1) { return Array<T>(af::var(array,bias,dim)); }
template<typename T>  Array<T>  var(const Array<T> & a,const Array<T> & weights, const long long dim=-1) { return Array<T>(af::var(a.array,weights.array,dim)); }    
template<typename T>  T         var(const Array<T> & a,const bool isbiased = false) { return af::var<T>(a.array,isbiased); }
template<typename T>  T         var(const Array<T> & a,const af_var_bias bias) { return af::var<T>(a.array,bias); }
// math
template<typename T> Array<T> abs(const Array<T> & a) {  return Array<T>(af::abs(a.array)); } 
template<typename T> Array<T> accum(const Array<T> & a,const int dim=0) {return Array<T>(af::accum(a.array,dim)); }
template<typename T> Array<T> acos(const Array<T> & a) {return Array<T>(af::acos(a.array)); }
template<typename T> Array<T> acosh(const Array<T> & a) {return Array<T>(af::acosh(a.array)); }
template<typename T> Array<T> asin(const Array<T> & a) {return Array<T>(af::asin(a.array)); }
template<typename T> Array<T> asinh(const Array<T> & a) {return Array<T>(af::asinh(a.array)); }
template<typename T> Array<T> atan(const Array<T> & a) {return Array<T>(af::atan(a.array)); }
template<typename T> Array<T> atanh(const Array<T> & a) {return Array<T>(af::atanh(a.array)); }
template<typename T> Array<T> atan2(const Array<T> & a,const Array<T> & rhs) { return Array<T>(af::atan2(a.array,rhs.array)); }
template<typename T> Array<T> atan2(const Array<T> & a,const T & rhs) {return Array<T>(af::atan2(a.array,rhs)); }
template<typename T> Array<T> atan2r(const T & a, const Array<T> & b) {return Array<T>(af::atan2(a.array,b.array)); }
template<typename T> Array<T> cbrt(const Array<T> & a) { return Array<T>(af::cbrt(a.array)); }
template<typename T> Array<T> ceil(const Array<T> & a) { return Array<T>(af::ceil(a.array)); }    
template<typename T> Array<T> cos(const Array<T> & a)  { return Array<T>(af::cos(a.array));  } 
template<typename T> Array<T> cosh(const Array<T> & a) { return Array<T>(af::cosh(a.array)); }     
template<typename T> Array<T> erf(const Array<T> & a) {return Array<T>(af::erf(a.array)); }
template<typename T> Array<T> erfc(const Array<T> & a) {return Array<T>(af::erfc(a.array)); }
template<typename T> Array<T> exp(const Array<T> & a) {return Array<T>(af::exp(a.array)); }
template<typename T> Array<T> expm1(const Array<T> & a) { return Array<T>(af::expm1(a.array)); }      
template<typename T> Array<T> factorial(const Array<T> & a) { return Array<T>(af::factorial(a.array)); }    
template<typename T> Array<T> floor(const Array<T> & a) {return Array<T>(af::floor(a.array)); }
template<typename T> Array<T> hypot(const Array<T> & a,Array<T> &rhs) { return Array<T>(af::hypot(a.array,rhs.array)); }
template<typename T> Array<T> log(const Array<T> & a) {return Array<T>(af::log(a.array)); }
template<typename T> Array<T> log10(const Array<T> & a) {return Array<T>(af::log10(a.array)); }
template<typename T> Array<T> log1p(const Array<T> & a) {return Array<T>(af::log1p(a.array)); }
template<typename T> Array<T> pow(const Array<T> & a,const Array<T> &rhs) { return Array<T>(af::pow(a.array,rhs.array)); }
template<typename T> Array<T> pow(const Array<T> & a,double rhs){ return Array<T>(af::pow(a.array,rhs)); }
template<typename T>  Array<T> product(const Array<T> & a,const int dim) { return Array<T>(af::product(a.array,dim)); }
template<typename T> Array<T> product(const Array<T> & a,const int dim, const double nanval) { return Array<T>(af::product(a.array,dim,nanval)); }
//T product() { return af::product(a.array); }
template<typename T> Array<T> root(const Array<T> & a,double rhs){ return Array<T>(af::root(a.array,rhs)); }
template<typename T> Array<T> round(const Array<T> & a){ return Array<T>(af::round(a.array)); }
template<typename T> Array<T> rsqrt(const Array<T> & a){ return Array<T>(af::rsqrt(a.array)); }
template<typename T> Array<T> sqrt(const Array<T> & a){ return Array<T>(af::sqrt(a.array)); }
template<typename T> Array<T> sin(const Array<T> & a) { return Array<T>(af::sin(a.array)); }
template<typename T> Array<T> sinh(const Array<T> & a) { return Array<T>(af::sinh(a.array)); }
template<typename T> Array<T> sum(const Array<T> & a) { return Array<T>(af::sum(a.array)); }
template<typename T> Array<T> tan(const Array<T> & a) { return Array<T>(af::tan(a.array)); }
template<typename T> Array<T> tanh(const Array<T> & a) { return Array<T>(af::tanh(a.array)); }
template<typename T> Array<T> trunc(const Array<T> & a) { return Array<T>(af::trunc(a.array)); }
// interpolate 
template<typename T> Array<T> approx1(const Array<T> & a,const Array<T> & pos,
                        const af_interp_type   method = AF_INTERP_LINEAR, 
                        const float off_grid = 0.0f)
{ return af::approx1(a.array,pos.array,method,off_grid); }

template<typename T> Array<T> approx2(const Array<T> & a,const Array<T> & pos,const Array<T> & pos1,
                        const af_interp_type   method = AF_INTERP_LINEAR, 
                        const float off_grid = 0.0f)
{ return af::approx2(a.array,pos.array,pos1.array,method,off_grid); }


// convolution
template<typename T> Array<T> convolve(const Array<T> & a,const Array<T> col_filter,
                        const Array<T> & filter, 
                        af::convMode convMode = AF_CONV_DEFAULT)
{ return Array<T>(af::convolve(col_filter.array, filter.array, a.array, convMode));}                            


template<typename T> Array<T> convolve(const Array<T> & a,const Array<T> & filter, af::convMode convMode = AF_CONV_DEFAULT, af::convDomain convDomain= AF_CONV_AUTO)
{ return Array<T>(af::convolve(a.array,filter.array,convMode,convDomain));}

template<typename T> Array<T> convolve1(const Array<T> & a,const Array<T> & filter, 
                          af::convMode convMode= AF_CONV_DEFAULT)
{ return Array<T>(af::convolve1(a.array, filter.array, convMode));}                            

template<typename T> Array<T> convolve2(const Array<T> & a,const Array<T> & filter, 
                        af::convMode convMode = AF_CONV_DEFAULT)
{ return Array<T>(af::convolve2(a.array, filter.array, convMode));}                            

template<typename T> Array<T> convolve3(const Array<T> & a,const Array<T> & filter, 
                        af::convMode convMode = AF_CONV_DEFAULT)
{ return Array<T>(af::convolve3(a.array,filter.array, convMode));}                            

// differential 

template<typename T> Array<T> diff1(const Array<T> & a,const int dim=0) {return Array<T>(af::diff1(a.array,dim)); }
template<typename T> Array<T> diff2(const Array<T> & a,const int dim=0) {return Array<T>(af::diff2(a.array,dim)); } 
template<typename T> void grad(const Array<T> & a,Array<T> &dx, Array<T> & dy)  { af::grad(dx.array,dy.array,a.array); }


// other utilities 

template<typename T> T allTrue(const Array<T> & a) { return af::allTrue<T>(a.array); }
//Array<T> allTrue(const int dim=-1) { return Array<T>(af::allTrue(array,dim)); }
template<typename T> Array<T> max(const Array<T> & a,const Array<T> & rhs) { return Array<T>(af::max(a.array,rhs.array)); }
template<typename T> T max(const Array<T> & a) { return af::max<T>(a.array); }
template<typename T> Array<T> min(const Array<T> & a,const Array<T> & rhs) { return Array<T>(af::min(a.array,rhs.array)); }
template<typename T>  T min(const Array<T> & a) { return af::min<T>(a.array); }


//////////////////////////////////////////////////////////////////////////
// index
//////////////////////////////////////////////////////////////////////////
struct Index 
{
    af::index index;

    Index() {} 
    Index(const af::index & idx) : index(idx) {} 
    Index(const Index & idx) : index(idx.index) {}
    Index(const af::seq & s0) : index(s0) {}
    Index(const af::array & a) : index(a) {} 
    template<typename T>
    Index(const Array<T> & a) : index(a.array) {} 

    Index& operator = (const Index & idx) { index = idx.index; return *this; }
    af_index_t get() const { return index.get(); }
    bool isspan() const { return index.isspan(); }
};


template<typename T> struct Vector;
template<typename T> struct Matrix;


//////////////////////////////////////////////////////////////////////////
// Scalar
//////////////////////////////////////////////////////////////////////////
template<typename T> 
struct Scalar 
{
  T val;
  Scalar() { val = 0; }   
  Scalar(const T & v) : val(v) {}   
  Scalar<T>& operator = (const Scalar<T> & other) 
  { this->val = other.val;
    return *this; }
  
  Array<T> array(Array<T> & other) { return Array<T>(other.dims(),val); }
  
  Scalar<T> operator + (const T & other) 
  { return Scalar<T>(this->val + other); }
  Scalar<T> operator - (const T & other) 
  { return Scalar<T>(this->val - other); }
  Scalar<T> operator * (const T & other) 
  { return Scalar<T>(this->val * other); }
  Scalar<T> operator / (const T & other) 
  { return Scalar<T>( val / other); }
  //Scalar<T> operator % (const T & other) 
  //{ return Scalar<T>( std::mod(value,other); }



  /*
  Array<T>    array();
  Array1D<T,_type>  array1d();
  Array2D<T,_type>  array2d();
  Vector<T>   vector();
  Matrix<T>   matrix();
  */
};

template<typename T> Scalar<T> abs(const Scalar<T> & s)  { return std::abs(s.val); }    
template<typename T> Scalar<T> fabs(const Scalar<T> & s) { return std::fabs(s.val); }
template<typename T> Scalar<T> acos(const Scalar<T> & s) { return std::acos(s.val); }
template<typename T> Scalar<T> acosh(const Scalar<T> & s) { return std::acosh(s.val); }
template<typename T> Scalar<T> asinh(const Scalar<T> & s) { return std::asinh(s.val); }
template<typename T> Scalar<T> atan(const Scalar<T> & s) { return std::atan(s.val); }
template<typename T> Scalar<T> atan2(const Scalar<T> & s,const Scalar<T>& y) { return std::atan2(s.val,y.val); }
template<typename T> Scalar<T> atanh(const Scalar<T> & s) { return std::atanh(s.val); }
template<typename T> Scalar<T> cbrt(const Scalar<T> & s) { return std::cbrt(s.val); }
template<typename T> Scalar<T> ceil(const Scalar<T> & s) { return std::ceil(s.val); }    
template<typename T> Scalar<T> copysign(const Scalar<T> & s,const Scalar<T>& y) { return std::copysign(s.val,y.val); }
template<typename T> Scalar<T> cos(const Scalar<T> & s) { return std::cos(s.val); }
template<typename T> Scalar<T> cosh(const Scalar<T> & s) { return std::cosh(s.val); }
template<typename T> Scalar<T> erf(const Scalar<T> & s) { return std::erf(s.val); }
template<typename T> Scalar<T> erfc(const Scalar<T> & s) { return std::erfc(s.val); }
template<typename T> Scalar<T> exp(const Scalar<T> & s) { return std::exp(s.val); }
template<typename T> Scalar<T> exp2(const Scalar<T> & s) { return std::exp2(s.val); }
template<typename T> Scalar<T> expm1(const Scalar<T> & s) { return std::expm1(s.val); }
template<typename T> Scalar<T> fdim(const Scalar<T> & s,const Scalar<T> & y) { return std::fdim(s.val,y.val); }
template<typename T> Scalar<T> floor(const Scalar<T> & s) { return std::floor(s.val); }
template<typename T> Scalar<T> fma(const Scalar<T> & s,const Scalar<T> & y, const Scalar<T>& z) { return std::fma(s.val,y.val,z.val); }
template<typename T> Scalar<T> fmax(const Scalar<T> & s,const Scalar<T> & y) { return std::fmax(s.val,y.val); }
template<typename T> Scalar<T> fmin(const Scalar<T> & s,const Scalar<T> & y) { return std::fmax(s.val,y.val); }
template<typename T> Scalar<T> fmod(const Scalar<T> & s,const Scalar<T> & y) { return std::fmod(s.val,y.val); }
template<typename T> int fpclassify(const Scalar<T> & s) { return std::fpclassify(s.val); }
template<typename T> Scalar<T> hypot(const Scalar<T> & s,const Scalar<T> & y) { return std::hypot(s.val,y.val); }
template<typename T> int ilogb(const Scalar<T> & s) { return std::ilogb(s.val); }
template<typename T> bool isfinite(const Scalar<T> & s) { return std::isfinite(s.val); }
template<typename T> bool isgreater(const Scalar<T> & s,const Scalar<T> & y) { return std::isgreater(s.val,y.val); }
template<typename T> bool isgreaterequal(const Scalar<T> & s,const Scalar<T> & y) { return std::isgreaterequal(s.val,y.val); }
template<typename T> bool isinf(const Scalar<T> & s) { return std::isinf(s.val); }
template<typename T> bool isless(const Scalar<T> & s,const Scalar<T> & y) { return std::isless(s.val,y.val); }
template<typename T> bool islessequal(const Scalar<T> & s,const Scalar<T> & y) { return std::islessequal(s.val,y.val); }
template<typename T> bool islessgreater(const Scalar<T> & s,const Scalar<T> & y) { return std::islessgreater(s.val,y.val); }
template<typename T> bool isnan(const Scalar<T> & s) { return std::isnan(s.val); }
template<typename T> bool isnormal(const Scalar<T> & s) { return std::isnormal(s.val); }
template<typename T> bool isunordered(const Scalar<T> & s,const Scalar<T>& y) { return std::isunordered(s.val,y.val); }    
template<typename T> Scalar<T> ldexp(const Scalar<T> & s,int exp) { return std::ldexp(s.val,exp); }
template<typename T> Scalar<T> lgamma(const Scalar<T> & s) { return std::lgamma(s.val); }
template<typename T> Scalar<T> llrint(const Scalar<T> & s) { return std::llrint(s.val); }
template<typename T> Scalar<T> llround(const Scalar<T> & s) { return std::llround(s.val); }
template<typename T> Scalar<T> log(const Scalar<T> & s) { return std::log(s.val); }
template<typename T> Scalar<T> log10(const Scalar<T> & s) { return std::log10(s.val); }
template<typename T> Scalar<T> log1p(const Scalar<T> & s) { return std::log1p(s.val); }
template<typename T> Scalar<T> log2(const Scalar<T> & s) { return std::log2(s.val); }
template<typename T> Scalar<T> logb(const Scalar<T> & s) { return std::logb(s.val); }
template<typename T> Scalar<T> lrint(const Scalar<T> & s) { return std::lrint(s.val); }
template<typename T> Scalar<T> lround(const Scalar<T> & s) { return std::lround(s.val); }
template<typename T> Scalar<T> nan(const char *tagp) { return std::nan(tagp);}
template<typename T> Scalar<T> nanf(const char *tagp) { return std::nanf(tagp);}
template<typename T> Scalar<T> nanl(const char *tagp) { return std::nanl(tagp);}
template<typename T> Scalar<T> nearbyint(const Scalar<T> & s) { return std::nearbyint(s.val); }
template<typename T> Scalar<T> nextafter(const Scalar<T> & s,const Scalar<T> & y) { return std::nextafter(s.val,y.val); }
template<typename T> Scalar<T> nexttoward(const Scalar<T> & s,const Scalar<T> & y) { return std::nexttoward(s.val,y.val); }
template<typename T> Scalar<T> pow(const Scalar<T> & s,const Scalar<T> & e) { return std::pow(s.val,e.val); }
template<typename T> Scalar<T> remainder(const Scalar<T> & s,const Scalar<T> & d) { return std::remainder(s.val,d.val); }
template<typename T> Scalar<T> rint(const Scalar<T> & s) { return std::rint(s.val); }
template<typename T> Scalar<T> round(const Scalar<T> & s) { return std::round(s.val); }
template<typename T> Scalar<T> scalbln(const Scalar<T> & s,long int n) { return std::scalbln(s.val,n);}
template<typename T> Scalar<T> scalbn(const Scalar<T> & s,int n) { return std::scalbln(s.val,n);}
//bool signbit() { return signbit(s.val); }
template<typename T> Scalar<T> sin(const Scalar<T> & s) { return std::sin(s.val); }
template<typename T> Scalar<T> sinh(const Scalar<T> & s) { return std::sinh(s.val); }    
template<typename T> Scalar<T> sqrt(const Scalar<T> & s) { return std::sqrt(s.val); }
template<typename T> Scalar<T> square(const Scalar<T> & s) { return s.val*s.val; }
template<typename T> Scalar<T> cube(const Scalar<T> & s) { return s.val*s.val*s.val; }
template<typename T> Scalar<T> tan(const Scalar<T> & s) { return std::tan(s.val); }
template<typename T> Scalar<T> tanh(const Scalar<T> & s) { return std::tanh(s.val); }        
template<typename T> Scalar<T> tgamma(const Scalar<T> & s) { return std::tgamma(s.val); }    
template<typename T> Scalar<T> trunc(const Scalar<T> & s) { return std::trunc(s.val); }


//////////////////////////////////////////////////////////////////////////
// Vector 
//////////////////////////////////////////////////////////////////////////
template<typename T> 
struct Vector : public Array<T>
{
  Vector() {} 
  Vector(const Array<T> & a) : Array<T>(a) {}
  Vector(size_t cols) : Array<T>(cols) {}
  Vector(af::array * a) { this->array = a; }    
  Vector(const af::array&  a) {this->array = a; }      
  Vector(const Vector<T> & v) { this->array = v.array; }

  Vector<T>& operator = (const Vector<T>& a) { this->array = a.array; return *this; }
  
  Vector<T>& operator + (const Vector<T>& a) { this->array = this->array + a.array; return *this; }
  Vector<T>& operator - (const Vector<T>& a) { this->array = this->array - a.array; return *this; }
  Vector<T>& operator * (const Vector<T>& a) { this->array = this->array * a.array; return *this; }
  Vector<T>& operator / (const Vector<T>& a) { this->array = this->array / a.array; return *this; }
  Vector<T>& operator % (const Vector<T>& a) { this->array = this->array % a.array; return *this; }

  Vector<T>& operator += (const Vector<T>& a) { this->array += a.array; return *this; }
  Vector<T>& operator -= (const Vector<T>& a) { this->array -= a.array; return *this; }
  Vector<T>& operator *= (const Vector<T>& a) { this->array *= a.array; return *this; }
  Vector<T>& operator /= (const Vector<T>& a) { this->array /= a.array; return *this; }
  
  
  Vector<T>& aplus(Vector<T> & b) { return (*this += b); }
  Vector<T>& aminus(Vector<T> & b) { return (*this -= b); }
  Vector<T>& atime(Vector<T> & b) { return (*this *= b); }
  Vector<T>& adiv(Vector<T> & b) { return (*this /= b); }

  T operator()(size_t i)
  // strange gcc bug
  {    auto x = this->array(i);    return this->scalar(x);  }
  T operator()(size_t i, size_t j)
  {    auto x = this->array(i,j);    return this->scalar(x);  }

  T     __getitem(size_t i) {auto x = this->array(i);return this->scalar(x);}
  void  __setitem(size_t i, const T& v)    {      this->array(i) = v;    }

  void      copy(const Vector<T> & a) { this->array = a.array; }    
  Dim       elements() const { return Dim(this->array.elements()); }    
  af::dtype type() const { return this->array.type(); }
  Dim4      dims() const { return Dim4(this->array.dims()); }
  
  size_t size(size_t d)
  {    dim_t  _dim = this->array.dims(d); return _dim;  }
  
  
  Vector<T> copy() const { 
    Vector<T> a;    a.array = this->array.copy();    return a;   }

  void eval() const { this->array.eval(); }
   
  Vector<T> transpose() const { return Vector<T>(this->array.T()); }
  Vector<T> H() const { return Vector<T>(this->array.H()); }

  std::vector<T>& vector_map(std::vector<T> & v)
  {    v.resize(size(1));            this->array.host(v.data());    return v;  }
  
  void map_vector(std::vector<T> & v, size_t r)
  {    for(size_t i = 0; i < v.size(); i++) this->array(r,i) = v[i];   }
  
/// Vector maths

  T dot(const Vector<T> & b) { return af::dot<T>(this->array,b.array); }
  
  Vector<T> t(bool conj=false) { return Vector<T>(af::transpose(this->array,conj)); }

  //size_t allocated() const { return this->array.allocated(); }
  //void transposeInPlace(bool conj=false) { tranposeInPlace(this->array,conj); }

};


//////////////////////////////////////////////////////////////////////////
// matrix 
//////////////////////////////////////////////////////////////////////////
template<typename T>
struct Matrix : public Array<T>
{

    Matrix() {}
    Matrix(const Array<T> & a) : Array<T>(a) {}
    Matrix(const Matrix<T> & m) { this->array = m.array; }
    Matrix(size_t rows, size_t cols) : Array<T>(rows,cols) {}
    Matrix(af::array * a) { this->array = a; }    
    Matrix(const af::array&  a) { this->array = a; }    
    
    Matrix<T>& operator = (const Matrix<T>& a) { this->array = a.array; return *this; }

    Matrix<T>& operator + (const Matrix<T>& a) { this->array = this->array + a.array; return *this; }
    Matrix<T>& operator - (const Matrix<T>& a) { this->array = this->array - a.array; return *this; }
    Matrix<T>& operator * (const Matrix<T>& a) { this->array = this->array * a.array; return *this; }
    Matrix<T>& operator / (const Matrix<T>& a) { this->array = this->array / a.array; return *this; }
    Matrix<T>& operator % (const Matrix<T>& a) { this->array = this->array % a.array; return *this; }

    //Matrix<T>& operator * (const T& a) { this->array = this->array * Scalar<T>(a).array(); return *this; }
    //Matrix<T>& operator / (const T& a) { this->array = this->array / Scalar<T>(a).array(); return *this; }

    Matrix<T>& operator += (const Matrix<T>& a) { this->array += a.array; return *this; }
    Matrix<T>& operator -= (const Matrix<T>& a) { this->array -= a.array; return *this; }
    Matrix<T>& operator *= (const Matrix<T>& a) { this->array *= a.array; return *this; }
    Matrix<T>& operator /= (const Matrix<T>& a) { this->array /= a.array; return *this; }


    Matrix<T>& aplus(Matrix<T> & b) { return (*this += b); }
    Matrix<T>& aminus(Matrix<T> & b) { return (*this -= b); }
    Matrix<T>& atime(Matrix<T> & b) { return (*this *= b); }
    Matrix<T>& adiv(Matrix<T> & b) { return (*this /= b); }


    void identity() { this->array = af::identity(this->dims().dim, this->type()); }

    int cholesky(Matrix<T> & m, const bool is_upper = true)
    {      return af::cholesky(m.array,this->array,is_upper);    }

    int choleskyInPlace(const bool is_upper = true)
    {      return af::cholesky(this->array,is_upper);    }

    void lu(Matrix<T>& pivot, const Matrix<T> & input, const bool is_lapack_piv=true)
    {     af::lu(this->array, pivot.array, input.array, is_lapack_piv); }

    void luInPlace(Matrix<T> & input, const bool is_lapack_piv=true)
    {     af::lu(this->array, input.array, is_lapack_piv); }

    void qr(Matrix<T> & tau, Matrix<T>& in)
    {     af::qr(this->array, tau.array, in.array); }

    void qrInPlace(Matrix<T> & in)
    {     af::qrInPlace(this->array,in.array);         }

    void svd(Matrix<T> & u, Matrix<T> & s, Matrix<T> & vt)
    {     af::svd(u.array,s.array,vt.array,this->array); }
    void svdInPlace(Matrix<T> & u, Matrix<T> & s, Matrix<T> & vt)
    {     af::svd(u.array,s.array,vt.array,this->array); }

    T det() { return af::det<T>(this->array); }
    
    Matrix<T> inverse(const af_mat_prop options = AF_MAT_NONE)
    { return Matrix<T>(af::inverse(this->array,options)); }

    double norm(const af_norm_type normType = AF_NORM_EUCLID,
                double p=1,
                double q=1)
    {        return af::norm(this->array, normType, p,q);    }                


    Matrix<T> pinverse(const double tol=1e-6, const af_mat_prop options = AF_MAT_NONE)
    { return Matrix<T>(af::pinverse(this->array,tol,options));}

    unsigned rank(const double tol=1e-5)
    { return af::rank(this->array,tol); }

    Vector<T> t(bool conj=false) { return Vector<T>(af::transpose(this->array,conj)); }
    void transposeInPlace(bool conj=false) { af::transposeInPlace(this->array,conj); }

    Matrix<T> matmul(const Matrix<T> & rhs, const af::matProp optLhs = AF_MAT_NONE,
                          const af::matProp optRhs = AF_MAT_NONE)
    {        return Matrix<T>(af::matmul(this->array,rhs.array,optLhs,optRhs)); }                             
    Matrix<T> matmulNT(const Matrix<T> & rhs) 
    {        return Matrix<T>(af::matmulNT(this->array,rhs.array)); }                     
    Matrix<T> matmulTN(const Matrix<T> & rhs)
    {        return Matrix<T>(af::matmulTN(this->array,rhs.array)); }     
    Matrix<T> matmulTT(const Matrix<T> & rhs)
    {        return Matrix<T>(af::matmulTT(this->array,rhs.array)); } 
    Matrix<T> matmul2(const Matrix<T> & rhs, const Matrix<T> &c1)
    {        return Matrix<T>(af::matmul(this->array,rhs.array,c1.array)); }
    Matrix<T> matmul3(const Matrix<T> & c1, const Matrix<T> &c2, const Matrix<T> & c3)
    {        return Matrix<T>(af::matmul(this->array,c1.array,c2.array,c3.array)); }  

    Matrix<T> transpose(const bool conj=false)
    { 
            return Matrix<T>(af::transpose(this->array,conj)); 
    }


    void download_host() {
      this->download_host();
    }
    void upload_device() { 
      this->upload_device();
    }
    array_index M() {
      return this->M();
    }
    array_index N() {
      return this->N();
    }

    T      operator()(size_t i, size_t j) {
      return (*this)(i,j);
    }    
};


/*
//////////////////////////////////////////////////////////////////////////
// Cube 
//////////////////////////////////////////////////////////////////////////
template <typename T>
struct Cube : public Array<T> 
{

  array_index M() {

  }
  array_index N() {

  }
  array_index P() {

  }

  T      operator()(size_t i, size_t j, size_t k, size_t w) {

  }
  Matrix<T> __getitem(size_t depth) {

  }
  void __setitem(size_t depth, const Matrix<T> & value) {

  }
 
};


//////////////////////////////////////////////////////////////////////////
// Field 
//////////////////////////////////////////////////////////////////////////
template <typename T>
struct Field : public Array<T> 
{

  T  operator()(size_t i, size_t j, size_t k, size_t w) {

  }
 
  array_index M() {

  }
  array_index N() {
    
  }
  array_index O() {
    
  }
  array_index P() {
    
  }

  Cube<T> __getitem(size_t w) {

  }
  void __setitem(size_t w, const Cube<T> & cube) {

  }
};
*/


//////////////////////////////////////////////////////////////////////////
// image processing
//////////////////////////////////////////////////////////////////////////
template<typename T, af::dtype _dt = f32>
struct ImageProcessing
{
    Array<T> image;

    ImageProcessing() = default;
    ImageProcessing(const Array<T> & i) : image(i) {}
    ImageProcessing(const char * filename, bool is_color = false)
    { image = af::loadImage(filename,is_color); }
    ~ImageProcessing() = default;

    void saveImage(const char * filename) { af::saveImage(filename, image.array); }

    void colorspace(ImageProcessing<T> & in,const af::CSpace to, const af::CSpace from)  
    { image.array = af::colorspace(in.image.array,to,from); }

    void confidenceCC(ImageProcessing<T> & in,const Array<T> & seedx, const Array<T> & seedy,
                      const unsigned radius, const unsigned multiplier, const int iter,
                      const double segmentedValue)
    { image.array = af::confidenceCC(in.image.array,seedx.array,seedy.array,radius,multiplier,iter,segmentedValue);}                      

    void confidenceCC(ImageProcessing<T> & in,const size_t num_seeds, std::vector<unsigned> &seedx, std::vector<unsigned> &seedy,
                      const unsigned radius, const unsigned multiplier, const int iter,
                      const double segmentedValue)
    { image.array = af::confidenceCC(in.image.array,num_seeds,seedx.data(),seedy.data(),radius, multiplier,iter,segmentedValue);}                        

    void regions(ImageProcessing<T> & in, const af_connectivity connectivity = AF_CONNECTIVITY_4)
    { image.array = af::regions(in.image.array,connectivity,_dt); }

    void anisotropicDiffusion(ImageProcessing<T> & in,
                              const float timestep, const float conductance,
                              const unsigned iterations, 
                              const af::fluxFunction flux = AF_FLUX_EXPONENTIAL,
                              const af::diffusionEq diffusionEq = AF_DIFFUSION_GRAD)
    { image.array = af::anisotropicDiffusion(in.image.array,timestep,conductance,iterations,flux,diffusionEq); }                              

    void bilateral(ImageProcessing<T> & in,const float spatial_sigma, const float chromatic_sigma, const bool is_color=false)
    { image.array = af::bilateral(in.image.array,spatial_sigma,chromatic_sigma, is_color); }

    void canny( ImageProcessing<T> & in,
                const af::cannyThreshold thresholdType, 
                const float lowThresholdRate,
                const float highThresholdRatio,
                const unsigned sobelWindow=3,
                const bool isFast = false)
    { image.array = af::canny(in.image.array,thresholdType,lowThresholdRate,highThresholdRatio,sobelWindow,isFast); }                


    void inverseDeconvolution(ImageProcessing<T> & in,const Array<T> &psf, const float gamma,
                              const af_inverse_deconv_algo algo)
    { image.array = af::inverseDeconv(in.image.array,psf.array,gamma,algo); }                              

    void iterativeDeconvolution(ImageProcessing<T> & in,const Array<T> &ker, const unsigned iterations, const float relax, const af::iterativeDeconvAlgo algo)
    { image.array = af::iterativeDeconv(in.image.array,ker.array,iterations,relax,algo); }                              

    void maxfilt(ImageProcessing<T> & in,const long long wind_length=3, const long long& wind_width=3,
                  const af::borderType bt= AF_PAD_ZERO)
    {      image.array = af::maxfilt(in.image.array, wind_length, wind_width, bt);    }                  

    void meanShift(ImageProcessing<T> & in,const float spatial_sigma, const float chromatic_sigma,
                    const unsigned iter, const bool is_color=false)
    {      image.array = af::meanShift(in.image.array, spatial_sigma, chromatic_sigma, iter, is_color);    }                    

    void medfilt(ImageProcessing<T> & in,const long long wind_length=3, const long long& wind_width=3, const af::borderType bt= AF_PAD_ZERO)
    {      image.array = af::medfilt(in.image.array, wind_length, wind_width, bt);    }                  

    void medfilt1(ImageProcessing<T> & in,const long long wind_length=3, const af::borderType bt= AF_PAD_ZERO)
    {      image.array = af::medfilt1(in.image.array, wind_length, bt);    }                  

    void medfilt2(ImageProcessing<T> & in,const long long wind_length=3, const long long& wind_width=3,
                  const af::borderType bt= AF_PAD_ZERO)
    {      image.array = af::medfilt2(in.image.array, wind_length, wind_width, bt);    }                  

    void minfilt(ImageProcessing<T> & in,const long long wind_length=3, const long long& wind_width=3,
                  const af::borderType bt= AF_PAD_ZERO)
    {      image.array = af::minfilt(in.image.array, wind_length, wind_width, bt);    }                  

    void sat(ImageProcessing<T> & in) { image.array = af::sat(in.image.array); }

    void sobel(Array<T> & dx, Array<T> & dy, const unsigned ker_size=3) 
    { af::sobel(dx.array,dy.array,image.array,ker_size);}

    void histequal(ImageProcessing<T> & in,const Array<T> & hist)
    { image.array = af::histequal(in.image.array,hist.array);    }
    // not sure why there are two
    void histEqual(ImageProcessing<T> & in,const Array<T> & hist)
    { image.array = af::histequal(in.image.array,hist.array);    }

    void histogram(ImageProcessing<T> & in,const unsigned nbins, const double minval, const double maxval)    
    { image.array = af::histogram(in.image.array,nbins,minval,maxval);}

    void moments(ImageProcessing<T> & in,const af::momentType moment = AF_MOMENT_FIRST_ORDER)
    { image.array = af::moments(in.image.array,moment);}

    void resize(ImageProcessing<T> & in,const long long odim0, const long long odim1, af_interp_type method = AF_INTERP_NEAREST)
    { image.array = af::resize(in.image.array,odim0,odim1,method); }

    void rotate(ImageProcessing<T> & in,const float theta, const bool crop=true, const af_interp_type method =AF_INTERP_NEAREST)
    { image.array = af::rotate(in.image.array,theta,crop,method); }

    void scale(ImageProcessing<T> & in,const float scale0, const float scale1, const long long odim0=0,
                const long long odim1 =0, const af_interp_type method = AF_INTERP_NEAREST)    
    { image.array = af::scale(in.image.array,scale1,odim0,odim1,method); }                

    void skew(ImageProcessing<T> & in,const float skew0, const float skew1, const long long odim0=0, const long long odim1=0, const bool inverse=true,
              const af_interp_type method = AF_INTERP_NEAREST )
    { image.array = af::skew(in.image.array,skew0,skew1,odim0,odim1,inverse,method); }

    void transform(ImageProcessing<T> & in,const Array<T> & transform,
                      const long long odim0 = 0, const long long odim1 = 0, 
                      const af_interp_type method = AF_INTERP_NEAREST,
                      const bool inverse=true)
    { image.array = af::transform(in.image.array, transform.array, odim0,odim1,method,inverse); }                      

    void transformCoordinates(ImageProcessing<T> & in,const float d0, const float d1)
    {      image.array = af::transformCoordinates(in.image.array,d0,d1);     }

    void translate(ImageProcessing<T> & in,const float trans0, const float trans1, const long long odim0=0, const long long odim1=0,
                    const af_interp_type method = AF_INTERP_NEAREST)
    { image.array = af::translate(in.image.array,trans0,trans1,odim0,odim1,method); }                    


    void dilate(ImageProcessing<T> & in,const Array<T> & mask) { image.array = af::dilate(in.image.array,mask.array); }
    void dilate3(const Array<T> & mask) { af::dilate3(image.array,mask.array); }
    void erode(const Array<T> & mask) { af::erode(image.array,mask.array); }
    void erode3(const Array<T> & mask) { af::erode3(image.array,mask.array); }

    void gaussiankernel(const int rows, const int cols, const double sig_r=0, const double sig_c=0) { image.array = af::gaussiankernel(rows,cols,sig_r,sig_c); }

    void unwrap(ImageProcessing<T> & in,const long long wx, const long long wy, const long long sx, const long long sy, const long long px, const long long py, const bool is_column=true)
    { image.array = af::unwrap(in.image.array,wx,wy,sx,sy,px,py,is_column);}

    void wrap(ImageProcessing<T> & in, const long long ox, const long long oy, const long long wx, const long long wy, const long long sx, const long long sy, const long long px=0, const long long py =0, const bool is_column=true)    
    { image.array = af::wrap(in.image.array,ox,oy,wx,wy,sx,sy,px,py,is_column); }

    void gray2rgb(ImageProcessing<T> & in, const float rFactor=1.0, const float gFactor=1.0, const float bFactor=1.0)
    { image.array = af::gray2rgb(in.image.array, rFactor,gFactor,bFactor); }

    void hsv2rgb(const ImageProcessing<T> & in) 
    { image.array = af::hsv2rgb(in.image.array);}
};



//////////////////////////////////////////////////////////////////////////
// computer vision
//////////////////////////////////////////////////////////////////////////
template<typename T>
struct ComputerVision
{    
  ImageProcessing<T> image; 

  ComputerVision() = default;
  ComputerVision(const ImageProcessing<T> & i) : image(i) {} 
  ComputerVision(const ComputerVision<T> & cv) : image(cv.image) {} 
  ~ComputerVision() = default;

  void orb(Features & f, Array<T> & desc,
             const float fast_thr=20.0f, const unsigned max_feat=400,
             const float scl_fctr=1.5f, const unsigned levels = 4, 
             const bool blur_img = false)
  {
      af::orb(f.features,desc.array,image.image.array,fast_thr,max_feat,scl_fctr,levels, blur_img);
  }          

  void gloh(Features & f, 
            Array<T> & desc,             
            const unsigned n_layers=3,
            const float contrast_thr = 0.04,
            const float edge_thr = 10.f,
            const float init_sigma = 1.6f,
            const float double_input = true,
            const float intensity_scale = 0.00390625f, 
            const float feature_ratio = 0.05f )
  {
      af::gloh(f.features,desc.array,image.image.array, n_layers,edge_thr,init_sigma,init_sigma,double_input,intensity_scale,feature_ratio);
  }

  void sift(Features & f, 
            Array<T> & desc,             
            const float contrast_thr = 0.04f,
            const float edge_thr = 10.0f, 
            const float init_sigma = 1.6f, 
            const bool double_input = true,
            const float intensity_scale = 0.00390625f,
            const float feature_ratio = 0.05f)
  {

    af::sift(f.features,desc.array,image.image.array,contrast_thr,edge_thr,init_sigma,double_input,intensity_scale,feature_ratio);
  }            

  void fast(const float thr=20.0f, const unsigned arc_length=9,
            const bool non_max=true, const float feature_ratio=.05f,
            const unsigned edge = 3)
  {
    af::fast(image.image.array, thr, arc_length, non_max, feature_ratio, edge);
  }        

  void dog(const Array<T> & in, const int radius1, const int radius2) { image.image.array = af::dog(in.array,radius1,radius2); }    

  void hammingMatcher(Array<T> & idx, 
                      Array<T> & dist, 
                      Array<T> & query,
                      const long long dist_dim=0,
                      const unsigned n_dist=1)
  {
    af::hammingMatcher(idx.array, dist.array, query.array, this->image.image.array, dist_dim, n_dist);
  }     

  Features harris(const unsigned max_corners=00,
                  const float min_response=1e5f,
                  const float sigma = 1.0f, 
                  const unsigned block_size = 0,
                  const float k_thr=0.04f)                 
  {
    Features r;
    r.features = af::harris(image.image.array, max_corners, min_response, sigma, block_size, k_thr);
    return r;
  }                  
};


//////////////////////////////////////////////////////////////////////////
// Signal Processing
//////////////////////////////////////////////////////////////////////////
template<typename T>
struct SignalProcessing
{
    Array<T> signal; 
    Array<T> a,b; 

    SignalProcessing() = default;
    SignalProcessing(Array<T> & sig) : signal(sig) {}
    ~SignalProcessing() = default;

    // load sound files 
    // save sound files 
    // from buffer
    // to audio buffer
    // plot wave
    // spectrum analyzer 
    // spectrogram viewer 

    void fftNorm(const Array<T> & input, const double norm_factor, const long long odim0=0)    { signal.array = af::fftNorm(input.array,norm_factor,odim0); }
    void fftInPlace(const double norm_factor=1)    { af::fftInPlace(signal.array,norm_factor); } 
    void fft(long long odim0=0)    { af::fft(signal.array,odim0); }

    void dft(const Array<T> & input, Dim4 dims)    { signal.array = af::dft(input.array,dims.dim); }
    void dft(const Array<T> & input,const double norm_factor, const Dim4 outDims)    { signal.array = (af::dft(input.array,norm_factor,outDims.dim)); }
    void dft(const Array<T> & input) { signal.array = af::dft(input.array); }

    void idft(const Array<T> & input,Dim4 dims)    { signal.array = (af::idft(input.array,dims.dim)); }
    void idft(const Array<T> & input,const double norm_factor, const Dim4 outDims)    { signal.array = (af::idft(input.array,norm_factor,outDims.dim)); }
    void idft(const Array<T> & input){ signal.array = (af::idft(input.array)); }

    void fft2Norm(const Array<T> & input,const double norm_factor, const long long odim0=0, const long long odim1=0)    { signal.array = af::fft2Norm(input.array,norm_factor,odim0,odim1); }
    void fft2InPlace(const double norm_factor=1)    { af::fft2InPlace(signal.array,norm_factor); }
    void fft2(const Array<T> & input,long long odim0=0, long long odim1=0)    { signal.array = (af::fft2(input.array,odim0,odim1)); }

    void fftC2R1D(const Array<T> & input,bool is_odd = false, const double norm_factor=0) { signal.array = (af::fftC2R<1>(input.array,is_odd,norm_factor)); }
    void fftR2C1D(const Array<T> & input,const double norm_factor=0) { signal.array (af::fftC2R<1>(input.array,norm_factor)); } 

    void fftC2R2D(const Array<T> & input,bool is_odd = false, const double norm_factor=0) { signal.array = (af::fftC2R<2>(input.array,is_odd,norm_factor)); }
    void fftR2C2D(const Array<T> & input,const double norm_factor=0) { signal.array (af::fftC2R<2>(input.array,norm_factor)); } 

    void set_a(const Array<T> &_a) { a =_a.array; }
    void set_b(const Array<T> & _b) { b = _b; }

    void fir() { signal.array =  af::fir(a.array, b.array); }        
    void iir(const Array<T> & b, const Array<T> & a, const Array<T> & x) { signal.array = af::iir(b.array, a.array, x.array); }
    

};
}
