#ifndef FD_UTILS_H
#define FD_UTILS_H

float read_highest_temp_from_file();

void write_highest_temp_to_file(float val);

void write_temp_to_csv(float val);

int install_signal_handler();

void write_interruption_to_csv();

#endif // FD_UTILS_H
