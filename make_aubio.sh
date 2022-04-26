swig -lua -c++ -I/usr/include/aubio aubio.i
gcc -O2 -fPIC -march=native -mavx2 -shared -I/usr/include/aubio -o aubio.so aubio_wrap.cxx -lstdc++ -lm -lluajit-5.1 -laubio

