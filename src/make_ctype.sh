swig -Isrc -lua -c++ CType.i
gcc -fmax-errors=1 -O2 -fPIC -march=native -mavx2 -shared -o CType.so CType_wrap.cxx expr.cpp -lstdc++ -lm -lluajit
