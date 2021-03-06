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
include src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/compiler_depend.make

# Include the progress variables for this target.
include src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/progress.make

# Include the compile flags for this target's objects.
include src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/flags.make

src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/pitchdtw_pair.cpp.o: src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/flags.make
src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/pitchdtw_pair.cpp.o: /home/quake/Projects/audio-analysis/marsyas/src/apps/pitchdtw/pitchdtw_pair.cpp
src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/pitchdtw_pair.cpp.o: src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/quake/Projects/audio-analysis/marsyas/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/pitchdtw_pair.cpp.o"
	cd /home/quake/Projects/audio-analysis/marsyas/build/src/apps/pitchdtw && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/pitchdtw_pair.cpp.o -MF CMakeFiles/pitchdtw_pair.dir/pitchdtw_pair.cpp.o.d -o CMakeFiles/pitchdtw_pair.dir/pitchdtw_pair.cpp.o -c /home/quake/Projects/audio-analysis/marsyas/src/apps/pitchdtw/pitchdtw_pair.cpp

src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/pitchdtw_pair.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pitchdtw_pair.dir/pitchdtw_pair.cpp.i"
	cd /home/quake/Projects/audio-analysis/marsyas/build/src/apps/pitchdtw && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/quake/Projects/audio-analysis/marsyas/src/apps/pitchdtw/pitchdtw_pair.cpp > CMakeFiles/pitchdtw_pair.dir/pitchdtw_pair.cpp.i

src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/pitchdtw_pair.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pitchdtw_pair.dir/pitchdtw_pair.cpp.s"
	cd /home/quake/Projects/audio-analysis/marsyas/build/src/apps/pitchdtw && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/quake/Projects/audio-analysis/marsyas/src/apps/pitchdtw/pitchdtw_pair.cpp -o CMakeFiles/pitchdtw_pair.dir/pitchdtw_pair.cpp.s

# Object files for target pitchdtw_pair
pitchdtw_pair_OBJECTS = \
"CMakeFiles/pitchdtw_pair.dir/pitchdtw_pair.cpp.o"

# External object files for target pitchdtw_pair
pitchdtw_pair_EXTERNAL_OBJECTS =

bin/pitchdtw_pair: src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/pitchdtw_pair.cpp.o
bin/pitchdtw_pair: src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/build.make
bin/pitchdtw_pair: lib/libmarsyas.so
bin/pitchdtw_pair: /usr/lib/x86_64-linux-gnu/libjack.so
bin/pitchdtw_pair: /usr/lib/x86_64-linux-gnu/libasound.so
bin/pitchdtw_pair: /usr/lib/x86_64-linux-gnu/libsndfile.so
bin/pitchdtw_pair: lib/liboscpack.a
bin/pitchdtw_pair: src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/quake/Projects/audio-analysis/marsyas/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../bin/pitchdtw_pair"
	cd /home/quake/Projects/audio-analysis/marsyas/build/src/apps/pitchdtw && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pitchdtw_pair.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/build: bin/pitchdtw_pair
.PHONY : src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/build

src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/clean:
	cd /home/quake/Projects/audio-analysis/marsyas/build/src/apps/pitchdtw && $(CMAKE_COMMAND) -P CMakeFiles/pitchdtw_pair.dir/cmake_clean.cmake
.PHONY : src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/clean

src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/depend:
	cd /home/quake/Projects/audio-analysis/marsyas/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/quake/Projects/audio-analysis/marsyas /home/quake/Projects/audio-analysis/marsyas/src/apps/pitchdtw /home/quake/Projects/audio-analysis/marsyas/build /home/quake/Projects/audio-analysis/marsyas/build/src/apps/pitchdtw /home/quake/Projects/audio-analysis/marsyas/build/src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/apps/pitchdtw/CMakeFiles/pitchdtw_pair.dir/depend

