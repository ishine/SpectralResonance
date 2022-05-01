swig -lua -c++ fftw_cpp.i
gcc -O2 -fPIC -march=native -mavx2 -shared -o fftw_cpp.so fftw_cpp_wrap.cxx -lstdc++ -lm -lluajit -lfftw3
