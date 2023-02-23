library(tidyverse)
library(readxl)

#read in each separate run
file <- './Data/exp_3_excel.xlsx'
run1 <- readxl::read_xlsx(file, range = 'A8:B573', col_names = FALSE)
run2 <- readxl::read_xlsx(file, range = 'D8:E846', col_names = FALSE)

# make meaningful column names
names(run1) <- c('time_s','temp_c')
names(run2) <- c('time_s','temp_c')

# add third column designating which run it came from
run1$run <- 'run_1'
run2$run <- 'run_2'

# combine the two rows.

df <- full_join(run1,run2)
str(df)


df %>% ggplot(aes(x=time_s, y = temp_c, color = run)) +
  geom_point()

df %>% mutate(chemical = case_when(run == 'run_1' ~ 'Lauric Acid',
                                   run == 'run_2' ~ 'Mixture')) %>% 
  ggplot(aes(x=time_s, y = temp_c, color = chemical)) +
  geom_point()


# CAN SAVE CLEANED VERSION AS CSV IF YOU WOULD LIKE
write_csv(df, './Data/exp_3_excel_cleaned.csv')



txt_path <- './Data/exp_3_text'
txt <- readLines(txt_path)

starts <- grep('Vernier', txt)
txt[starts]

skips <- starts + 6

skips


