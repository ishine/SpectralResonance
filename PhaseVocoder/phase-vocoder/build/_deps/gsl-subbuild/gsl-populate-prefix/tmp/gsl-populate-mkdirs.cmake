# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/quake/Projects/Spectral-Resonance/PhaseVocoder/phase-vocoder/build/_deps/gsl-src"
  "/home/quake/Projects/Spectral-Resonance/PhaseVocoder/phase-vocoder/build/_deps/gsl-build"
  "/home/quake/Projects/Spectral-Resonance/PhaseVocoder/phase-vocoder/build/_deps/gsl-subbuild/gsl-populate-prefix"
  "/home/quake/Projects/Spectral-Resonance/PhaseVocoder/phase-vocoder/build/_deps/gsl-subbuild/gsl-populate-prefix/tmp"
  "/home/quake/Projects/Spectral-Resonance/PhaseVocoder/phase-vocoder/build/_deps/gsl-subbuild/gsl-populate-prefix/src/gsl-populate-stamp"
  "/home/quake/Projects/Spectral-Resonance/PhaseVocoder/phase-vocoder/build/_deps/gsl-subbuild/gsl-populate-prefix/src"
  "/home/quake/Projects/Spectral-Resonance/PhaseVocoder/phase-vocoder/build/_deps/gsl-subbuild/gsl-populate-prefix/src/gsl-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/quake/Projects/Spectral-Resonance/PhaseVocoder/phase-vocoder/build/_deps/gsl-subbuild/gsl-populate-prefix/src/gsl-populate-stamp/${subDir}")
endforeach()
