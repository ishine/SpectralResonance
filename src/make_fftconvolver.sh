swig -lua -c++ fftconvolver.i
gcc -DAUDIOFFT_FFTW3 -O2 -fPIC -march=native -mavx2 -shared -o fftconvolver.so fftconvolver_wrap.cxx -lstdc++ -lm -lluajit -lfftw3 -lfftw3f
