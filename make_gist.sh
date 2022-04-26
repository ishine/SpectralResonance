swig -lua -c++ gist.i
gcc -I. -O2 -fPIC -march=native -mavx2 -shared -o gist.so gist_wrap.cxx -lstdc++ -lm -lluajit -L. -lgist -lfftw3
