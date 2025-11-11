cmake_minimum_required(VERSION 3.29)

project(Logicraft)

include(Utils)
include(FetchContent)

set(FETCHCONTENT_BASE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/fetch_content")

if (BUILD_TEST)
    message(STATUS "Build test enable.")

    find_package(GoogleTest 1.17.0 QUIET)

    if (NOT GoogleTest_FOUND)
        message(STATUS "GoogleTest not found using find_package.")
        message(STATUS "Using FetchContent to declare it.")

        download_package(
            googletest
            https://github.com/google/googletest.git
            v1.17.0
            TRUE
            BOOL gtest_force_shared_crt ON ""
            BOOL gtest_build_tests OFF "Turning off gtest tests building."
            BOOL gtest_build_samples OFF "Turning off gtest samples building."
            BOOL gmock_build_tests OFF "Turning off gmock tests building."
        )
    endif()

    enable_testing()
endif ()
