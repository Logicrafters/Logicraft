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
function(create_target_directory_variable)
    set(SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src" PARENT_SCOPE)
    set(INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/include" PARENT_SCOPE)
endfunction()