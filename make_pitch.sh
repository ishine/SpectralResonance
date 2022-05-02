swig -lua -c++ src/pitch_detection.i
gcc -fopenmp -O2 -march=native -mavx2 -fPIC -shared -o pitch_detection.so src/pitch_detection_wrap.cxx -lstdc++ -lluajit -lm -Lbin -lpitch_detection -pthread -lmlpack -lffts -larmadillo
