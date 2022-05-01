option(SBASH64_PHASE_VOCODER_USE_ALSA_REALTIME_SCHEDULING
       "Use ALSA realtime scheduling" OFF)
if(${SBASH64_PHASE_VOCODER_USE_ALSA_REALTIME_SCHEDULING})
  set(SBASH64_PHASE_VOCODER_EXAMPLE_MAIN main-alsa.cpp)
else()
  set(SBASH64_PHASE_VOCODER_EXAMPLE_MAIN main-default.cpp)
endif()

add_executable(sbash64-phase-vocoder-example
               mono-live-vocoding.cpp ${SBASH64_PHASE_VOCODER_EXAMPLE_MAIN})
target_include_directories(sbash64-phase-vocoder-example
                           PRIVATE ${fftw_SOURCE_DIR}/api)
target_link_libraries(sbash64-phase-vocoder-example fftw3f portaudio
                      sbash64-phase-vocoder)
target_compile_options(sbash64-phase-vocoder-example
                       PRIVATE ${SBASH64_PHASE_VOCODER_WARNINGS})
set_target_properties(sbash64-phase-vocoder-example PROPERTIES CXX_EXTENSIONS
                                                               OFF)
