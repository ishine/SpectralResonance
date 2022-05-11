swig -lua -c++ sdft.i
gcc -O2 -fPIC -march=native -mavx2 -shared -o sdft.so sdft_wrap.cxx libsdft.a -lstdc++ -lm -lluajit
