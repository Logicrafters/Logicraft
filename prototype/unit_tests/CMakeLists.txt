cmake_minimum_required(VERSION 3.29)

project(Logicraft)

include(GoogleTest)

add_executable_with_namespace(Prototype UnitTest)

target_sources(UnitTest PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/unit_tests.cpp")

target_compile_features(UnitTest PRIVATE cxx_std_20)

target_link_libraries(UnitTest
        PRIVATE
            GTest::gtest_main
            ${PROTOTYPE_LIBRARIES}
)

gtest_discover_tests(UnitTest)