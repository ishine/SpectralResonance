swig -lua -c++ gist.i
gcc -DUSE_FFTW -O2 -fPIC -march=native -mavx2 -c CoreFrequencyDomainFeatures.cpp CoreTimeDomainFeatures.cpp Gist.cpp MFCC.cpp OnsetDetectionFunction.cpp WindowFunctions.cpp Yin.cpp
gcc -I. -O2 -fPIC -march=native -mavx2 -shared -o gist.so gist_wrap.cxx -lstdc++ -lm -lluajit -L. -lgist -lfftw3
