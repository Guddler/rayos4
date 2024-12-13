RAYOS4
===

This is a simple hello world style Raylib application.

The purpose of this is to demonstrate buidling both the application and the dependencies
(GLFW and Raylib) using the AmigaGCCOnDocker cross compiler toolchain. It is put together
in such a way that it can be executed from a completely new / clean docker image with no
other dependencies or configuration.

If you spot anything that is coded to my own environment, please raise an issue to let me
know.

The docker image and instructions can be found on Docker Hub [here](https://hub.docker.com/r/walkero/amigagccondocker) with the source [here](https://github.com/walkero-gr/AmigaGCConDocker)

Many thanks to walkero and afxgroup for the time and effort spent on the tools to make this possible.

**IMPORTANT** This does not currently work. The application will not build. BUT, the
two libraries (Raylib and GLFW) do work and can be used with a project direct. You just
need to find them in the build folder (build/glfw3-build/src for example).

This failure is almost certainly a lack of CMake knowledge on my part and will hopefully get
fixed very soon.
