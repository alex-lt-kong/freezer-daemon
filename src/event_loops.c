#include "global_vars.h"
#include "utils.h"

#include <curl/curl.h>
#include <iotctrl/7segment-display.h>
#include <iotctrl/buzzer.h>
#include <iotctrl/temp-sensor.h>

#include <stdbool.h>
#include <sys/syslog.h>
#include <syslog.h>
#include <unistd.h>

void *ev_temp_sensor(void *_) {
  (void)_;
  const float warning_level = -20;
  const struct iotctrl_buzz_unit sequence_warning[] = {
      {1, 1000}, {0, 1000}, {1, 1000}, {0, 1000}, {1, 1000}, {0, 2000},
      {1, 1000}, {0, 1000}, {1, 1000}, {0, 1000}, {1, 1000}, {0, 2000}};
  const size_t length_warning =
      sizeof(sequence_warning) / sizeof(sequence_warning[0]);

  const float critical_level = -18.5;
  const struct iotctrl_buzz_unit sequence_critical[] = {
      {1, 1000}, {0, 500}, {1, 1000}, {0, 500}, {1, 1000}, {0, 1000},
      {1, 1000}, {0, 500}, {1, 1000}, {0, 500}, {1, 1000}, {0, 1000},
      {1, 1000}, {0, 500}, {1, 1000}, {0, 500}, {1, 1000}, {0, 1000},
      {1, 1000}, {0, 500}, {1, 1000}, {0, 500}, {1, 1000}, {0, 1000}};
  const size_t length_critical =
      sizeof(sequence_critical) / sizeof(sequence_critical[0]);

  const struct iotctrl_7seg_display_connection conn = {.display_digit_count = 8,
                                                       .data_pin_num = 17,
                                                       .clock_pin_num = 11,
                                                       .latch_pin_num = 18,
                                                       .chain_num = 2};

  if (iotctrl_init_display(gpio_path, conn) != 0) {
    syslog(LOG_ERR,
           "iotctrl_init_display() failed, ev_temp_sensor() won't start");
    return NULL;
  }
  int res;
  size_t counter = 0;
  size_t delay_sec = 5;
  while (!ev_flag) {

    float current_highest_temp = read_highest_temp_from_file();
    const uint8_t sensor_count = 1;
    int16_t temps[sensor_count];
    int16_t temp;
    if ((res = iotctrl_get_temperature("/dev/ttyUSB0", sensor_count, temps,
                                       0)) != 0) {
      temp = 999;
      syslog(LOG_ERR, "iotctrl_get_temperature() failed, returned %d", res);
    } else {
      temp = temps[0];
    }

    float temp_float = temp / 10.0;
    if (temp_float > current_highest_temp) {
      current_highest_temp = temp_float;
      write_highest_temp_to_file(current_highest_temp);
    }
    iotctrl_update_value_two_four_digit_floats(temp_float,
                                               current_highest_temp);
    if (temp_float > critical_level) {
      syslog(LOG_ERR, "temp_float reaches critical level (%f)", critical_level);
      if (iotctrl_make_a_buzz(gpio_path, 4, sequence_critical,
                              length_critical) != 0) {
        syslog(LOG_ERR, "iotctrl_make_a_buzz() failed");
      }
    } else if (temp_float > warning_level) {
      syslog(LOG_ERR, "temp_float reaches warning level (%f)", warning_level);
      if (iotctrl_make_a_buzz(gpio_path, 4, sequence_warning, length_warning) !=
          0) {
        syslog(LOG_ERR, "iotctrl_make_a_buzz() failed");
      }
    }
    sleep(delay_sec);
    ++counter;
    if (counter % (60 / delay_sec) == 0) {
      write_temp_to_csv(temp_float);
    }
  }
  iotctrl_finalize_7seg_display();
  syslog(LOG_INFO, "ev_temp_sensor() exited gracefully");
  return NULL;
}

void *ev_test_internet(void *_) {
  (void)_;
  const struct iotctrl_buzz_unit sequence[] = {
      {1, 1000}, {0, 1000}, {1, 1000}, {0, 1000}, {1, 1000}, {0, 2000},
      {1, 1000}, {0, 1000}, {1, 1000}, {0, 1000}, {1, 1000}, {0, 2000},
      {1, 1000}, {0, 1000}, {1, 1000}, {0, 1000}, {1, 1000}, {0, 2000},
      {1, 1000}, {0, 1000}, {1, 1000}, {0, 1000}, {1, 1000}, {0, 2000}};
  const size_t length = sizeof(sequence) / sizeof(sequence[0]);
  char sites_to_test[][PATH_MAX] = {
      "https://www.example.com", "https://www.sogou.com",
      "https://www.baidu.com", "https://www.zhihu.com"};
  size_t delay_sec = 60;
  CURL *curl = curl_easy_init();
  if (!curl) {
    syslog(LOG_ERR, "curl_easy_init() failed");
    return NULL;
  }
  while (!ev_flag) {
    unsigned int internet_down_count = 0;
    for (size_t i = 0;
         i < sizeof(sites_to_test) / sizeof(sites_to_test[0]) && !ev_flag;
         ++i) {
      curl_easy_setopt(curl, CURLOPT_URL, sites_to_test[i]);
      curl_easy_setopt(curl, CURLOPT_CONNECTTIMEOUT_MS, 10000);
      curl_easy_setopt(curl, CURLOPT_NOBODY, 1); // Send a HEAD request

      CURLcode res = curl_easy_perform(curl);
      if (res == CURLE_OK) {
      } else {
        ++internet_down_count;
        syslog(LOG_ERR, "Failed to connect %s", sites_to_test[i]);
      }
      sleep(delay_sec);
    }
    if (internet_down_count ==
        sizeof(sites_to_test) / sizeof(sites_to_test[0])) {
      if (iotctrl_make_a_buzz(gpio_path, 4, sequence, length) != 0) {
        syslog(LOG_ERR, "iotctrl_make_a_buzz() failed");
      }
      write_interruption_to_csv();
    }
  }
  curl_easy_cleanup(curl);
  syslog(LOG_INFO, "ev_test_internet() exited gracefully");
  return 0;
}
