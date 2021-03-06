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
CMAKE_SOURCE_DIR = /home/quake/Projects/audio-analysis/marsyas

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/quake/Projects/audio-analysis/marsyas/build

# Include any dependencies generated for this target.
include src/apps/latency/CMakeFiles/marsyas-latency-test.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/apps/latency/CMakeFiles/marsyas-latency-test.dir/compiler_depend.make

# Include the progress variables for this target.
include src/apps/latency/CMakeFiles/marsyas-latency-test.dir/progress.make

# Include the compile flags for this target's objects.
include src/apps/latency/CMakeFiles/marsyas-latency-test.dir/flags.make

src/apps/latency/CMakeFiles/marsyas-latency-test.dir/main.cpp.o: src/apps/latency/CMakeFiles/marsyas-latency-test.dir/flags.make
src/apps/latency/CMakeFiles/marsyas-latency-test.dir/main.cpp.o: /home/quake/Projects/audio-analysis/marsyas/src/apps/latency/main.cpp
src/apps/latency/CMakeFiles/marsyas-latency-test.dir/main.cpp.o: src/apps/latency/CMakeFiles/marsyas-latency-test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/quake/Projects/audio-analysis/marsyas/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/apps/latency/CMakeFiles/marsyas-latency-test.dir/main.cpp.o"
	cd /home/quake/Projects/audio-analysis/marsyas/build/src/apps/latency && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/apps/latency/CMakeFiles/marsyas-latency-test.dir/main.cpp.o -MF CMakeFiles/marsyas-latency-test.dir/main.cpp.o.d -o CMakeFiles/marsyas-latency-test.dir/main.cpp.o -c /home/quake/Projects/audio-analysis/marsyas/src/apps/latency/main.cpp

src/apps/latency/CMakeFiles/marsyas-latency-test.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/marsyas-latency-test.dir/main.cpp.i"
	cd /home/quake/Projects/audio-analysis/marsyas/build/src/apps/latency && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/quake/Projects/audio-analysis/marsyas/src/apps/latency/main.cpp > CMakeFiles/marsyas-latency-test.dir/main.cpp.i

src/apps/latency/CMakeFiles/marsyas-latency-test.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/marsyas-latency-test.dir/main.cpp.s"
	cd /home/quake/Projects/audio-analysis/marsyas/build/src/apps/latency && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/quake/Projects/audio-analysis/marsyas/src/apps/latency/main.cpp -o CMakeFiles/marsyas-latency-test.dir/main.cpp.s

# Object files for target marsyas-latency-test
marsyas__latency__test_OBJECTS = \
"CMakeFiles/marsyas-latency-test.dir/main.cpp.o"

# External object files for target marsyas-latency-test
marsyas__latency__test_EXTERNAL_OBJECTS =

bin/marsyas-latency-test: src/apps/latency/CMakeFiles/marsyas-latency-test.dir/main.cpp.o
bin/marsyas-latency-test: src/apps/latency/CMakeFiles/marsyas-latency-test.dir/build.make
bin/marsyas-latency-test: lib/libmarsyas.so
bin/marsyas-latency-test: /usr/lib/x86_64-linux-gnu/libjack.so
bin/marsyas-latency-test: /usr/lib/x86_64-linux-gnu/libasound.so
bin/marsyas-latency-test: /usr/lib/x86_64-linux-gnu/libsndfile.so
bin/marsyas-latency-test: lib/liboscpack.a
bin/marsyas-latency-test: src/apps/latency/CMakeFiles/marsyas-latency-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/quake/Projects/audio-analysis/marsyas/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../bin/marsyas-latency-test"
	cd /home/quake/Projects/audio-analysis/marsyas/build/src/apps/latency && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/marsyas-latency-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/apps/latency/CMakeFiles/marsyas-latency-test.dir/build: bin/marsyas-latency-test
.PHONY : src/apps/latency/CMakeFiles/marsyas-latency-test.dir/build

src/apps/latency/CMakeFiles/marsyas-latency-test.dir/clean:
	cd /home/quake/Projects/audio-analysis/marsyas/build/src/apps/latency && $(CMAKE_COMMAND) -P CMakeFiles/marsyas-latency-test.dir/cmake_clean.cmake
.PHONY : src/apps/latency/CMakeFiles/marsyas-latency-test.dir/clean

src/apps/latency/CMakeFiles/marsyas-latency-test.dir/depend:
	cd /home/quake/Projects/audio-analysis/marsyas/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/quake/Projects/audio-analysis/marsyas /home/quake/Projects/audio-analysis/marsyas/src/apps/latency /home/quake/Projects/audio-analysis/marsyas/build /home/quake/Projects/audio-analysis/marsyas/build/src/apps/latency /home/quake/Projects/audio-analysis/marsyas/build/src/apps/latency/CMakeFiles/marsyas-latency-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/apps/latency/CMakeFiles/marsyas-latency-test.dir/depend

