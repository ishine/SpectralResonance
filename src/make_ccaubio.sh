swig -lua -c++ -I../Python-AudioAnalysis/aubio/src ccaubio.i
gcc -I../Python-AudioAnalysis/aubio/src  -DAUBIO_UNSTABLE=1 -fmax-errors=1 -O2 -Iaubio/src -O2 -march=native -mavx2 -fPIC -shared -o ccaubio.so ccaubio_wrap.cxx -lstdc++ -lm -lluajit -lrubberband -L. -laubio
