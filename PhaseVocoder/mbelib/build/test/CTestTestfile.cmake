# CMake generated Testfile for 
# Source directory: /home/quake/Projects/Spectral-Resonance/PhaseVocoder/mbelib/test
# Build directory: /home/quake/Projects/Spectral-Resonance/PhaseVocoder/mbelib/build/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(gtest "mbetest")
set_tests_properties(gtest PROPERTIES  _BACKTRACE_TRIPLES "/home/quake/Projects/Spectral-Resonance/PhaseVocoder/mbelib/test/CMakeLists.txt;19;add_test;/home/quake/Projects/Spectral-Resonance/PhaseVocoder/mbelib/test/CMakeLists.txt;0;")
subdirs("gtest")
subdirs("gmock")
