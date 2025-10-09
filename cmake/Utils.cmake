function(add_executable_with_namespace NAMESPACE EXECUTABLE)
    add_executable(${EXECUTABLE})
    add_executable(${NAMESPACE}::${EXECUTABLE} ALIAS ${EXECUTABLE})
endfunction()