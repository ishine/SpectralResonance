swig -lua -c++ -I../Python-AudioAnalysis/aubio/src aubio.i
gcc -I../Python-AudioAnalysis/aubio/src -O2 -fPIC -march=native -mavx2 -shared -o aubio.so aubio_wrap.cxx -lstdc++ -lm -lluajit -L. -laubio
