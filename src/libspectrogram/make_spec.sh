swig -lua -c++ -Iinclude -Isrc libspectrogram.i
gcc -Iinclude -Isrc -O2 -fPIC -march=native -mavx2 -shared -o libspectrogram.so libspectrogram_wrap.cxx src/stft.cpp src/spectrogram.cpp -lstdc++ -lm -lluajit -lfftw3 -lfftw3f
