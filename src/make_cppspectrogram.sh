swig -lua -c++ -Icpp-spectrogram/include cpp-spectrogram.i
gcc -Icpp-spectrogram/include -O2 -fPIC -march=native -mavx2 -shared -o spectrogram.so cpp-spectrogram_wrap.cxx cpp-spectrogram/libcpp-spectrogram.a -lstdc++ -lm -lluajit -lsndfile -lfreeimage -lfftw3
