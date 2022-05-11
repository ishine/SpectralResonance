swig -lua -c++ phase_vocoder.i
gcc -O2 -fPIC -march=native -mavx2 -shared -o phase_vocoder.so phase_vocoder_wrap.cxx phase_vocoder.c -lstdc++ -lm -lluajit
