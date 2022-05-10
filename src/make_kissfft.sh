swig -lua -c++ -I/usr/local/include/kissfft kissfft.i
gcc -I/usr/local/include/kissfft -O2 -fPIC -march=native -mavx2 -shared -o kissfft.so kissfft_wrap.cxx -lstdc++ -lm -lluajit -lkissfft-float
