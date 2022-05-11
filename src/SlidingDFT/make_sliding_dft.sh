swig -lua -c++ sliding_dft.i
gcc -O2 -fPIC -march=native -mavx2 -shared -o sliding_dft.so sliding_dft_wrap.cxx -lstdc++ -lm -lluajit
