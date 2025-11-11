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

function(download_package NAME REPO_LINK REPO_VERSION MAKE_IT_AVAILABLE)
    FetchContent_Declare(
            ${NAME}
            GIT_REPOSITORY ${REPO_LINK}
            GIT_TAG ${REPO_VERSION}
    )

    set(OPTIONS_ARGC 4)

    if (ARGC GREATER OPTIONS_ARGC)
        list(SUBLIST ARGV 4 -1 PACKAGE_OPTIONS)
        math(EXPR PACKAGE_OPTIONS_ARGC "${ARGC} - ${OPTIONS_ARGC}")
        math(EXPR PACKAGE_OPTIONS_MODULO "${PACKAGE_OPTIONS_ARGC} % ${OPTIONS_ARGC}")

        if (PACKAGE_OPTIONS_ARGC LESS 4 OR NOT PACKAGE_OPTIONS_MODULO EQUAL 0)
            message(FATAL_ERROR "Package given arguments are insufficient.")
        endif ()

        set(INDEX 0)
        while (INDEX LESS PACKAGE_OPTIONS_ARGC)
            list(GET PACKAGE_OPTIONS ${INDEX} OPTION_TYPE)
            math(EXPR INDEX "${INDEX} + 1")

            list(GET PACKAGE_OPTIONS ${INDEX} OPTION_NAME)
            math(EXPR INDEX "${INDEX} + 1")

            list(GET PACKAGE_OPTIONS ${INDEX} OPTION_VALUE)
            math(EXPR INDEX "${INDEX} + 1")

            list(GET PACKAGE_OPTIONS ${INDEX} OPTION_DESCRIPTION)
            math(EXPR INDEX "${INDEX} + 1")

            set(${OPTION_NAME} ${OPTION_VALUE} CACHE ${OPTION_TYPE} "${OPTION_DESCRIPTION}")
        endwhile ()
    endif ()

    if (MAKE_IT_AVAILABLE)
        FetchContent_MakeAvailable(googletest)
    endif ()
endfunction()