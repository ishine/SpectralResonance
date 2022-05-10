# Install script for directory: /home/quake/Projects/audio-analysis/marsyas/src/apps

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/info/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/mkcollection/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/sfplay/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/sfinfo/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/audioCompare/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/record/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/orcarecord/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/pitchextract/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/bextract/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/nextract/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/phasevocoder/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/kea/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/peakSynth/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/peakClustering/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/peakClustering2/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/WHaSp/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/sfplugin/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/mudbox/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/rhythmMap/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/sound2png/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/sound2sound/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/ibt/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/pitchdtw/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/speakerSeg/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/wreckBeach/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/openmir/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/debugger/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/runner/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/latency/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/script_tools/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/mirex2008/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/mirex2010/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/peakClusteringEval/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/aim/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/tempo/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/virtualsensor/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/onsets/cmake_install.cmake")
  include("/home/quake/Projects/audio-analysis/marsyas/build/src/apps/helloWorld/cmake_install.cmake")

endif()

