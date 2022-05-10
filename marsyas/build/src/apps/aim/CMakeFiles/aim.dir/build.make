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
include src/apps/aim/CMakeFiles/aim.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/apps/aim/CMakeFiles/aim.dir/compiler_depend.make

# Include the progress variables for this target.
include src/apps/aim/CMakeFiles/aim.dir/progress.make

# Include the compile flags for this target's objects.
include src/apps/aim/CMakeFiles/aim.dir/flags.make

src/apps/aim/CMakeFiles/aim.dir/aim.cpp.o: src/apps/aim/CMakeFiles/aim.dir/flags.make
src/apps/aim/CMakeFiles/aim.dir/aim.cpp.o: /home/quake/Projects/audio-analysis/marsyas/src/apps/aim/aim.cpp
src/apps/aim/CMakeFiles/aim.dir/aim.cpp.o: src/apps/aim/CMakeFiles/aim.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/quake/Projects/audio-analysis/marsyas/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/apps/aim/CMakeFiles/aim.dir/aim.cpp.o"
	cd /home/quake/Projects/audio-analysis/marsyas/build/src/apps/aim && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/apps/aim/CMakeFiles/aim.dir/aim.cpp.o -MF CMakeFiles/aim.dir/aim.cpp.o.d -o CMakeFiles/aim.dir/aim.cpp.o -c /home/quake/Projects/audio-analysis/marsyas/src/apps/aim/aim.cpp

src/apps/aim/CMakeFiles/aim.dir/aim.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/aim.dir/aim.cpp.i"
	cd /home/quake/Projects/audio-analysis/marsyas/build/src/apps/aim && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/quake/Projects/audio-analysis/marsyas/src/apps/aim/aim.cpp > CMakeFiles/aim.dir/aim.cpp.i

src/apps/aim/CMakeFiles/aim.dir/aim.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/aim.dir/aim.cpp.s"
	cd /home/quake/Projects/audio-analysis/marsyas/build/src/apps/aim && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/quake/Projects/audio-analysis/marsyas/src/apps/aim/aim.cpp -o CMakeFiles/aim.dir/aim.cpp.s

# Object files for target aim
aim_OBJECTS = \
"CMakeFiles/aim.dir/aim.cpp.o"

# External object files for target aim
aim_EXTERNAL_OBJECTS =

bin/aim: src/apps/aim/CMakeFiles/aim.dir/aim.cpp.o
bin/aim: src/apps/aim/CMakeFiles/aim.dir/build.make
bin/aim: lib/libmarsyas.so
bin/aim: /usr/lib/x86_64-linux-gnu/libjack.so
bin/aim: /usr/lib/x86_64-linux-gnu/libasound.so
bin/aim: /usr/lib/x86_64-linux-gnu/libsndfile.so
bin/aim: lib/liboscpack.a
bin/aim: src/apps/aim/CMakeFiles/aim.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/quake/Projects/audio-analysis/marsyas/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../bin/aim"
	cd /home/quake/Projects/audio-analysis/marsyas/build/src/apps/aim && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/aim.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/apps/aim/CMakeFiles/aim.dir/build: bin/aim
.PHONY : src/apps/aim/CMakeFiles/aim.dir/build

src/apps/aim/CMakeFiles/aim.dir/clean:
	cd /home/quake/Projects/audio-analysis/marsyas/build/src/apps/aim && $(CMAKE_COMMAND) -P CMakeFiles/aim.dir/cmake_clean.cmake
.PHONY : src/apps/aim/CMakeFiles/aim.dir/clean

src/apps/aim/CMakeFiles/aim.dir/depend:
	cd /home/quake/Projects/audio-analysis/marsyas/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/quake/Projects/audio-analysis/marsyas /home/quake/Projects/audio-analysis/marsyas/src/apps/aim /home/quake/Projects/audio-analysis/marsyas/build /home/quake/Projects/audio-analysis/marsyas/build/src/apps/aim /home/quake/Projects/audio-analysis/marsyas/build/src/apps/aim/CMakeFiles/aim.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/apps/aim/CMakeFiles/aim.dir/depend
