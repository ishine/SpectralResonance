# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/googletest-src"
  "/home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/googletest-build"
  "/home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/tests/googletest-download/googletest-prefix"
  "/home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/tests/googletest-download/googletest-prefix/tmp"
  "/home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/tests/googletest-download/googletest-prefix/src/googletest-stamp"
  "/home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/tests/googletest-download/googletest-prefix/src"
  "/home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/tests/googletest-download/googletest-prefix/src/googletest-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/quake/Projects/Spectral-Resonance/src/libspectrogram/build/tests/googletest-download/googletest-prefix/src/googletest-stamp/${subDir}")
endforeach()
