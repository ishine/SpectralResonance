swig -lua -c++ keyfinder.i
gcc -O2 -fPIC -march=native -mavx2 -shared -o keyfinder.so keyfinder_wrap.cxx -lstdc++ -lm -lluajit -L. -lkeyfinder
