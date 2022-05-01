swig -lua -c++ -Iinclude -Iinclude/SimpleEigen eigen.i
gcc -fmax-errors=1 -Iinclude -Iinclude/SimpleEigen -O2 -fPIC -march=native -shared -ose.so eigen_wrap.cxx -lstdc++ -lluajit
