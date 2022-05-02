swig -lua -c++ -Isrc/aubio/src src/aubio.i
gcc -fpermissive -O2 -fPIC -march=native -mavx2 -shared -Isrc/aubio/src -o aubio.so src/aubio_wrap.cxx lib/libaubio.a -lstdc++ -lm -lluajit -lsndfile -lavformat -lrubberband -lsamplerate

