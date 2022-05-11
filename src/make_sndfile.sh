swig -lua -c++ sndfile.i
gcc -fmax-errors=1 -O2 -fPIC -march=native -mavx2 -shared -o sndfile.so sndfile_wrap.cxx -lstdc++ -lm -lluajit -lsndfile
