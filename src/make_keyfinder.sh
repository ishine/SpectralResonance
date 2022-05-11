swig -lua -c++ -Isrc/libKeyFinder src/keyfinder.i
gcc -Isrc/libKeyFinder -O2 -fPIC -march=native -mavx2 -shared -o keyfinder.so src/keyfinder_wrap.cxx -lstdc++ -lm -lluajit -Lbin -lkeyfinder
