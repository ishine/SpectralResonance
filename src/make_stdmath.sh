swig -lua -c++ -Iinclude -Iinclude/SimpleEigen std_math.i
gcc -fmax-errors=1 -Iinclude -Iinclude/SimpleEigen  -O2 -fPIC -march=native -mavx2 -shared -o stdmath.so std_math_wrap.cxx -lstdc++ -lm -lluajit
