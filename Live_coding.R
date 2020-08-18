library(tidyverse)
library(lubridate)
## load data
sitrep <- readRDS(here::here('data', 'sitrep.rds')) # all calls
sitrep_60sec <- readRDS(here::here('data', 'sitrep_60sec.rds')) # calls answered within 60sec

# reshape the data
sitrep_long <- sitrep %>% 
  pivot_longer(cols=-c(NHS_111_area_name, year),
               names_to='day_month', 
               values_to='calls'
  
)
View(sitrep_long)

# fix dates

sitrep_long <- sitrep_long %>% 
  mutate(date=paste(day_month, year), date=dmy(date))

# Calculate total calls by region

sitrep_calls_by_region <- sitrep_long %>% 
  group_by(NHS_111_area_name) %>%
  summarise(total_calls=sum(calls))
  
# Plot  calls over time

sitrep_long %>% 
  group_by(date) %>% 
  summarise(total_calls=sum(calls, na.rm = TRUE)) %>% 
  ggplot(aes(x=date, y=total_calls)) + geom_line()


## reshape back



# WHO section ----
data('who')
View(who)

who %>% 
  pivot_longer()