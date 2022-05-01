# Install script for directory: /home/quake/Projects/Spectral-Resonance/src/libKeyFinder

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
    set(CMAKE_INSTALL_CONFIG_NAME "")
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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libkeyfinder.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libkeyfinder.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libkeyfinder.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/quake/Projects/Spectral-Resonance/src/libKeyFinder/build/libkeyfinder.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libkeyfinder.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libkeyfinder.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libkeyfinder.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/keyfinder" TYPE FILE FILES
    "/home/quake/Projects/Spectral-Resonance/src/libKeyFinder/audiodata.h"
    "/home/quake/Projects/Spectral-Resonance/src/libKeyFinder/chromagram.h"
    "/home/quake/Projects/Spectral-Resonance/src/libKeyFinder/chromatransform.h"
    "/home/quake/Projects/Spectral-Resonance/src/libKeyFinder/chromatransformfactory.h"
    "/home/quake/Projects/Spectral-Resonance/src/libKeyFinder/fftadapter.h"
    "/home/quake/Projects/Spectral-Resonance/src/libKeyFinder/keyclassifier.h"
    "/home/quake/Projects/Spectral-Resonance/src/libKeyFinder/keyfinder.h"
    "/home/quake/Projects/Spectral-Resonance/src/libKeyFinder/lowpassfilter.h"
    "/home/quake/Projects/Spectral-Resonance/src/libKeyFinder/lowpassfilterfactory.h"
    "/home/quake/Projects/Spectral-Resonance/src/libKeyFinder/spectrumanalyser.h"
    "/home/quake/Projects/Spectral-Resonance/src/libKeyFinder/temporalwindowfactory.h"
    "/home/quake/Projects/Spectral-Resonance/src/libKeyFinder/toneprofiles.h"
    "/home/quake/Projects/Spectral-Resonance/src/libKeyFinder/windowfunctions.h"
    "/home/quake/Projects/Spectral-Resonance/src/libKeyFinder/workspace.h"
    "/home/quake/Projects/Spectral-Resonance/src/libKeyFinder/constants.h"
    "/home/quake/Projects/Spectral-Resonance/src/libKeyFinder/exception.h"
    "/home/quake/Projects/Spectral-Resonance/src/libKeyFinder/binode.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/quake/Projects/Spectral-Resonance/src/libKeyFinder/build/libKeyFinder.pc")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/quake/Projects/Spectral-Resonance/src/libKeyFinder/build/tests/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/quake/Projects/Spectral-Resonance/src/libKeyFinder/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
