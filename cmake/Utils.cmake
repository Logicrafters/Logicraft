# Create an executable and create a alias with the designed NameSpace.
function(add_executable_with_namespace NAMESPACE EXECUTABLE)
    add_executable(${EXECUTABLE})
    add_executable(${NAMESPACE}::${EXECUTABLE} ALIAS ${EXECUTABLE})
endfunction()

# Create a library and create a alias with the designed NameSpace.
function(add_library_with_namespace NAMESPACE EXECUTABLE TYPE)
    add_library(${EXECUTABLE} ${TYPE})
    add_library(${NAMESPACE}::${EXECUTABLE} ALIAS ${EXECUTABLE})
endfunction()

# Create two variables, one named SRC_DIR containing "${CMAKE_CURRENT_SOURCE_DIR}/src".
# And another one named INCLUDE_DIR containing "${CMAKE_CURRENT_SOURCE_DIR}/include".
function(create_target_directory_variable SRC_PATH INCLUDE_PATH)
    set(SRC_DIR ${SRC_PATH} PARENT_SCOPE)
    set(INCLUDE_DIR ${INCLUDE_PATH} PARENT_SCOPE)
endfunction()

function(copy_target_dll TARGET_DLL DIRECTORY)
    add_custom_command(TARGET ${TARGET_DLL} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E make_directory "${DIRECTORY}"
        COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:${TARGET_DLL}> "${DIRECTORY}/"
    )
endfunction()