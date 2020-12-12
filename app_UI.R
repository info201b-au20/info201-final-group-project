library(shiny)
library(plotly)
library(tidyverse) 
library("RColorBrewer")
library(shinyWidgets)

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

ulList <-  shiny::tags$ol(
  shiny::tags$li("While using various social media, how does everyone stay in touch with each other?"),
  shiny::tags$li("Which social media platforms are most popular?"),
  shiny::tags$li("What age group spends the most time on social media throughout the day?"),
  shiny::tags$li("How much time is spent on physical activities?")
)
Intro_page <- tabPanel(
      titlePanel("Intro Page"),
      setBackgroundColor("lightblue"),
      includeCSS("css_code.txt"),
      shiny::tags$h2("Social Media Studies"),
      shiny::tags$p("We all use social media nowadays. Well, maybe not everyone, but at least a huge amount of the population 
      does. Social networks have opened new horizons of devising and learning new information, sharing ideas, and connecting 
      with others. Social media has notably changed the way people interact and carry on with their everyday lives on social 
      networks. People using the internet spend most of their time on social media sites. The only thing that matters is where 
      people invest their time and attention. In this project, we will be focusing on the different age groups' use of 
      various social media platforms, how they communicate and connect with each other, and how much time is spent on social media 
      throughout the day."),
      shiny::tags$a(href="https://raw.githubusercontent.com/info201b-au20/info201-final-group-project/gh-pages/Effects%20of%20Social%20Media%20(Responses).csv", 
                    "Click here to view the raw data from the dataset used for are visualizations"),
      shiny::tags$br(),
      shiny::tags$br(),
      p("Questions we seek to answer throught the project:"),
      ulList,
      shiny::tags$img(src = "https://belatina.com/wp-content/uploads/2020/06/thumbs_b_c_d5bcace83abc78617d9aecb992d4b4f8.jpg")

)
  
Interactive_Page_1 <- tabPanel(
  titlePanel("Interactive Page 1"),
  sidebarLayout(
    sidebarPanel(
        
    ),
    mainPanel(
        
    )
  )
)

Interactive_Page_2 <- tabPanel(
  titlePanel("Interactive Page 2"),
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
Conclusion_Page <- tabPanel(
  titlePanel("Conclusion")
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
