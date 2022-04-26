swig -lua -c++ fftconvolver.i
gcc -DAUDIOFFT_FFTW3 -O2 -march=native -fPIC -mavx2 -shared -offtconvolver.so fftconvolver_wrap.cxx AudioFFT.cpp FFTConvolver.cpp TwoStageFFTConvolver.cpp Utilities.cpp -lstdc++ -lm -lluajit -lfftw3 -lfftw3f
