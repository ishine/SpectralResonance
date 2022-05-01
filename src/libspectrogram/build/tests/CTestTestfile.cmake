# CMake generated Testfile for 
# Source directory: /home/quake/Projects/Spectral-Resonance/src/libspectrogram/tests
# Build directory: /home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(stft_tests "/home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/tests/stft_tests")
set_tests_properties(stft_tests PROPERTIES  _BACKTRACE_TRIPLES "/home/quake/Projects/Spectral-Resonance/src/libspectrogram/tests/CMakeLists.txt;44;add_test;/home/quake/Projects/Spectral-Resonance/src/libspectrogram/tests/CMakeLists.txt;0;")
subdirs("../googletest-build")
