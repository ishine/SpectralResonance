swig -lua -c++ src/gist.i
gcc -O2 -fPIC -march=native -mavx2 -shared -o gist.so src/gist_wrap.cxx lib/libgist.a -lstdc++ -lm -lluajit -lfftw3
