cmake_minimum_required(VERSION 3.29)

project(Logicraft)

include(FetchContent)

set(FETCHCONTENT_BASE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/fetch_content")

if (BUILD_TEST)
    message(STATUS "Build test enable.")

    find_package(GoogleTest 1.17.0 QUIET)

    if (NOT GoogleTest_FOUND)
        message(STATUS "GoogleTest not found using find_package.")
        message(STATUS "Using FetchContent to declare it.")

        FetchContent_Declare(
                googletest
                GIT_REPOSITORY https://github.com/google/googletest.git
                GIT_TAG v1.17.0
                SOURCE_DIR ${FETCHCONTENT_BASE_DIR}/googletest
        )

        set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
        set(gtest_build_tests OFF CACHE BOOL "Turning off gtest tests building.")
        set(gtest_build_samples OFF CACHE BOOL "Turning off gtest samples building.")
        set(gmock_build_tests OFF CACHE BOOL "Turning off gmock tests building.")

        FetchContent_MakeAvailable(googletest)
    endif ()

    enable_testing()
endif ()
