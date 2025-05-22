set(INSTALL_PATH "modules/unirender")
# set(DEPENDENCY_GLEW_LIBRARY_BIN "./" CACHE STRING "")
pr_install_create_directory("${INSTALL_PATH}")
pr_install_targets(pr_unirender INSTALL_DIR "${INSTALL_PATH}")

if(WIN32)
    set(BIN_DIR "bin/")
else()
    set(BIN_DIR "lib/")
endif()

set(CYCLES_INSTALL_DIR "${INSTALL_PATH}/cycles")

# Install util_raytracing
pr_install_targets(util_raytracing)

# Install binaries
pr_install_directory("${DEPENDENCY_CYCLES_LIBRARY_INSTALL_LOCATION}/" INSTALL_DIR "modules/unirender/cycles")

# assets
pr_install_directory("${CMAKE_CURRENT_LIST_DIR}/assets/" INSTALL_DIR "modules")

if(PR_UNIRENDER_WITH_CYCLES)
	# render_raytracing tool
	pr_install_targets(render_raytracing render_raytracing_lib)
endif()


# Cycles
if(PR_UNIRENDER_WITH_CYCLES)
    pr_install_targets(UniRender_cycles INSTALL_DIR "${CYCLES_INSTALL_DIR}")

    pr_install_create_directory("${CYCLES_INSTALL_DIR}/cache/kernels")
    if(NOT "${DEPENDENCY_CYCLES_BUILD_LOCATION}" STREQUAL "")
        pr_install_directory("${DEPENDENCY_CYCLES_BUILD_LOCATION}/src/kernel/" INSTALL_DIR "${CYCLES_INSTALL_DIR}/lib" PATTERN "*.zst" PATTERN "CMakeFiles" EXCLUDE PATTERN "cycles_kernel.dir" EXCLUDE PATTERN "osl" EXCLUDE PATTERN "x64" EXCLUDE)
    endif()
    if(NOT "${DEPENDENCY_CYCLES_ROOT}" STREQUAL "")
        pr_install_directory("${DEPENDENCY_CYCLES_ROOT}/src/kernel" INSTALL_DIR "${CYCLES_INSTALL_DIR}/source")
        pr_install_directory("${DEPENDENCY_CYCLES_ROOT}/src/util" INSTALL_DIR "${CYCLES_INSTALL_DIR}/source")
    endif()
endif()

# Required for util_raytracing
pr_install_binary(cycles_openimagedenoise LIN "libOpenImageDenoise.so" BIN_DIR "${DEPENDENCY_CYCLES_LIBRARY_INSTALL_LOCATION}")
pr_install_binary(cycles_osd_gpu LIN "libosdGPU.so" BIN_DIR "${DEPENDENCY_CYCLES_LIBRARY_INSTALL_LOCATION}")
pr_install_binary(cycles_osd_cpu LIN "libosdCPU.so" BIN_DIR "${DEPENDENCY_CYCLES_LIBRARY_INSTALL_LOCATION}")
pr_install_binary(cycles_tbb LIN "libtbb.so" BIN_DIR "${DEPENDENCY_CYCLES_LIBRARY_INSTALL_LOCATION}")
pr_install_binary(cycles_boost_thread LIN "libboost_thread.so" BIN_DIR "${DEPENDENCY_CYCLES_LIBRARY_INSTALL_LOCATION}")
pr_install_binary(cycles_boost_atomic LIN "libboost_atomic.so" BIN_DIR "${DEPENDENCY_CYCLES_LIBRARY_INSTALL_LOCATION}")
pr_install_binary(cycles_boost_chrono LIN "libboost_chrono.so" BIN_DIR "${DEPENDENCY_CYCLES_LIBRARY_INSTALL_LOCATION}")

pr_install_binary(cycles_opencolorio LIN "libOpenColorIO.so" BIN_DIR "${DEPENDENCY_CYCLES_LIBRARY_INSTALL_LOCATION}")
pr_install_binary(cycles_openimageio LIN "libOpenImageIO.so" BIN_DIR "${DEPENDENCY_CYCLES_LIBRARY_INSTALL_LOCATION}")
pr_install_binary(cycles_imath LIN "libImath.so" BIN_DIR "${DEPENDENCY_CYCLES_LIBRARY_INSTALL_LOCATION}")
pr_install_binary(cycles_openimageio_util LIN "libOpenImageIO_Util.so" BIN_DIR "${DEPENDENCY_CYCLES_LIBRARY_INSTALL_LOCATION}")
pr_install_binary(cycles_openexr LIN "libOpenEXR.so" BIN_DIR "${DEPENDENCY_CYCLES_LIBRARY_INSTALL_LOCATION}")
pr_install_binary(cycles_openexr_core LIN "libOpenEXRCore.so" BIN_DIR "${DEPENDENCY_CYCLES_LIBRARY_INSTALL_LOCATION}")
pr_install_binary(cycles_ilm_thread LIN "libIlmThread.so" BIN_DIR "${DEPENDENCY_CYCLES_LIBRARY_INSTALL_LOCATION}")
pr_install_binary(cycles_iex LIN "libIex.so" BIN_DIR "${DEPENDENCY_CYCLES_LIBRARY_INSTALL_LOCATION}")
