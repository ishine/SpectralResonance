swig -Ilibgha -lua -c++ libgha.i
gcc -Ilibgha/include -O2 -fPIC -march=native -mavx2 -shared -o libgha.so libgha_wrap.cxx libgha/libgha.a -lstdc++ -lm -lluajit
