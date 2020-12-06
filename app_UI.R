library(shiny)
library(plotly)
library(tidyverse) 
library("RColorBrewer")

originalDF <- read.csv("https://raw.githubusercontent.com/info201b-au20/info201-final-group-project/gh-pages/Effects%20of%20Social%20Media%20(Responses).csv")

newDF <- originalDF %>% 
    rename(Age = "What.is.your.age.",
           Social_media_accounts = "Which.social.media.platform.s.do.you.like.the.most.or.use.the.most.",
           Time_spent_on_social_media_in_a_day = "How.much.time.do.you.spend.on.social.media.in.a.day.",
           Preferred_type_of_communication = "Which.type.of.communication.do.you.generally.prefer.") %>% 
    select(Age,Social_media_accounts,Time_spent_on_social_media_in_a_day,Preferred_type_of_communication) %>% 
    group_by(Age)

age <- colnames(newDF)
x_input <- selectInput(
    "x_input",
    label = "set age",
    choices = age
) 

color_input <- selectInput(
    inputId = "color_input",
    label = "set color",
    choices = c("red", "green", "blue", "black", "purple")
)


Intro_page <- tabPanel(
  "Introductory page",
  
)

  
Interactive_Page_1 <- tabPanel(
  "Interactive Page 1",
  sidebarLayout(
    sidebarPanel(
        
    ),
    mainPanel(
        
    )
  )
)

Interactive_Page_2 <- tabPanel(
  "Interactive Page 2",
  sidebarLayout(
    sidebarPanel(
      
    ),
    mainPanel(
      
    )
  )
)

Interactive_Page_3 <- tabPanel(
  titlePanel("Preferred method of communication for different age groups"),
    sidebarLayout(
        sidebarPanel(
            p("This simple scatter plot gives a precise visual about how different age groups
ranging from 14-23 use social media to communicate. This chart was used to show
the preferred methods of communication because it shows more than one way an
an age group preferred to communicate. This makes it easier to see the trend of
communication between different age groups. The trend of this chart shows that
people between the ages of 18 - 19 prefer all the types of communication methods
while age groups between 14- 16, and 21-3 tend to prefer half or less than half
to communicate. The different preferred types of communication types go up
with age then slowly go back down after the age of 20.")),
        mainPanel(
            p(plotlyOutput("chart")),
            selectInput(
                "x_input",
                label = "set age",
                choices = age,
                selected = "What.is.your.age."
            ),
            selectInput(
                inputId = "color_input",
                label = "set color",
                choices = c("red", "green", "blue", "black", "purple")
            )
        )
    )
)
ui <- fluidPage(
  navbarPage(
    "Application",
    Intro_page,
    Interactive_Page_1,
    Interactive_Page_2,
    Interactive_Page_3,
    Conclusion_Page
  )
)
