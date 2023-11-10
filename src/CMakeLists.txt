include_directories (${PROJECT_SOURCE_DIR}/src/) 

add_executable(fd
    main.c
    event_loops.c
    global_vars.c
    utils.c
)

target_link_libraries(fd iotctrl modbus gpiod curl)
