swig -lua -c++ -Isrc/aubio/src src/ccaubio.i
gcc -DAUBIO_UNSTABLE=1 -fmax-errors=1 -O2 -Isrc/aubio/src -O2 -march=native -mavx2 -fPIC -shared -o ccaubio.so src/ccaubio_wrap.cxx lib/libaubio.a -lstdc++ -lm -lluajit -lsndfile -lsamplerate -lavformat -lrubberband
