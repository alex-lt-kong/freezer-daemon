# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mamsds/bin/freezer-daemon

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mamsds/bin/freezer-daemon/build

# Include any dependencies generated for this target.
include src/CMakeFiles/fd.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/CMakeFiles/fd.dir/compiler_depend.make

# Include the progress variables for this target.
include src/CMakeFiles/fd.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/fd.dir/flags.make

src/CMakeFiles/fd.dir/main.c.o: src/CMakeFiles/fd.dir/flags.make
src/CMakeFiles/fd.dir/main.c.o: /home/mamsds/bin/freezer-daemon/src/main.c
src/CMakeFiles/fd.dir/main.c.o: src/CMakeFiles/fd.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mamsds/bin/freezer-daemon/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/CMakeFiles/fd.dir/main.c.o"
	cd /home/mamsds/bin/freezer-daemon/build/src && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/CMakeFiles/fd.dir/main.c.o -MF CMakeFiles/fd.dir/main.c.o.d -o CMakeFiles/fd.dir/main.c.o -c /home/mamsds/bin/freezer-daemon/src/main.c

src/CMakeFiles/fd.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fd.dir/main.c.i"
	cd /home/mamsds/bin/freezer-daemon/build/src && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mamsds/bin/freezer-daemon/src/main.c > CMakeFiles/fd.dir/main.c.i

src/CMakeFiles/fd.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fd.dir/main.c.s"
	cd /home/mamsds/bin/freezer-daemon/build/src && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mamsds/bin/freezer-daemon/src/main.c -o CMakeFiles/fd.dir/main.c.s

src/CMakeFiles/fd.dir/event_loops.c.o: src/CMakeFiles/fd.dir/flags.make
src/CMakeFiles/fd.dir/event_loops.c.o: /home/mamsds/bin/freezer-daemon/src/event_loops.c
src/CMakeFiles/fd.dir/event_loops.c.o: src/CMakeFiles/fd.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mamsds/bin/freezer-daemon/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object src/CMakeFiles/fd.dir/event_loops.c.o"
	cd /home/mamsds/bin/freezer-daemon/build/src && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/CMakeFiles/fd.dir/event_loops.c.o -MF CMakeFiles/fd.dir/event_loops.c.o.d -o CMakeFiles/fd.dir/event_loops.c.o -c /home/mamsds/bin/freezer-daemon/src/event_loops.c

src/CMakeFiles/fd.dir/event_loops.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fd.dir/event_loops.c.i"
	cd /home/mamsds/bin/freezer-daemon/build/src && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mamsds/bin/freezer-daemon/src/event_loops.c > CMakeFiles/fd.dir/event_loops.c.i

src/CMakeFiles/fd.dir/event_loops.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fd.dir/event_loops.c.s"
	cd /home/mamsds/bin/freezer-daemon/build/src && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mamsds/bin/freezer-daemon/src/event_loops.c -o CMakeFiles/fd.dir/event_loops.c.s

src/CMakeFiles/fd.dir/global_vars.c.o: src/CMakeFiles/fd.dir/flags.make
src/CMakeFiles/fd.dir/global_vars.c.o: /home/mamsds/bin/freezer-daemon/src/global_vars.c
src/CMakeFiles/fd.dir/global_vars.c.o: src/CMakeFiles/fd.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mamsds/bin/freezer-daemon/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object src/CMakeFiles/fd.dir/global_vars.c.o"
	cd /home/mamsds/bin/freezer-daemon/build/src && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/CMakeFiles/fd.dir/global_vars.c.o -MF CMakeFiles/fd.dir/global_vars.c.o.d -o CMakeFiles/fd.dir/global_vars.c.o -c /home/mamsds/bin/freezer-daemon/src/global_vars.c

src/CMakeFiles/fd.dir/global_vars.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fd.dir/global_vars.c.i"
	cd /home/mamsds/bin/freezer-daemon/build/src && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mamsds/bin/freezer-daemon/src/global_vars.c > CMakeFiles/fd.dir/global_vars.c.i

src/CMakeFiles/fd.dir/global_vars.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fd.dir/global_vars.c.s"
	cd /home/mamsds/bin/freezer-daemon/build/src && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mamsds/bin/freezer-daemon/src/global_vars.c -o CMakeFiles/fd.dir/global_vars.c.s

src/CMakeFiles/fd.dir/utils.c.o: src/CMakeFiles/fd.dir/flags.make
src/CMakeFiles/fd.dir/utils.c.o: /home/mamsds/bin/freezer-daemon/src/utils.c
src/CMakeFiles/fd.dir/utils.c.o: src/CMakeFiles/fd.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mamsds/bin/freezer-daemon/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object src/CMakeFiles/fd.dir/utils.c.o"
	cd /home/mamsds/bin/freezer-daemon/build/src && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT src/CMakeFiles/fd.dir/utils.c.o -MF CMakeFiles/fd.dir/utils.c.o.d -o CMakeFiles/fd.dir/utils.c.o -c /home/mamsds/bin/freezer-daemon/src/utils.c

src/CMakeFiles/fd.dir/utils.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/fd.dir/utils.c.i"
	cd /home/mamsds/bin/freezer-daemon/build/src && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mamsds/bin/freezer-daemon/src/utils.c > CMakeFiles/fd.dir/utils.c.i

src/CMakeFiles/fd.dir/utils.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/fd.dir/utils.c.s"
	cd /home/mamsds/bin/freezer-daemon/build/src && /usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mamsds/bin/freezer-daemon/src/utils.c -o CMakeFiles/fd.dir/utils.c.s

# Object files for target fd
fd_OBJECTS = \
"CMakeFiles/fd.dir/main.c.o" \
"CMakeFiles/fd.dir/event_loops.c.o" \
"CMakeFiles/fd.dir/global_vars.c.o" \
"CMakeFiles/fd.dir/utils.c.o"

# External object files for target fd
fd_EXTERNAL_OBJECTS =

src/fd: src/CMakeFiles/fd.dir/main.c.o
src/fd: src/CMakeFiles/fd.dir/event_loops.c.o
src/fd: src/CMakeFiles/fd.dir/global_vars.c.o
src/fd: src/CMakeFiles/fd.dir/utils.c.o
src/fd: src/CMakeFiles/fd.dir/build.make
src/fd: src/CMakeFiles/fd.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mamsds/bin/freezer-daemon/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking C executable fd"
	cd /home/mamsds/bin/freezer-daemon/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fd.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/fd.dir/build: src/fd
.PHONY : src/CMakeFiles/fd.dir/build

src/CMakeFiles/fd.dir/clean:
	cd /home/mamsds/bin/freezer-daemon/build/src && $(CMAKE_COMMAND) -P CMakeFiles/fd.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/fd.dir/clean

src/CMakeFiles/fd.dir/depend:
	cd /home/mamsds/bin/freezer-daemon/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mamsds/bin/freezer-daemon /home/mamsds/bin/freezer-daemon/src /home/mamsds/bin/freezer-daemon/build /home/mamsds/bin/freezer-daemon/build/src /home/mamsds/bin/freezer-daemon/build/src/CMakeFiles/fd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/fd.dir/depend
