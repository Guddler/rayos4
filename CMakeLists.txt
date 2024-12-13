# You would normally set the toolchain on the calling command line
# with -DCMAKE_TOOLCHAIN_FILE=<path_to_file> but for the sake of
# making this example as self contained and easy to use as possible
# we will specify it here instead. This IS valid. Just not what you
# would normally do.
#
# When setting it in here it has to be before the project definition
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_SOURCE_DIR}/clib4.cmake)

cmake_minimum_required(VERSION 3.28)
project(hello_raylib)

include(FetchContent)
set(FETCHCONTENT_QUIET NO)

#---------- START GLFW3 ----------
set(GLFW_VERSION 3.3.3)
FetchContent_Declare(
	glfw3
	# Preferably use an explicit tag or commit
	GIT_REPOSITORY 	https://github.com/afxgroup/glfw.git
	GIT_TAG			38a11eed61e0cc83b827d4577fd9e88d58ed7ae7
	# but if you need to, you can use a branch
	# URL https://github.com/afxgroup/glfw/archive/refs/heads/master.tar.gz
	FIND_PACKAGE_ARGS ${GLFW_VERSION} EXACT
)
FetchContent_GetProperties(glfw3)
set(BUILD_SHARED_LIBS OFF CACHE INTERNAL "")
set(GLFW_BUILD_OS4 ON CACHE INTERNAL "")
#---------- END GLFW3 ----------

#---------- START RayLib ----------
set(RAYLIB_VERSION 4.5.0)

FetchContent_Declare(
	raylib
	# Tag / commit
	GIT_REPOSITORY 	https://github.com/afxgroup/raylib.git
	GIT_TAG			9fee03fa3e6915d8152f35edeac44437c5256a05
	# Or branch
	# URL https://github.com/afxgroup/raylib/archive/refs/heads/amigaOS4.tar.gz
	FIND_PACKAGE_ARGS ${RAYLIB_VERSION} EXACT
)
FetchContent_GetProperties(raylib)

set(glfw3_DIR _deps/glfw3-src/include CACHE INTERNAL "")
set(BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(PLATFORM Desktop CACHE INTERNAL "")
set(BUILD_EXAMPLES OFF CACHE INTERNAL "")
set(CMAKE_BUILD_TYPE Release CACHE INTERNAL "")
set(USE_EXTERNAL_GLFW ON CACHE INTERNAL "")
set(GRAPHICS GRAPHICS_API_OPENGL_21 CACHE INTERNAL "")
set(OPENGL_INCLUDE_DIR ${glfw3_DIR} CACHE INTERNAL "")
#---------- END RayLib ----------

FetchContent_MakeAvailable(glfw3 raylib)

set(SOURCE_FILES Main.cpp)

add_executable(${PROJECT_NAME} ${SOURCE_FILES})
target_link_libraries(${PROJECT_NAME} glfw3 raylib)
