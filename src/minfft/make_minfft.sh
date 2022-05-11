swig -lua -c++ minfft.i
gcc -O2 -fPIC -march=native -mavx2 -shared -o minfft.so minfft_wrap.cxx minfft.c -lstdc++ -lm -lluajit
