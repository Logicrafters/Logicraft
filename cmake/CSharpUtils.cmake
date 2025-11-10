function(create_csharp_build_target TARGET_DIRECTORY TARGET_NAME GENERATE_RUN_TARGET)
    list(SUBLIST ARGV 3 -1 DLL_DEP)

    add_custom_target(${TARGET_NAME}_build ALL
        COMMAND dotnet
            build "${TARGET_NAME}.csproj"
            -c ${CMAKE_BUILD_TYPE}
        WORKING_DIRECTORY ${TARGET_DIRECTORY}
        DEPENDS ${DLL_DEP}
    )

    if (GENERATE_RUN_TARGET)
        add_custom_target(${TARGET_NAME}_run
                COMMAND dotnet run
                --project "${TARGET_NAME}.csproj"
                -c ${CMAKE_BUILD_TYPE}
                --no-build
                WORKING_DIRECTORY ${TARGET_DIRECTORY}
                DEPENDS ${TARGET_NAME}_build
        )
    endif ()
endfunction()