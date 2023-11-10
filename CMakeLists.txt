cmake_minimum_required(VERSION 3.18.4)

project(freezer-daemon)

# Always generate compile_commands.json for clangd, etc.
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED TRUE)

include(cmake/compiler-flags.cmake)
include(cmake/sanitizers.cmake)


add_subdirectory(src)