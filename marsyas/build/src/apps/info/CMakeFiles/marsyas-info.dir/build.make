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
include src/apps/info/CMakeFiles/marsyas-info.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/apps/info/CMakeFiles/marsyas-info.dir/compiler_depend.make

# Include the progress variables for this target.
include src/apps/info/CMakeFiles/marsyas-info.dir/progress.make

# Include the compile flags for this target's objects.
include src/apps/info/CMakeFiles/marsyas-info.dir/flags.make

src/apps/info/CMakeFiles/marsyas-info.dir/marsyas-info.cpp.o: src/apps/info/CMakeFiles/marsyas-info.dir/flags.make
src/apps/info/CMakeFiles/marsyas-info.dir/marsyas-info.cpp.o: /home/quake/Projects/audio-analysis/marsyas/src/apps/info/marsyas-info.cpp
src/apps/info/CMakeFiles/marsyas-info.dir/marsyas-info.cpp.o: src/apps/info/CMakeFiles/marsyas-info.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/quake/Projects/audio-analysis/marsyas/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/apps/info/CMakeFiles/marsyas-info.dir/marsyas-info.cpp.o"
	cd /home/quake/Projects/audio-analysis/marsyas/build/src/apps/info && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/apps/info/CMakeFiles/marsyas-info.dir/marsyas-info.cpp.o -MF CMakeFiles/marsyas-info.dir/marsyas-info.cpp.o.d -o CMakeFiles/marsyas-info.dir/marsyas-info.cpp.o -c /home/quake/Projects/audio-analysis/marsyas/src/apps/info/marsyas-info.cpp

src/apps/info/CMakeFiles/marsyas-info.dir/marsyas-info.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/marsyas-info.dir/marsyas-info.cpp.i"
	cd /home/quake/Projects/audio-analysis/marsyas/build/src/apps/info && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/quake/Projects/audio-analysis/marsyas/src/apps/info/marsyas-info.cpp > CMakeFiles/marsyas-info.dir/marsyas-info.cpp.i

src/apps/info/CMakeFiles/marsyas-info.dir/marsyas-info.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/marsyas-info.dir/marsyas-info.cpp.s"
	cd /home/quake/Projects/audio-analysis/marsyas/build/src/apps/info && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/quake/Projects/audio-analysis/marsyas/src/apps/info/marsyas-info.cpp -o CMakeFiles/marsyas-info.dir/marsyas-info.cpp.s

# Object files for target marsyas-info
marsyas__info_OBJECTS = \
"CMakeFiles/marsyas-info.dir/marsyas-info.cpp.o"

# External object files for target marsyas-info
marsyas__info_EXTERNAL_OBJECTS =

bin/marsyas-info: src/apps/info/CMakeFiles/marsyas-info.dir/marsyas-info.cpp.o
bin/marsyas-info: src/apps/info/CMakeFiles/marsyas-info.dir/build.make
bin/marsyas-info: lib/libmarsyas.so
bin/marsyas-info: /usr/lib/x86_64-linux-gnu/libjack.so
bin/marsyas-info: /usr/lib/x86_64-linux-gnu/libasound.so
bin/marsyas-info: /usr/lib/x86_64-linux-gnu/libsndfile.so
bin/marsyas-info: lib/liboscpack.a
bin/marsyas-info: src/apps/info/CMakeFiles/marsyas-info.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/quake/Projects/audio-analysis/marsyas/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../bin/marsyas-info"
	cd /home/quake/Projects/audio-analysis/marsyas/build/src/apps/info && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/marsyas-info.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/apps/info/CMakeFiles/marsyas-info.dir/build: bin/marsyas-info
.PHONY : src/apps/info/CMakeFiles/marsyas-info.dir/build

src/apps/info/CMakeFiles/marsyas-info.dir/clean:
	cd /home/quake/Projects/audio-analysis/marsyas/build/src/apps/info && $(CMAKE_COMMAND) -P CMakeFiles/marsyas-info.dir/cmake_clean.cmake
.PHONY : src/apps/info/CMakeFiles/marsyas-info.dir/clean

src/apps/info/CMakeFiles/marsyas-info.dir/depend:
	cd /home/quake/Projects/audio-analysis/marsyas/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/quake/Projects/audio-analysis/marsyas /home/quake/Projects/audio-analysis/marsyas/src/apps/info /home/quake/Projects/audio-analysis/marsyas/build /home/quake/Projects/audio-analysis/marsyas/build/src/apps/info /home/quake/Projects/audio-analysis/marsyas/build/src/apps/info/CMakeFiles/marsyas-info.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/apps/info/CMakeFiles/marsyas-info.dir/depend
