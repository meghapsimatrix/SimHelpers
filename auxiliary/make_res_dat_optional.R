library(tidyverse)


calc_rejection <- function(res_dat, p_values, alpha = .05){

  if(missing(res_dat)){

    p_vals <- p_values
    K <- length(p_values)

  } else{

    p_vals <- res_dat %>% dplyr::pull({{p_values}})
    K <- nrow(res_dat)

  }

  dat1 <- tibble::tibble(rej_rate = mean(p_vals < alpha))

  dat <- tibble::tibble(rej_rate = mean(p_vals < alpha),
                        rej_rate_mcse = sqrt((rej_rate * (1 - rej_rate)) / K))

  return(dat1)

}


# Try to run --------------------------------------------------------------

load("data/t_res.rda")
load("data/welch_res.rda")


# this way works even without the parent stuff
t_res %>%
  calc_rejection(p_values = p_val)

# does not like mutate
t_res %>%
  mutate(calc_rejection(p_values = p_val))


# it doesn't like that it has 2 cols
t_res %>%
  summarize(calc_rejection(p_values = p_val))

# welch_res %>%
#   nest(obs, pred) %>%
#   calc_rejection(p_values = p_val)

# runs but doesn't group
welch_res %>%
  group_by(method) %>%
  calc_rejection(p_values = p_val)


# the output is weird
welch_res %>%
  group_by(method) %>%
  summarize(rmse = calc_rejection(p_values = p_val))

welch_res %>%
  group_by(method) %>%
  do(calc_rejection(., p_values = p_val))