swig -lua -c++ loris.i
gcc -fmax-errors=1 -I../src -O2 -fPIC -march=native -mavx2 -shared -o loris.so loris_wrap.cxx ../src/.libs/libloris.a -lstdc++ -lm -lluajit -lfftw3
