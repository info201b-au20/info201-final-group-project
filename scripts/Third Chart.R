#Packages Used
library(dplyr)
library(ggplot2)
library(tidyverse)
#Original Effects of Social Media Response table
originalDF <- read.csv("https://raw.githubusercontent.com/info201b-au20/info201-final-group-project/gh-pages/Effects%20of%20Social%20Media%20(Responses).csv")

newDF <- originalDF %>% 
  rename(Age = "What.is.your.age.",
         Social_media_accounts = "Which.social.media.platform.s.do.you.like.the.most.or.use.the.most.",
         Time_spent_on_social_media_in_a_day = "How.much.time.do.you.spend.on.social.media.in.a.day.",
         Preferred_type_of_communication = "Which.type.of.communication.do.you.generally.prefer.") %>% 
  select(Age,Social_media_accounts,Time_spent_on_social_media_in_a_day,Preferred_type_of_communication) %>% 
  group_by(Age)

ggplot(data = newDF) +
  geom_point(mapping = aes(x = Age, y = Preferred_type_of_communication)) +
  labs(title = "Preferred type of Cummunication by Age groups")
   
#why? 
#This simple scatter plot expresses how different age groups use social media to communicate.
#What
#It gives a clear picture of the types of communication an age group prefers. 

  
      