library(purrr)
library(tidyverse)
library(lubridate)
library(anytime)

# Problem 2

transform_metadata_to_df <- function(metadata) {
  metadata[[1]] %>% 
    map(as_tibble) 
    # list_rbind() %>% 
    # mutate(latestData = map_chr(latestData, 1, .default = NA_character_)) %>% 
    # mutate(latestData = as_datetime(latestData, tz = "UTC")) %>% 
    # mutate(location = map(location, unlist)) %>% 
    # mutate(
    #   lat = map_dbl(location, "latLon.lat"),
    #   lon = map_dbl(location, "latLon.lon")
    # ) %>% 
    # select(-location)
}

# Problem 4a

to_iso8601 <- function(datetime, offset) {
  datetime <- datetime + days(offset)
  paste0(iso8601(datetime), "Z")
}

wanted_output <- "2016-08-28T10:11:12Z"
actual_output <- to_iso8601(as_datetime("2016-09-01 10:11:12"),-4)

wanted_output == actual_output

transform_volumes <- function(volume_json) {
  volume_json[[1]][[1]][[1]][[1]] %>% 
    map(as_tibble) %>% 
    list_rbind()
}




