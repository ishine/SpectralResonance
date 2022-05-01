cmake_minimum_required(VERSION 3.14)
project(
  sbash64-phase-vocoder
  VERSION 1.1.0
  LANGUAGES CXX)

include(FetchContent)

FetchContent_Declare(
  GSL
  GIT_REPOSITORY https://github.com/microsoft/GSL
  GIT_TAG v3.1.0)
FetchContent_MakeAvailable(GSL)

add_subdirectory(lib)

option(SBASH64_PHASE_VOCODER_ENABLE_TESTS "Enable tests" OFF)
if(${SBASH64_PHASE_VOCODER_ENABLE_TESTS})
  enable_testing()

  set(gtest_force_shared_crt
      ON
      CACHE BOOL "" FORCE)
  set(BUILD_GMOCK
      OFF
      CACHE BOOL "" FORCE)
  set(INSTALL_GTEST
      OFF
      CACHE BOOL "" FORCE)
  FetchContent_Declare(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest
    GIT_TAG release-1.10.0)
  FetchContent_MakeAvailable(googletest)

  add_subdirectory(tests)
endif()

option(SBASH64_PHASE_VOCODER_ENABLE_EXAMPLE "Enable example" OFF)
if(${SBASH64_PHASE_VOCODER_ENABLE_EXAMPLE})
  set(ENABLE_FLOAT
      ON
      CACHE BOOL "" FORCE)
  set(BUILD_TESTS
      OFF
      CACHE BOOL "" FORCE)
  FetchContent_Declare(
    fftw
    URL http://fftw.org/fftw-3.3.8.tar.gz
    URL_MD5 8aac833c943d8e90d51b697b27d4384d)
  FetchContent_MakeAvailable(fftw)

  enable_language(C)
  FetchContent_Declare(
    portaudio
    GIT_REPOSITORY https://git.assembla.com/portaudio.git
    GIT_TAG pa_stable_v190600_20161030)
  FetchContent_MakeAvailable(portaudio)

  add_subdirectory(example)
endif()

# See Craig Scott's CppCon 2019 talk, "Deep CMake for Library Authors".
# https://github.com/CppCon/CppCon2019/blob/master/Presentations/deep_cmake_for_library_authors/deep_cmake_for_library_authors__craig_scott__cppcon_2019.pdf

# "Setting Install RPATH Details"
if(NOT APPLE)
  set(CMAKE_INSTALL_RPATH $ORIGIN/../${CMAKE_INSTALL_LIBDIR})
endif()
