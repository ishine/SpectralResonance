# CMake generated Testfile for 
# Source directory: /home/quake/Projects/Spectral-Resonance/src/libgha
# Build directory: /home/quake/Projects/Spectral-Resonance/src/libgha/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(gha_test_simple_1000_0_a "main" "../test/data/1000hz_0.85.pcm" "0" "1024" "0.142476" "0.0000" "0.850000")
set_tests_properties(gha_test_simple_1000_0_a PROPERTIES  _BACKTRACE_TRIPLES "/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;63;add_test;/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;0;")
add_test(gha_test_simple_1000_0_b "main" "../test/data/1000hz_0.85.pcm" "0" "1000" "0.142476" "0.0000" "0.850000")
set_tests_properties(gha_test_simple_1000_0_b PROPERTIES  _BACKTRACE_TRIPLES "/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;64;add_test;/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;0;")
add_test(gha_test_simple_1000_0_c "main" "../test/data/1000hz_0.85.pcm" "0" "800" "0.142476" "0.0000" "0.850000")
set_tests_properties(gha_test_simple_1000_0_c PROPERTIES  _BACKTRACE_TRIPLES "/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;65;add_test;/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;0;")
add_test(gha_test_simple_1000_90_a "main" "../test/data/1000hz_0.85.pcm" "11" "1024" "0.142476" "1.5670" "0.850000")
set_tests_properties(gha_test_simple_1000_90_a PROPERTIES  _BACKTRACE_TRIPLES "/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;66;add_test;/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;0;")
add_test(gha_test_simple_1000_90_b "main" "../test/data/1000hz_0.85.pcm" "11" "1000" "0.142476" "1.5670" "0.850000")
set_tests_properties(gha_test_simple_1000_90_b PROPERTIES  _BACKTRACE_TRIPLES "/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;67;add_test;/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;0;")
add_test(gha_test_simple_1000_90_c "main" "../test/data/1000hz_0.85.pcm" "11" "800" "0.142476" "1.5670" "0.850000")
set_tests_properties(gha_test_simple_1000_90_c PROPERTIES  _BACKTRACE_TRIPLES "/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;68;add_test;/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;0;")
add_test(gha_test_simple_20000_0_a "main" "../test/data/20000hz_0.85.pcm" "0" "1024" "2.8495171" "0.0000" "0.850000")
set_tests_properties(gha_test_simple_20000_0_a PROPERTIES  _BACKTRACE_TRIPLES "/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;72;add_test;/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;0;")
add_test(gha_test_simple_20000_0_b "main" "../test/data/20000hz_0.85.pcm" "0" "500" "2.8495171" "0.0000" "0.850000")
set_tests_properties(gha_test_simple_20000_0_b PROPERTIES  _BACKTRACE_TRIPLES "/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;73;add_test;/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;0;")
add_test(gha_test_simple_20000_0_c "main" "../test/data/20000hz_0.85.pcm" "0" "128" "2.8495171" "0.0000" "0.850000")
set_tests_properties(gha_test_simple_20000_0_c PROPERTIES  _BACKTRACE_TRIPLES "/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;74;add_test;/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;0;")
add_test(gha_test_simple_20000_0_d "main" "../test/data/20000hz_0.85.pcm" "0" "96" "2.8495171" "0.0000" "0.850000")
set_tests_properties(gha_test_simple_20000_0_d PROPERTIES  _BACKTRACE_TRIPLES "/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;75;add_test;/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;0;")
add_test(gha_test_dtmf_1 "dtmf" "../test/data/dtmf.pcm" "32" "256" "0.547416" "0.201057" "0.949511" "0.200154")
set_tests_properties(gha_test_dtmf_1 PROPERTIES  _BACKTRACE_TRIPLES "/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;77;add_test;/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;0;")
add_test(ut "ut")
set_tests_properties(ut PROPERTIES  _BACKTRACE_TRIPLES "/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;79;add_test;/home/quake/Projects/Spectral-Resonance/src/libgha/CMakeLists.txt;0;")
