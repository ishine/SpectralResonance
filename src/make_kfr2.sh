swig -lua -c++ -I/usr/local/include/kfr kfr2.i
g++ -std=c++17 -I/usr/local/include/kfr -fmax-errors=1 -O2 -march=native -fPIC -shared -o kfr2.so kfr2_wrap.cxx -lstdc++ -lluajit -L/usr/local/lib -lkfr_dft -lkfr_io

