function(create_csharp_build_target TARGET_DIRECTORY TARGET_NAME)
    list(SUBLIST ARGV 2 -1 DLL_DEP)

    add_custom_target(${TARGET_NAME} ALL
        COMMAND dotnet
            build "${TARGET_NAME}.csproj"
            -c ${CMAKE_BUILD_TYPE}
        WORKING_DIRECTORY ${TARGET_DIRECTORY}
        DEPENDS ${DLL_DEP}
    )

    add_custom_target(${TARGET_NAME}_build
        COMMAND dotnet run
            --project "${TARGET_NAME}.csproj"
            -c ${CMAKE_BUILD_TYPE}
            --no-build
        WORKING_DIRECTORY ${TARGET_DIRECTORY}
        DEPENDS ${TARGET_NAME}
    )
endfunction()