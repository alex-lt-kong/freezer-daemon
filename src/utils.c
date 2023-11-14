#include "global_vars.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>
#include <time.h>
#include <unistd.h>

float read_highest_temp_from_file() {
  float temp = -99.9;
  FILE *file;
  char line[256];

  // Open the file in read mode
  file = fopen(highest_temp_file, "r");

  if (file == NULL) {
    syslog(LOG_ERR, "Failed to open file %s", highest_temp_file);
    return temp;
  }
  // Read a line from the file
  if (fgets(line, sizeof(line), file) != NULL) {
    temp = atof(line);
  } else {
    syslog(LOG_ERR, "Failed to read a line from the file %s",
           highest_temp_file);
  }

  // Close the file
  fclose(file);

  return temp;
}

void write_highest_temp_to_file(float val) {
  FILE *file;
  file = fopen(highest_temp_file, "w");

  if (file == NULL) {
    syslog(LOG_ERR, "Failed to open the file %s", highest_temp_file);
    return;
  }
  fprintf(file, "%f", val);
  fclose(file);
}

void write_temp_to_csv(float val) {
  time_t rawTime;
  struct tm *timeInfo;
  char buffer[] = "1970-01-01T00:00:00";

  time(&rawTime);
  timeInfo = localtime(&rawTime);
  strftime(buffer, sizeof(buffer), "%Y-%m-%dT%H:%M:%S", timeInfo);

  FILE *file;
  file = fopen(csv_file, "a");
  if (file == NULL) {
    syslog(LOG_INFO, "Failed to open the file [%s]", csv_file);
    return;
  }
  fprintf(file, "%s,%f\n", buffer, val);
  fclose(file);
}

void write_interruption_to_csv() {
  time_t rawTime;
  struct tm *timeInfo;
  char buffer[] = "1970-01-01T00:00:00";

  time(&rawTime);
  timeInfo = localtime(&rawTime);
  strftime(buffer, sizeof(buffer), "%Y-%m-%dT%H:%M:%S", timeInfo);

  FILE *file;
  file = fopen(interruption_csv_file, "a");
  if (file == NULL) {
    syslog(LOG_INFO, "Failed to open the file [%s]", interruption_csv_file);
    return;
  }
  fprintf(file, "%s\n", buffer);
  fclose(file);
}

void signal_handler(int signum) {
  ev_flag = 1;
  char msg[] = "Signal [  ] caught\n";
  msg[8] = '0' + signum / 10;
  msg[9] = '0' + signum % 10;
  write(STDERR_FILENO, msg, strlen(msg));
}


int install_signal_handler() {
  // This design canNOT handle more than 99 signal types
  if (_NSIG > 99) {
    syslog(LOG_ERR, "signal_handler() can't handle more than 99 signals");
    return -1;
  }
  struct sigaction act;
  // Initialize the signal set to empty, similar to memset(0)
  if (sigemptyset(&act.sa_mask) == -1) {
    syslog(LOG_ERR, "sigemptyset() failed");
    return -1;
  }
  act.sa_handler = signal_handler;
  /*
  * SA_RESETHAND means we want our signal_handler() to intercept the signal
  once. If a signal is sent twice, the default signal handler will be used
  again. `man sigaction` describes more possible sa_flags.
  * In this particular case, we should not enable SA_RESETHAND, mainly
  due to the issue that if a child process is kill, multiple SIGPIPE will
  be invoked consecutively, breaking the program.
  * Without setting SA_RESETHAND, catching SIGSEGV is usually a bad idea.
  The issue is, if an instruction results in segfault, SIGSEGV handler is
  called, then the very same instruction will be repeated, triggering
  segfault again. */
  // act.sa_flags = SA_RESETHAND;
  act.sa_flags = 0;
  if (sigaction(SIGINT, &act, 0) + sigaction(SIGABRT, &act, 0) +
          sigaction(SIGQUIT, &act, 0) + sigaction(SIGTERM, &act, 0) <
      0) {

    /* Could miss some error if more than one sigaction() fails. However,
    given that the program will quit if one sigaction() fails, this
    is not considered an issue */
    syslog(LOG_ERR, "sigaction() failed");
    return -1;
  }
  return 0;
}
