swig -lua -c++ fftw2d_cpp.i
gcc -O2 -fPIC -march=native -mavx2 -shared -o fftw2d_cpp.so fftw2d_cpp_wrap.cxx -lstdc++ -lm -lluajit -lfftw3
