# Install script for directory: /home/quake/Projects/audio-analysis/marsyas/src/marsyas

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/marsyas" TYPE FILE FILES
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/basis.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/Collection.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/Color.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/CommandLineOptions.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/common_header.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/common_source.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/Communicator.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/Conversions.h"
    "/home/quake/Projects/audio-analysis/marsyas/build/src/marsyas/export.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/dsound.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/ERBTools.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/fft.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/FileName.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/Heap.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/lu.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/marohtml.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/marojson.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/marostring.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/marosvg.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/maroxml.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/types.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/MATLABengine.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/mididevices.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/MrsLog.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/NumericLib.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/peakView.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/PeUtilities.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/QGMMModel.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/static_vq_codebook.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/statistics.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/Stk.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/StrobeList.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/Thread.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/TimeLine.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/TranscriberExtract.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/Transcriber.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/vmblock.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/WekaData.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/realvec.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/marsyas/system" TYPE FILE FILES
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/system/MarControlAccessor.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/system/MarControl.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/system/MarControlManager.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/system/MarControlValue.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/system/MarSystem.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/system/MarSystemManager.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/marsyas/sched" TYPE FILE FILES
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/sched/EvEvent.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/sched/EvExpr.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/sched/EvGetUpd.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/sched/EvValUpd.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/sched/Repeat.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/sched/Scheduler.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/sched/TmControlValue.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/sched/TmParam.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/sched/TmRealTime.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/sched/TmSampleCount.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/sched/TmTime.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/sched/TmTimer.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/sched/TmTimerManager.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/sched/TmVirtualTime.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/marsyas/expr" TYPE FILE FILES
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/expr/ExCommon.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/expr/ExNode.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/expr/ExParser.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/expr/Expr.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/expr/ExScanner.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/expr/ExSymTbl.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/expr/ExVal.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/marsyas/realtime" TYPE FILE FILES
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/realtime/any.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/realtime/stage.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/realtime/queue.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/realtime/packet_queue.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/realtime/realvec_queue.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/realtime/atomic_control.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/realtime/controller.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/realtime/osc_receiver.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/realtime/osc_transmitter.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/realtime/udp_receiver.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/realtime/udp_transmitter.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/realtime/runner.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/marsyas/debug" TYPE FILE FILES
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/debug/debugger.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/debug/record.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/debug/recorder.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/debug/file_io.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/marsyas/script" TYPE FILE FILES
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/script/script.h"
    "/home/quake/Projects/audio-analysis/marsyas/src/marsyas/script/manager.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmarsyas.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmarsyas.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmarsyas.so"
         RPATH "@loader_path/../lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/quake/Projects/audio-analysis/marsyas/build/lib/libmarsyas.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmarsyas.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmarsyas.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmarsyas.so"
         OLD_RPATH ":::::::::::::::::::"
         NEW_RPATH "@loader_path/../lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libmarsyas.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

