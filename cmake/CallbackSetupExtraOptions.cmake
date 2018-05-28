##---------------------------------------------------------------------------##
## QMapControl/cmake/CallbackSetupExtraOptions.cmake
## Jordan Lefebvre
##---------------------------------------------------------------------------##

IF (QMapControl_SOURCE_DIR)
  # We need to inject the aptool/cmake directory to find several aptool-specific
  # macros
  SET(CMAKE_MODULE_PATH  ${CMAKE_MODULE_PATH} "${QMapControl_SOURCE_DIR}/cmake")
ENDIF()

##---------------------------------------------------------------------------##

MACRO(TRIBITS_REPOSITORY_SETUP_EXTRA_OPTIONS)
  ########################################
  # C++11
  ########################################

  # Set CXX11 to be enabled by default.
  SET(${PROJECT_NAME}_ENABLE_CXX11_DEFAULT TRUE)

  ########################################
  # STATIC/SHARED BUILD SETUP
  ########################################

  # Add install RPATH when building shared
#  IF(BUILD_SHARED_LIBS AND CMAKE_INSTALL_PREFIX)
  IF(CMAKE_INSTALL_PREFIX)
    SET(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")
  ENDIF()
    SET(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
    IF (CMAKE_SYSTEM_NAME STREQUAL "Darwin")
      SET(CMAKE_INSTALL_RPATH "@loader_path/../lib")
      SET(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)
      SET(CMAKE_SKIP_BUILD_RPATH FALSE)
      SET(CMAKE_MACOSX_RPATH ON)
    ELSEIF("${CMAKE_SYSTEM_NAME}" STREQUAL "Linux")
       # use, i.e. don't skip the full RPATH for the build tree
       SET(CMAKE_SKIP_BUILD_RPATH  FALSE)

       # when building, don't use the install RPATH already
       # (but later on when installing)
       SET(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)

       # the RPATH to be used when installing
       SET(CMAKE_INSTALL_RPATH "\$ORIGIN/../lib/")

       # don't add the automatically determined parts of the RPATH
       # which point to directories outside the build tree to the install RPATH
       SET(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
    ENDIF()
#  ENDIF()

  ########################################
  # QMapControl PACKAGE SETUP
  ########################################

  #
  # Default MPI to OFF
  #
  SET(TPL_ENABLE_MPI OFF CACHE BOOL "" FORCE)
  #
  # Check if the environment has changed whether we want fortran enabled
  #
  IF(NOT "$ENV{${PROJECT_NAME}_ENABLE_Fortran}" STREQUAL "" )
     SET(${PROJECT_NAME}_ENABLE_Fortran $ENV{${PROJECT_NAME}_ENABLE_Fortran})
  ELSE()
     # ensure fortran compiler is set on
     SET(${PROJECT_NAME}_ENABLE_Fortran OFF)
  ENDIF()
  # Set up QMapControl cmake directory, used by default option scripts
  SET(QMapControl_CMAKE_DIR "${QMapControl_SOURCE_DIR}/cmake" CACHE PATH "")

  ########################################
  # INCLUDE DIRECTORY SETUP
  ########################################

  ########################################
  # PLATFORM SETUP
  ########################################


  ########################################
  # INSTALLATION SETUP
  ########################################

ENDMACRO()

##---------------------------------------------------------------------------##
##          end of QMapControl/cmake/CallbackSetupExtraOptions.cmake
##---------------------------------------------------------------------------##
