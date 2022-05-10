swig -lua -c++ pitch_detection.i
gcc -fopenmp -pthread -O2 -fPIC -march=native -mavx2 -shared -o pitch_detection.so pitch_detection_wrap.cxx -lstdc++ -lm -lluajit -L. -lpitch_detection -larmadillo -lmlpack -lffts
