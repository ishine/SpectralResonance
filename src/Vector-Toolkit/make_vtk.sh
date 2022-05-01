swig -lua -c++ -Isrc vtk.i
gcc -Isrc -O2 -fPIC -march=native -mavx2 -shared -o vtk.so vtk_wrap.cxx src/VectorToolkit.cpp -lstdc++ -lm -lluajit
