swig -lua -c++ phasevocoder.i
gcc -O2 -fPIC -march=native -mavx2 -shared -o phasevocoder.so phasevocoder_wrap.cxx hanning.c phasevocoder.c -lstdc++ -lm -lluajit -lfftw3 -lsndfile
