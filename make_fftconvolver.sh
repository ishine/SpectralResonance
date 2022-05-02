swig -lua -c++ src/fftconvolver.i
gcc -DAUDIOFFT_FFTW3 -O2 -march=native -fPIC -mavx2 -shared -o fftconvolver.so src/fftconvolver_wrap.cxx src/AudioFFT.cpp src/FFTConvolver.cpp src/TwoStageFFTConvolver.cpp src/Utilities.cpp -lstdc++ -lm -lluajit -lfftw3 -lfftw3f
