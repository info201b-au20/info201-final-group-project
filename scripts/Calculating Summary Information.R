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
  select(Age,Social_media_accounts,Hours_spent_on_social_media_in_a_day,Preferred_type_of_communication, How.much.do.you.feel.that.you.are.exposed.to.inappropriate.content.on.these.platforms..out.of.10..) %>% 
  arrange(Age)


#Keep in mind that users who were on social media for less than 1 hour were displayed in the table as spending 0 hours 
#Since we are only focusing on the amount of hours and not minutes.
newDF$Hours_spent_on_social_media_in_a_day <- str_replace(newDF$Hours_spent_on_social_media_in_a_day,"less than 1 hr","0")

#None was displayed as 0 hours
newDF$Hours_spent_on_social_media_in_a_day <- str_replace(newDF$Hours_spent_on_social_media_in_a_day,"none","0")

#Users with more than 4 hours is displayed in the table as 4+ the plus sign indicates that the number
#of hours spent is greater than 4
newDF$Hours_spent_on_social_media_in_a_day <- str_replace(newDF$Hours_spent_on_social_media_in_a_day,"more than 4 hrs","4+") 

#Since we wanted to make are table more readable and understandable when looking at the data & charts we decided
#to take the number between 1 - 2.5 hours that every user said they spent on social media in a day which is 1.75 but when 
#you round 1.75 to the nearest whole number you get 2 so the number two represents all users who spent 
#between 1 - 2.5 hours.
newDF$Hours_spent_on_social_media_in_a_day <- str_replace(newDF$Hours_spent_on_social_media_in_a_day,"1 - 2.5 hrs","2")

#Users that spent upto 4 hours on social media is now displayed in the table as just the number 4.
newDF$Hours_spent_on_social_media_in_a_day <- str_replace(newDF$Hours_spent_on_social_media_in_a_day,"upto 4 hrs","4")

#CODE ABOVE FROM Table of Summary Information
  
summary_info <- list()
    #number of participants
  summary_info$num_observations <- nrow(newDF)
    #average age of participants
  summary_info$mean_age <- mean(newDF$Age, na.rm = TRUE)
    #average hours spend on social media per day
    #CURRENTLY does not work due to values being strings due to "4+" values in column
  summary_info$mean_hours_spent_per_day <- mean(newDF$Hours_spent_on_social_media_in_a_day, na.rm = TRUE)
    #average feeling exposed to inappropriate content out of 10
  summary_info$mean_scale_felt_exposed_inappropriate_content <- mean(newDF$How.much.do.you.feel.that.you.are.exposed.to.inappropriate.content.on.these.platforms..out.of.10.. , na.rm = TRUE)
    #number of highest participant age
  summary_info$num_oldest_participant_age <- newDF %>%
    filter (Age == max(Age, na.rm = TRUE)) %>%
    select(Age) %>%
    nrow()
  