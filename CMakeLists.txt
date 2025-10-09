cmake_minimum_required(VERSION 3.29)
project(Logicraft
    LANGUAGES
        CXX
        C
    VERSION 1.0.0)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

add_subdirectory(third_party)
add_subdirectory(prototype)