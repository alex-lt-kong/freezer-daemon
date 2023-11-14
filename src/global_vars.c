#include "global_vars.h"

volatile sig_atomic_t ev_flag = 0;
const char highest_temp_file[] = "/home/mamsds/bin/freezer-daemon/temp.highest";
const char csv_file[] = "/home/mamsds/bin/freezer-daemon/temp.csv";
const char interruption_csv_file[] = "/home/mamsds/bin/freezer-daemon/interruption.csv";
const char gpio_path[] = "/dev/gpiochip0";
