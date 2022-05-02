swig -lua -c++ -IARSS/src ARSS.i
gcc -IARSS/src -O2 -fPIC -march=native -mavx2 -shared -o arss.so ARSS_wrap.cxx -lstdc++ -lm -lluajit -lfftw3
