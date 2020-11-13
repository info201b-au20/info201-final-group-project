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
  select(Age,Social_media_accounts,Hours_spent_on_social_media_in_a_day,Preferred_type_of_communication,
         How.much.do.you.feel.that.you.are.exposed.to.inappropriate.content.on.these.platforms..out.of.10..) %>% 
  arrange(Age)

# A function that takes in a dataset and returns a list of info about it:

summary_info <- list()

summary_info$num_observations <- nrow(newDF) %>% 
  








