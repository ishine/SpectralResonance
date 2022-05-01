add_executable(
  sbash64-phase-vocoder-tests
  OverlapExtractTests.cpp
  InterpolateFramesTests.cpp
  OverlapAddFilterTests.cpp
  OverlapAddTests.cpp
  SignalConverterTests.cpp
  SampleRateConverterTests.cpp
  HannWindowTests.cpp)
target_compile_features(sbash64-phase-vocoder-tests PRIVATE cxx_std_17)
target_compile_options(sbash64-phase-vocoder-tests
                       PRIVATE ${SBASH64_PHASE_VOCODER_WARNINGS})
set_target_properties(sbash64-phase-vocoder-tests PROPERTIES CXX_EXTENSIONS OFF)
target_link_libraries(sbash64-phase-vocoder-tests sbash64-phase-vocoder
                      gtest_main GSL)
add_test(NAME sbash64-phase-vocoder-tests COMMAND sbash64-phase-vocoder-tests)
