cmake_minimum_required(VERSION 3.29)

project(Logicraft)

include(FetchContent)

set(FETCHCONTENT_BASE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/fetch_content")

if (BUILD_TEST)
    find_package(GoogleTest QUIET)

    if (NOT GoogleTest_FOUND)
        FetchContent_Declare(
                googletest
                GIT_REPOSITORY https://github.com/google/googletest.git
                GIT_TAG v1.17.0
        )

        set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
        FetchContent_MakeAvailable(googletest)
    endif ()

    enable_testing()
endif ()
