swig -lua -c++ gist.i
gcc -USE_FFTW -O2 -fPIC -march=native -mavx2 -shared -o gist.so gist_wrap.cxx ../lib/libgist.a -lstdc++ -lm -lluajit -lfftw3
