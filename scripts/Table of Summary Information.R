#Packages Used
library(dplyr)
library(stringr)
#Original Effects of Social Media Response table
originalDF <- read.csv("https://raw.githubusercontent.com/info201b-au20/info201-final-group-project/gh-pages/Effects%20of%20Social%20Media%20(Responses).csv")

newDF <- originalDF %>% 
  rename(Age = "What.is.your.age.",
         Social_media_accounts = "Which.social.media.platform.s.do.you.like.the.most.or.use.the.most.",
         Hours_spent_on_social_media_in_a_day = "How.much.time.do.you.spend.on.social.media.in.a.day.",
         Preferred_type_of_communication = "Which.type.of.communication.do.you.generally.prefer.") %>% 
  select(Age,Social_media_accounts,Hours_spent_on_social_media_in_a_day,Preferred_type_of_communication)

#Keep in mind that for users who were on social media for less than 1 hour were displayed as spending 0 hours 
#Since we are only focusing on the amount of hours and not minutes.

newDF$Hours_spent_on_social_media_in_a_day <- str_replace(newDF$Hours_spent_on_social_media_in_a_day,"less than 1 hr","0")
newDF$Hours_spent_on_social_media_in_a_day <- str_replace(newDF$Hours_spent_on_social_media_in_a_day,"none","0")
newDF$Hours_spent_on_social_media_in_a_day <- str_replace(newDF$Hours_spent_on_social_media_in_a_day,"more than 4 hrs","4+") 
newDF$Hours_spent_on_social_media_in_a_day <- str_replace(newDF$Hours_spent_on_social_media_in_a_day,"1 - 2.5 hrs","2")
newDF$Hours_spent_on_social_media_in_a_day <- str_replace(newDF$Hours_spent_on_social_media_in_a_day,"upto 4 hrs","4")

newDF <- newDF %>% 
  arrange(Age)





  
