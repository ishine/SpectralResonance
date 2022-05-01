# Install script for directory: /home/quake/Projects/Spectral-Resonance/PhaseVocoder/phase-vocoder/lib

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xPhaseVocoder_Developmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/quake/Projects/Spectral-Resonance/PhaseVocoder/phase-vocoder/build/lib/libsbash64-phase-vocoder.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xPhaseVocoder_Developmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/phase-vocoder" TYPE FILE FILES
    "/home/quake/Projects/Spectral-Resonance/PhaseVocoder/phase-vocoder/lib/include/phase-vocoder/PhaseVocoder.hpp"
    "/home/quake/Projects/Spectral-Resonance/PhaseVocoder/phase-vocoder/lib/include/phase-vocoder/HannWindow.hpp"
    "/home/quake/Projects/Spectral-Resonance/PhaseVocoder/phase-vocoder/lib/include/phase-vocoder/InterpolateFrames.hpp"
    "/home/quake/Projects/Spectral-Resonance/PhaseVocoder/phase-vocoder/lib/include/phase-vocoder/model.hpp"
    "/home/quake/Projects/Spectral-Resonance/PhaseVocoder/phase-vocoder/lib/include/phase-vocoder/OverlapAdd.hpp"
    "/home/quake/Projects/Spectral-Resonance/PhaseVocoder/phase-vocoder/lib/include/phase-vocoder/OverlapAddFilter.hpp"
    "/home/quake/Projects/Spectral-Resonance/PhaseVocoder/phase-vocoder/lib/include/phase-vocoder/OverlapExtract.hpp"
    "/home/quake/Projects/Spectral-Resonance/PhaseVocoder/phase-vocoder/lib/include/phase-vocoder/SampleRateConverter.hpp"
    "/home/quake/Projects/Spectral-Resonance/PhaseVocoder/phase-vocoder/lib/include/phase-vocoder/SignalConverter.hpp"
    "/home/quake/Projects/Spectral-Resonance/PhaseVocoder/phase-vocoder/lib/include/phase-vocoder/utility.hpp"
    )
endif()

