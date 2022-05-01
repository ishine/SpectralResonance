swig -lua -c++ -IAudioFFT audiofft.i
gcc -DAUDIOFFT_FFTW3 -IAudioFFT -O2 -march=native -fPIC -mavx2 -shared -oaudiofft.so audiofft_wrap.cxx AudioFFT/AudioFFT.cpp -lstdc++ -lm -lluajit -lfftw3 -lfftw3f
