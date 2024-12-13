# this one is important
SET(CMAKE_SYSTEM_NAME AmigaOS4)
SET(CMAKE_SYSTEM_VERSION 4)
SET(CMAKE_SYSTEM_PROCESSOR "powerpc")
SET(CMAKE_COMMAND /usr/bin/cmake)
SET(AMIGAOS4 1)
SET(CLIB4 1)

SET_PROPERTY(GLOBAL PROPERTY TARGET_SUPPORTS_SHARED_LIBS TRUE)

# specify the cross compiler
SET(CMAKE_C_COMPILER /opt/ppc-amigaos/bin/ppc-amigaos-gcc)
SET(CMAKE_CXX_FLAGS "-mcrt=clib4 -I$ENV{SDK_PATH}/local/common/include -Ofast -mstrict-align")
SET(CMAKE_C_FLAGS "-mcrt=clib4 -I$ENV{SDK_PATH}/local/common/include -Ofast -mstrict-align")
SET(CMAKE_LD_FLAGS "-mcrt=clib4 -athread=native -lpthread")
SET(CMAKE_EXE_LINKER_FLAGS "-mcrt=clib4 -lpthread -Wl,--no-undefined -athread=native")
SET(CMAKE_SHARED_LINKER_FLAGS "-mcrt=clib4 -lpthread -use-dynld -Wl,--no-undefined -athread=native")
# SET(CMAKE_INSTALL_PREFIX $ENV{MY_CLIB4})
# SET(CMAKE_MODULE_LINKER_FLAGS -shared)
# SET(CMAKE_SHARED_LINKER_FLAGS -shared)
SET(CMAKE_CXX_COMPILER /opt/ppc-amigaos/bin/ppc-amigaos-g++)

include_directories(SYSTEM $ENV{SDK_PATH}/local/common/include)

# where is the target environment
SET(CMAKE_FIND_ROOT_PATH $ENV{SDK_PATH}/local/clib4)

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# when building, don't use the install RPATH already
# (but later on when installing)
SET(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)

# the RPATH to be used when installing
SET(CMAKE_INSTALL_RPATH "/opt/clib4")

ADD_DEFINITIONS("-pipe")
SET( EXTRA_LIBS libpthread.a )
SET(CMAKE_C_IMPLICIT_LINK_LIBRARIES "stdc++")
# add imported target
list(APPEND CMAKE_MODULE_PATH $ENV{SDK_PATH}/local/clib4/lib)
