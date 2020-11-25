# Packages Used
library(dplyr)
library(ggplot2)
library(tidyverse)

# Original Effects of Social Media Response table
dataframe <- read.csv("https://raw.githubusercontent.com/info201b-au20/info201-final-group-project/gh-pages/Effects%20of%20Social%20Media%20(Responses).csv")


new_dataframe <- dataframe %>% 
  rename(Age = "What.is.your.age.",
         Social_media_accounts = "Which.social.media.platform.s.do.you.like.the.most.or.use.the.most.",
         Time_spent_on_physical_activities_in_a_day = "How.much.time.do.you.spend.on.physical.activities.in.a.day.",,
         Time_spent_on_social_media_in_a_day = "How.much.time.do.you.spend.on.social.media.in.a.day.") %>% 
  select(Age,Social_media_accounts,Time_spent_on_physical_activities_in_a_day,Time_spent_on_social_media_in_a_day) %>% 
  group_by(Age)

#Changes made to Time_spent_on_phsical activities_in_a_day column to later convert the characters to integers
new_dataframe$Time_spent_on_physical_activities_in_a_day <- str_replace(new_dataframe$Time_spent_on_physical_activities_in_a_day, "none","0")
new_dataframe$Time_spent_on_physical_activities_in_a_day <- str_replace(new_dataframe$Time_spent_on_physical_activities_in_a_day, "less than 1 hr","0")
new_dataframe$Time_spent_on_physical_activities_in_a_day <- str_replace(new_dataframe$Time_spent_on_physical_activities_in_a_day, "upto 4 hrs","4")
new_dataframe$Time_spent_on_physical_activities_in_a_day <- str_replace(new_dataframe$Time_spent_on_physical_activities_in_a_day, "1 - 2.5 hrs","2")
new_dataframe$Time_spent_on_physical_activities_in_a_day <- str_replace(new_dataframe$Time_spent_on_physical_activities_in_a_day, "more than 4 hrs","4")

#Converts the strings to integers in the physical activities column 
new_dataframe$Time_spent_on_physical_activities_in_a_day <- as.integer(new_dataframe$Time_spent_on_physical_activities_in_a_day)            

#Changes made to Tine_spent_on_social_media_in_a_day column to later convert the characters to integers
new_dataframe$Time_spent_on_social_media_in_a_day <- str_replace(new_dataframe$Time_spent_on_social_media_in_a_day, "none","0")
new_dataframe$Time_spent_on_social_media_in_a_day <- str_replace(new_dataframe$Time_spent_on_social_media_in_a_day, "less than 1 hr","0")
new_dataframe$Time_spent_on_social_media_in_a_day <- str_replace(new_dataframe$Time_spent_on_social_media_in_a_day, "upto 4 hrs","4")
new_dataframe$Time_spent_on_social_media_in_a_day <- str_replace(new_dataframe$Time_spent_on_social_media_in_a_day, "1 - 2.5 hrs","2")
new_dataframe$Time_spent_on_social_media_in_a_day <- str_replace(new_dataframe$Time_spent_on_social_media_in_a_day, "more than 4 hrs","4")

#Converts the strings to integers in the time_spent_on_social_media column
new_dataframe$Time_spent_on_social_media_in_a_day <- as.integer(new_dataframe$Time_spent_on_social_media_in_a_day)            


ggplot(new_dataframe, aes(x = Time_spent_on_social_media_in_a_day, y = Time_spent_on_physical_activities_in_a_day)) +
    geom_line(stat='identity') +
  labs(title = "Social media use vs physical activity", x = "Time on social medaia", y = "Time on physical activities")

  
pie <- ggplot(new_dataframe, aes(x = , y = Preferred_type_of_communication))

  
# We included the chart to show the correlation between social media use and physical activity 

# The chart tells us that there is a correlation between social media use and physical activity # Packages Used
library(dplyr)
library(ggplot2)
library(tidyverse)

# Original Effects of Social Media Response table
dataframe <- read.csv("https://raw.githubusercontent.com/info201b-au20/info201-final-group-project/gh-pages/Effects%20of%20Social%20Media%20(Responses).csv")


new_dataframe <- dataframe %>% 
  rename(Age = "What.is.your.age.",
         Social_media_accounts = "Which.social.media.platform.s.do.you.like.the.most.or.use.the.most.",
         Time_spent_on_physical_activities_in_a_day = "How.much.time.do.you.spend.on.physical.activities.in.a.day.",,
         Time_spent_on_social_media_in_a_day = "How.much.time.do.you.spend.on.social.media.in.a.day.") %>% 
  select(Age,Social_media_accounts,Time_spent_on_physical_activities_in_a_day,Time_spent_on_social_media_in_a_day) %>% 
  group_by(Age)

#Changes made to Time_spent_on_phsical activities_in_a_day column to later convert the characters to integers
new_dataframe$Time_spent_on_physical_activities_in_a_day <- str_replace(new_dataframe$Time_spent_on_physical_activities_in_a_day, "none","0")
new_dataframe$Time_spent_on_physical_activities_in_a_day <- str_replace(new_dataframe$Time_spent_on_physical_activities_in_a_day, "less than 1 hr","0")
new_dataframe$Time_spent_on_physical_activities_in_a_day <- str_replace(new_dataframe$Time_spent_on_physical_activities_in_a_day, "upto 4 hrs","4")
new_dataframe$Time_spent_on_physical_activities_in_a_day <- str_replace(new_dataframe$Time_spent_on_physical_activities_in_a_day, "1 - 2.5 hrs","2")
new_dataframe$Time_spent_on_physical_activities_in_a_day <- str_replace(new_dataframe$Time_spent_on_physical_activities_in_a_day, "more than 4 hrs","4")

#Converts the strings to integers in the physical activities column 
new_dataframe$Time_spent_on_physical_activities_in_a_day <- as.integer(new_dataframe$Time_spent_on_physical_activities_in_a_day)            

#Changes made to Tine_spent_on_social_media_in_a_day column to later convert the characters to integers
new_dataframe$Time_spent_on_social_media_in_a_day <- str_replace(new_dataframe$Time_spent_on_social_media_in_a_day, "none","0")
new_dataframe$Time_spent_on_social_media_in_a_day <- str_replace(new_dataframe$Time_spent_on_social_media_in_a_day, "less than 1 hr","0")
new_dataframe$Time_spent_on_social_media_in_a_day <- str_replace(new_dataframe$Time_spent_on_social_media_in_a_day, "upto 4 hrs","4")
new_dataframe$Time_spent_on_social_media_in_a_day <- str_replace(new_dataframe$Time_spent_on_social_media_in_a_day, "1 - 2.5 hrs","2")
new_dataframe$Time_spent_on_social_media_in_a_day <- str_replace(new_dataframe$Time_spent_on_social_media_in_a_day, "more than 4 hrs","4")

#Converts the strings to integers in the time_spent_on_social_media column
new_dataframe$Time_spent_on_social_media_in_a_day <- as.integer(new_dataframe$Time_spent_on_social_media_in_a_day)            

#Sort dataframe by hours on social media
new_dataframe <- arrange(new_dataframe, Time_spent_on_social_media_in_a_day)

#Add column for row number
new_dataframe$id <- seq.int(nrow(new_dataframe))

socialmedia_vs_exercise <- ggplot(new_dataframe, aes(x = id)) + 
  geom_line(aes(y = Time_spent_on_social_media_in_a_day, color = "darkred"), size = 2) + 
  geom_line(aes(y = Time_spent_on_physical_activities_in_a_day, color="steelblue")) +
  scale_color_manual(values = c("darkred", "steelblue")) +
  labs(title = "Social media use vs physical activity", x = "ID", y = "Time on physical activities vs Time on social media")


# We included the chart to show a possible correlation between social media use and physical activity per day

# The chart tells us that there is NO correlation between social media use and physical activity per day