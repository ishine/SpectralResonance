gcc -I.. -L../../build/lib -O2 -fPIC -march=native -mavx2 -shared -o marsyas.so lua/marsyas_wrap.cxx -lstdc++ -lm -lluajit -lmarsyas
