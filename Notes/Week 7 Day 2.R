# Week 7 day 2

# CELAN ME"
library(tidyverse)
library(readxl)
library(janitor)

getwd()
df <- 
read_excel("./Data/messy_bp.xlsx", skip = 3) %>% clean_names()

df$pat_id = 1:nrow(df)

visit1 <- 
  select(df, pat_id, month_of_birth, day_birth, year_birth, race, sex, hispanic, bp_8, hr_9) %>% 
  mutate(visit = 1) %>% 
  rename(bp = bp_8, hr = hr_9)

visit2 <- 
  select(df, pat_id, month_of_birth, day_birth, year_birth, race, sex, hispanic, bp_10, hr_11) %>% 
  mutate(visit = 2) %>% 
  rename(bp = bp_10, hr = hr_11)

visit3 <- 
  select(df, pat_id, month_of_birth, day_birth, year_birth, race, sex, hispanic, bp_12, hr_13) %>% 
  mutate(visit = 3) %>% 
  rename(bp = bp_12, hr = hr_13)

df_clean <- 
full_join(visit1, visit2) %>% full_join(visit3) %>% 
  separate(bp, into = c('bp_systolic', 'bp_diastolic'), sep = '/', remove = TRUE)

df_clean$bp_diastolic <-  df_clean$bp_diastolic %>% as.numeric()
df_clean$bp_systolic <- df_clean$bp_systolic %>% as.numeric()
df_clean$race <-df_clean$race %>% as.factor()
df_clean$hispanic <- ifelse(df_clean$hispanic == 'Hispanic', TRUE, FALSE)
df_clean$race <- df_clean$race %>% str_to_title() %>% as.factor()

df_clean <- 
mutate(df_clean, date = paste0(month_of_birth, '-', day_birth, '-', year_birth)) %>% select(-c('month_of_birth', 'day_birth', 'year_birth'))

df_clean$date  <- as.Date(df_clean$date, format = '%m-%d-%Y')

df_clean %>% 
  ggplot(aes(x = visit, y = bp_systolic, color = sex, linetype = hispanic)) +
  geom_smooth(se = F, method = 'loess') +
  facet_wrap(~race)


glm(data - df_clean,
    formula = )
