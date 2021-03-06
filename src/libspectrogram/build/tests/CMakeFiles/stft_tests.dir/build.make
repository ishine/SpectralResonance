# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/quake/Projects/Spectral-Resonance/src/libspectrogram

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/quake/Projects/Spectral-Resonance/src/libspectrogram/build

# Include any dependencies generated for this target.
include tests/CMakeFiles/stft_tests.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tests/CMakeFiles/stft_tests.dir/compiler_depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/stft_tests.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/stft_tests.dir/flags.make

tests/CMakeFiles/stft_tests.dir/stft_tester.cpp.o: tests/CMakeFiles/stft_tests.dir/flags.make
tests/CMakeFiles/stft_tests.dir/stft_tester.cpp.o: /home/quake/Projects/Spectral-Resonance/src/libspectrogram/tests/stft_tester.cpp
tests/CMakeFiles/stft_tests.dir/stft_tester.cpp.o: tests/CMakeFiles/stft_tests.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/stft_tests.dir/stft_tester.cpp.o"
	cd /home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tests/CMakeFiles/stft_tests.dir/stft_tester.cpp.o -MF CMakeFiles/stft_tests.dir/stft_tester.cpp.o.d -o CMakeFiles/stft_tests.dir/stft_tester.cpp.o -c /home/quake/Projects/Spectral-Resonance/src/libspectrogram/tests/stft_tester.cpp

tests/CMakeFiles/stft_tests.dir/stft_tester.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/stft_tests.dir/stft_tester.cpp.i"
	cd /home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/quake/Projects/Spectral-Resonance/src/libspectrogram/tests/stft_tester.cpp > CMakeFiles/stft_tests.dir/stft_tester.cpp.i

tests/CMakeFiles/stft_tests.dir/stft_tester.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/stft_tests.dir/stft_tester.cpp.s"
	cd /home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/quake/Projects/Spectral-Resonance/src/libspectrogram/tests/stft_tester.cpp -o CMakeFiles/stft_tests.dir/stft_tester.cpp.s

tests/CMakeFiles/stft_tests.dir/cases.cpp.o: tests/CMakeFiles/stft_tests.dir/flags.make
tests/CMakeFiles/stft_tests.dir/cases.cpp.o: /home/quake/Projects/Spectral-Resonance/src/libspectrogram/tests/cases.cpp
tests/CMakeFiles/stft_tests.dir/cases.cpp.o: tests/CMakeFiles/stft_tests.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object tests/CMakeFiles/stft_tests.dir/cases.cpp.o"
	cd /home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tests/CMakeFiles/stft_tests.dir/cases.cpp.o -MF CMakeFiles/stft_tests.dir/cases.cpp.o.d -o CMakeFiles/stft_tests.dir/cases.cpp.o -c /home/quake/Projects/Spectral-Resonance/src/libspectrogram/tests/cases.cpp

tests/CMakeFiles/stft_tests.dir/cases.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/stft_tests.dir/cases.cpp.i"
	cd /home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/quake/Projects/Spectral-Resonance/src/libspectrogram/tests/cases.cpp > CMakeFiles/stft_tests.dir/cases.cpp.i

tests/CMakeFiles/stft_tests.dir/cases.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/stft_tests.dir/cases.cpp.s"
	cd /home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/quake/Projects/Spectral-Resonance/src/libspectrogram/tests/cases.cpp -o CMakeFiles/stft_tests.dir/cases.cpp.s

tests/CMakeFiles/stft_tests.dir/tests.cpp.o: tests/CMakeFiles/stft_tests.dir/flags.make
tests/CMakeFiles/stft_tests.dir/tests.cpp.o: /home/quake/Projects/Spectral-Resonance/src/libspectrogram/tests/tests.cpp
tests/CMakeFiles/stft_tests.dir/tests.cpp.o: tests/CMakeFiles/stft_tests.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object tests/CMakeFiles/stft_tests.dir/tests.cpp.o"
	cd /home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tests/CMakeFiles/stft_tests.dir/tests.cpp.o -MF CMakeFiles/stft_tests.dir/tests.cpp.o.d -o CMakeFiles/stft_tests.dir/tests.cpp.o -c /home/quake/Projects/Spectral-Resonance/src/libspectrogram/tests/tests.cpp

tests/CMakeFiles/stft_tests.dir/tests.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/stft_tests.dir/tests.cpp.i"
	cd /home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/quake/Projects/Spectral-Resonance/src/libspectrogram/tests/tests.cpp > CMakeFiles/stft_tests.dir/tests.cpp.i

tests/CMakeFiles/stft_tests.dir/tests.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/stft_tests.dir/tests.cpp.s"
	cd /home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/quake/Projects/Spectral-Resonance/src/libspectrogram/tests/tests.cpp -o CMakeFiles/stft_tests.dir/tests.cpp.s

# Object files for target stft_tests
stft_tests_OBJECTS = \
"CMakeFiles/stft_tests.dir/stft_tester.cpp.o" \
"CMakeFiles/stft_tests.dir/cases.cpp.o" \
"CMakeFiles/stft_tests.dir/tests.cpp.o"

# External object files for target stft_tests
stft_tests_EXTERNAL_OBJECTS =

tests/stft_tests: tests/CMakeFiles/stft_tests.dir/stft_tester.cpp.o
tests/stft_tests: tests/CMakeFiles/stft_tests.dir/cases.cpp.o
tests/stft_tests: tests/CMakeFiles/stft_tests.dir/tests.cpp.o
tests/stft_tests: tests/CMakeFiles/stft_tests.dir/build.make
tests/stft_tests: /usr/lib/x86_64-linux-gnu/libfftw3.so
tests/stft_tests: /usr/lib/x86_64-linux-gnu/libfftw3f.so
tests/stft_tests: src/libspectrogram.so.0.1
tests/stft_tests: googletest-build/googlemock/gtest/libgtest_main.a
tests/stft_tests: /usr/lib/x86_64-linux-gnu/libfftw3.so
tests/stft_tests: /usr/lib/x86_64-linux-gnu/libfftw3f.so
tests/stft_tests: googletest-build/googlemock/gtest/libgtest.a
tests/stft_tests: tests/CMakeFiles/stft_tests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable stft_tests"
	cd /home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/stft_tests.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/stft_tests.dir/build: tests/stft_tests
.PHONY : tests/CMakeFiles/stft_tests.dir/build

tests/CMakeFiles/stft_tests.dir/clean:
	cd /home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/stft_tests.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/stft_tests.dir/clean

tests/CMakeFiles/stft_tests.dir/depend:
	cd /home/quake/Projects/Spectral-Resonance/src/libspectrogram/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/quake/Projects/Spectral-Resonance/src/libspectrogram /home/quake/Projects/Spectral-Resonance/src/libspectrogram/tests /home/quake/Projects/Spectral-Resonance/src/libspectrogram/build /home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/tests /home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/tests/CMakeFiles/stft_tests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/stft_tests.dir/depend

