swig -lua -c++ -IlibKeyFinder keyfinder.i
gcc -IlibKeyFinder -O2 -fPIC -march=native -mavx2 -shared -o keyfinder.so keyfinder_wrap.cxx -lstdc++ -lm -lluajit -LlibKeyFinder -lkeyfinder
