%module vtk
%{
#include "VectorToolkit.h"
%}
%include "stdint.i"
%include "std_string.i"
%include "std_vector.i"
%include "VectorToolkit.h"

%template(float_vector) std::vector<float>;
%template(double_vector) std::vector<double>;

%template(int8_vector) std::vector<int8_t>;
%template(uint8_vector) std::vector<uint8_t>;

%template(int16_vector) std::vector<int16_t>;
%template(uint16_vector) std::vector<uint16_t>;

%template(int32_vector) std::vector<int32_t>;
%template(uint32_vector) std::vector<uint32_t>;

%template(int64_vector) std::vector<long>;
%template(uint64_vector) std::vector<unsigned long>;

%template(string_vector) std::vector<std::string>;


%template(float_vtk) VectorToolkit<float>;
%template(double_vtk) VectorToolkit<double>;
/*
%template(int8_vtk) VectorToolkit<int8_t>;
%template(uint8_vtk) VectorToolkit<uint8_t>;
%template(int16_vtk) VectorToolkit<int16_t>;
%template(uint16_vtk) VectorToolkit<uint16_t>;
*/

%template(int32_vtk) VectorToolkit<int32_t>;
//%template(uint32_vtk) VectorToolkit<uint32_t>;

%template(long_vtk) VectorToolkit<long>;
//%template(ulong_vtk) VectorToolkit<unsigned long>;
