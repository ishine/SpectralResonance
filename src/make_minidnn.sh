swig -lua -c++ -Iinclude/MiniDNN mini.i
gcc -Iinclude/MiniDNN -O2 -fPIC -march=native -mavx2 -shared -o minidnn.so mini_wrap.cxx -lstdc++ -lm -lluajit
