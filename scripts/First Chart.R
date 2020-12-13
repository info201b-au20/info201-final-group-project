library(dplyr)
library(ggplot2)
library(tidyverse)
library("plotly")

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
  geom_line(aes(y = Time_spent_on_social_media_in_a_day, color = "darkred"), size = 3) + 
  geom_point(aes(y = Time_spent_on_physical_activities_in_a_day, color="steelblue"), size = 2) +
  scale_color_manual(values = c("darkred", "steelblue"), labels = c("Hours on social media", "Hours on physical activity")) +
  labs(title = "Social media use vs physical activity", x = "Survey Entry ID (ordered from least to greatest by hours on social media)", y = "Hours")

socialmedia_vs_exercise <- plotly_build(socialmedia_vs_exercise)
socialmedia_vs_exercise$x$data[[1]]$name <- "Time on social media"
socialmedia_vs_exercise$x$data[[2]]$name <- "Time on physical activity"
socialmedia_vs_exercise

# We included the chart to show a possible correlation between social media use and physical activity per day

# The chart tells us that there is NO correlation between social media use and physical activity per day