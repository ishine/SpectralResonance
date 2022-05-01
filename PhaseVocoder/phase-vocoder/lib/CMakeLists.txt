add_library(
  sbash64-phase-vocoder
  OverlapAdd.cpp OverlapAddFilter.cpp OverlapExtract.cpp InterpolateFrames.cpp
  SignalConverter.cpp HannWindow.cpp)
set(SBASH64_PHASE_VOCODER_INCLUDE_RELATIVE_PATH include/phase-vocoder)
set_target_properties(
  sbash64-phase-vocoder
  PROPERTIES
    PUBLIC_HEADER
    "${SBASH64_PHASE_VOCODER_INCLUDE_RELATIVE_PATH}/PhaseVocoder.hpp;${SBASH64_PHASE_VOCODER_INCLUDE_RELATIVE_PATH}/HannWindow.hpp;${SBASH64_PHASE_VOCODER_INCLUDE_RELATIVE_PATH}/InterpolateFrames.hpp;${SBASH64_PHASE_VOCODER_INCLUDE_RELATIVE_PATH}/model.hpp;${SBASH64_PHASE_VOCODER_INCLUDE_RELATIVE_PATH}/OverlapAdd.hpp;${SBASH64_PHASE_VOCODER_INCLUDE_RELATIVE_PATH}/OverlapAddFilter.hpp;${SBASH64_PHASE_VOCODER_INCLUDE_RELATIVE_PATH}/OverlapExtract.hpp;${SBASH64_PHASE_VOCODER_INCLUDE_RELATIVE_PATH}/SampleRateConverter.hpp;${SBASH64_PHASE_VOCODER_INCLUDE_RELATIVE_PATH}/SignalConverter.hpp;${SBASH64_PHASE_VOCODER_INCLUDE_RELATIVE_PATH}/utility.hpp"
)
target_include_directories(sbash64-phase-vocoder PUBLIC include)
target_include_directories(sbash64-phase-vocoder
                           PRIVATE include/sbash64/phase-vocoder)
target_compile_options(sbash64-phase-vocoder
                       PRIVATE ${SBASH64_PHASE_VOCODER_WARNINGS})
target_compile_features(sbash64-phase-vocoder PUBLIC cxx_std_17)
set_target_properties(sbash64-phase-vocoder PROPERTIES CXX_EXTENSIONS OFF)
target_link_libraries(sbash64-phase-vocoder GSL)

# See Craig Scott's CppCon 2019 talk, "Deep CMake for Library Authors".
# https://github.com/CppCon/CppCon2019/blob/master/Presentations/deep_cmake_for_library_authors/deep_cmake_for_library_authors__craig_scott__cppcon_2019.pdf

# "Installing Libraries With CMake"
include(GNUInstallDirs)
install(
  TARGETS sbash64-phase-vocoder
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT PhaseVocoder_RunTime
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
          COMPONENT PhaseVocoder_RunTime
          NAMELINK_COMPONENT PhaseVocoder_Development
  ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR} COMPONENT PhaseVocoder_Development
  PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/phase-vocoder
                COMPONENT PhaseVocoder_Development)
