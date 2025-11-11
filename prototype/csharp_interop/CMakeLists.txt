cmake_minimum_required(VERSION 3.29)

project(Logicraft)

include(Utils)
include(CSharpUtils)
include(GenerateExportHeader)

create_target_directory_variable(
        "${CMAKE_CURRENT_SOURCE_DIR}/cpp_files/src"
        "${CMAKE_CURRENT_SOURCE_DIR}/cpp_files/include"
)

add_library_with_namespace(Prototype InteropCPP SHARED)

target_include_directories(InteropCPP
    PUBLIC ${INCLUDE_DIR}
    PRIVATE ${CMAKE_CURRENT_BINARY_DIR}
)

set(SRC_FILES
    "${SRC_DIR}/math_api.cpp"
    "${SRC_DIR}/math_type.cpp"
    "${SRC_DIR}/game_object.cpp"
    "${SRC_DIR}/game_object_holder.cpp"
    "${SRC_DIR}/component.cpp"
)

set(INCLUDE_FILES
    "${INCLUDE_DIR}/math_api.h"
    "${INCLUDE_DIR}/math_type.h"
    "${INCLUDE_DIR}/game_object.h"
    "${INCLUDE_DIR}/game_object_holder.h"
    "${INCLUDE_DIR}/component.h"
)

target_sources(InteropCPP PRIVATE ${SRC_FILES} ${INCLUDE_FILES})

target_compile_features(InteropCPP PRIVATE cxx_std_20)

generate_export_header(InteropCPP)

copy_target_dll(InteropCPP "${CMAKE_CURRENT_SOURCE_DIR}/csharp_files/bin/${CMAKE_BUILD_TYPE}/net8.0")

create_csharp_build_target("${CMAKE_CURRENT_SOURCE_DIR}/csharp_files" interop_testing TRUE InteropCPP)