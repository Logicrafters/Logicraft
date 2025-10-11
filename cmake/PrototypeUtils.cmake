# Put a library name in the PROTOTYPE_LIBRARIES list which is used for the prototype unit tests executable to link the libraries.
# The PROTOTYPE_LIBRARIES list could have other use.
function(register_prototype_library NAME)
    set(PROTOTYPE_LIBRARIES ${PROTOTYPE_LIBRARIES} ${NAME} CACHE INTERNAL "All libraries used by the unit tests executable in the prototype directory.")
endfunction()