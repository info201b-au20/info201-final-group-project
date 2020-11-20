# Packages Used
library(dplyr)
library(ggplot2)
library(tidyverse)

# Original Effects of Social Media Response table
dataframe <- read.csv("https://raw.githubusercontent.com/info201b-au20/info201-final-group-project/gh-pages/Effects%20of%20Social%20Media%20(Responses).csv")

new_dataframe <- dataframe %>% 
  rename(Age = "What.is.your.age.",
         Social_media_accounts = "Which.social.media.platform.s.do.you.like.the.most.or.use.the.most.",
         Time_spent_on_physical_activities_in_a_day = "How.much.time.do.you.spend.on.physical.activities.in.a.day.",
         Time_spent_on_social_media_in_a_day = "How.much.time.do.you.spend.on.social.media.in.a.day.") %>% 
  select(Age,Social_media_accounts,Time_spent_on_physical_activities_in_a_day,Time_spent_on_social_media_in_a_day) %>% 
  group_by(Age)

  
ggplot(new_dataframe, aes(x = Time_spent_on_social_media_in_a_day, y = Time_spent_on_physical_activities_in_a_day)) +
    geom_line(stat='identity') +
  labs(title = "Social media use vs physical activity", x = "Time on social medaia", y = "Time on physical activities")

  
pie <- ggplot(new_dataframe, aes(x = , y = Preferred_type_of_communication))

  
# We included the chart to show the correlation between social media use and physical activity 

# The chart tells us that there is a correlation between social media use and physical activity 