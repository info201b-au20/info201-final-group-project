# Packages Used
library(dplyr)
library(ggplot2)
library(tidyverse)

# Original Effects of Social Media Response table
dataframe <- read.csv("https://raw.githubusercontent.com/info201b-au20/info201-final-group-project/gh-pages/Effects%20of%20Social%20Media%20(Responses).csv")

new_dataframe <- dataframe %>% 
  rename(Age = "What.is.your.age.",
         Social_media_accounts = "Which.social.media.platform.s.do.you.like.the.most.or.use.the.most.",
         Time_spent_on_social_media_in_a_day = "How.much.time.do.you.spend.on.social.media.in.a.day.",
         Preferred_type_of_communication = "Which.type.of.communication.do.you.generally.prefer.") %>% 
  select(Age,Social_media_accounts,Time_spent_on_social_media_in_a_day,Preferred_type_of_communication) %>% 
  group_by(Age)

ggplot(new_dataframe, aes(x = Time_spent_on_social_media_in_a_day)) +
    geom_bar() +
  labs(title = "Time Spent on Social Media Per Day", x = "range of hours", y = "frequency")
  
# We included the chart to show on average how much time college aged students spend on social media per day

# The chart tells us that almost no college aged students (undergrad) spend *NO* time on social media.
# The chart also tell us that about two thirds of college aged students (undergrad) spend what we'd call a reasonable
# amount of time on social media per day. The other third spend an excessive amount of time on social medai
