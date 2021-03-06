# - Try to find the ELTOPO library
# Once done this will define
#
#  MESHFIX_FOUND - system has LIBMESHFIX
#  LIBMESHFIX_INCLUDE_DIR - the LIBMESHFIX include directory
#  LIBMESHFIX_LYBRARY - the LIBMESHFIX library
if(NOT LIBMESHFIX_FOUND)

FIND_PATH(LIBMESHFIX_INCLUDE_DIR meshfix.h
   ${PROJECT_SOURCE_DIR}/../../include
   ${PROJECT_SOURCE_DIR}/../include
   ${PROJECT_SOURCE_DIR}/include
   ${PROJECT_SOURCE_DIR}/../../../meshfix/
   /usr/include
   /usr/local/include
)

# Includes must be found
if(NOT LIBMESHFIX_INCLUDE_DIR)
  set(LIBMESHFIX_INCLUDE_DIR FALSE)
  message(FATAL_ERROR "could NOT find LIBMESHFIX_INCLUDE_DIR")
endif(NOT LIBMESHFIX_INCLUDE_DIR)

if(LIBMESHFIX_INCLUDE_DIR)
   set(LIBMESHFIX_FOUND TRUE)
   set(LIBMESHFIX_INCLUDE_DIRS ${LIBMESHFIX_INCLUDE_DIR})
endif(LIBMESHFIX_INCLUDE_DIR)

FIND_LIBRARY(LIBMESHFIX_LIBRARY NAME meshfix PATHS ${LIBMESHFIX_INCLUDE_DIR})

set (LIBMESHFIX_LIBRARY
  ${LIBMESHFIX_LIBRARY}
  ${LIBMESHFIX_INCLUDE_DIR}/JMeshExt-1.0alpha_src/lib/libjmeshext.a
  ${LIBMESHFIX_INCLUDE_DIR}/JMeshLib-1.2/lib/libjmesh.a
  ${LIBMESHFIX_INCLUDE_DIR}/OpenNL3.2.1/binaries/lib/libnl.a
  )

# Main library must be found
if(NOT LIBMESHFIX_LIBRARY)
  set(LIBMESHFIX_FOUND FALSE)
  message(FATAL_ERROR "could NOT find LIBMESHFIX")
endif(NOT LIBMESHFIX_LIBRARY)




if(LIBMESHFIX_FOUND)
   if(NOT LIBMESHFIX_FIND_QUIETLY)
      message(STATUS "Found LIBMESHFIX: ${LIBMESHFIX_LIBRARY}")
   endif(NOT LIBMESHFIX_FIND_QUIETLY)
else(LIBMESHFIX_FOUND)
   if(LIBMESHFIX_FIND_REQUIRED)
      message(FATAL_ERROR "could NOT find LIBMESHFIX")
   endif(LIBMESHFIX_FIND_REQUIRED)
endif(LIBMESHFIX_FOUND)

endif(NOT LIBMESHFIX_FOUND)