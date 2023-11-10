#include "event_loops.h"
#include "global_vars.h"
#include "utils.h"

#include <iotctrl/buzzer.h>

#include <pthread.h>
#include <syslog.h>
#include <unistd.h>

int main(void) {
  if (install_signal_handler() != 0) {
    return -1;
  }
  const struct iotctrl_buzz_unit sequence[] = {{1, 100}, {0, 100}, {1, 100},
                                               {0, 100}, {1, 100}, {0, 100}};
  const size_t length = sizeof(sequence) / sizeof(sequence[0]);
  (void)openlog("freezer-daemon", LOG_PID | LOG_CONS, 0);
  syslog(LOG_INFO, "freezer-daemon started");
  if (iotctrl_make_a_buzz(gpio_path, 4, sequence, length) != 0) {
    syslog(LOG_ERR, "iotctrl_make_a_buzz() failed");
  }

  pthread_t threads[2];
  if (pthread_create(&threads[0], NULL, ev_temp_sensor, NULL) != 0 ||
      pthread_create(&threads[1], NULL, ev_test_internet, NULL) != 0) {
    syslog(LOG_ERR, "Failed to create essential threads, program will quit");
    ev_flag = 1;
  }
  for (size_t i = 0; i < sizeof(threads) / sizeof(threads[0]); ++i) {
    pthread_join(threads[i], NULL);
  }

  closelog();
  return 0;
}
