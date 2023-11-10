#ifndef FD_GLOBAL_VARS_H
#define FD_GLOBAL_VARS_H

#include <signal.h>

extern volatile sig_atomic_t ev_flag;
extern const char highest_temp_file[];
extern const char csv_file[];
extern const char gpio_path[];

#endif // FD_GLOBAL_VARS_H
