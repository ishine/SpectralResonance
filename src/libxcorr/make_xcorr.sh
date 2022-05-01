swig -lua -Iinclude xcorr.i
gcc -Iinclude -O2 -fPIC -march=native -mavx2 -shared -o xcorr.so xcorr_wrap.c src/xcorr.c -lm -lluajit -lfftw3
