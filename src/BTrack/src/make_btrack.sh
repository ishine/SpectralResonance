swig -lua -c++ btrack.i
gcc -O2 -fPIC -march=native -mavx2 -shared -o btrack.so btrack_wrap.cxx libbtrack.a -lstdc++ -lm -lfftw3 -lluajit

