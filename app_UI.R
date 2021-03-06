library(shiny)
library(plotly)
library(tidyverse)
library(ggplot2)
library(shinyWidgets)
library("RColorBrewer")
originalDF <- read.csv("https://raw.githubusercontent.com/info201b-au20/info201-final-group-project/gh-pages/Effects%20of%20Social%20Media%20(Responses).csv")

######################################Chart1######################################################################
new_dataframe <- originalDF %>% #changed "dataframe" to "originalDF"
  rename(Age = "What.is.your.age.",
         Social_media_accounts = "Which.social.media.platform.s.do.you.like.the.most.or.use.the.most.",
         Time_spent_on_physical_activities_in_a_day = "How.much.time.do.you.spend.on.physical.activities.in.a.day.",
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
  

####################################Chart2#######################################################################
new_dataframe <- originalDF %>% #changed "dataframe" to "originalDF"
  rename(Age = "What.is.your.age.",
         Social_media_accounts = "Which.social.media.platform.s.do.you.like.the.most.or.use.the.most.",
         Time_spent_on_social_media_in_a_day = "How.much.time.do.you.spend.on.social.media.in.a.day.",
         Time_spent_on_physical_activities_in_a_day = "How.much.time.do.you.spend.on.physical.activities.in.a.day.",
         Preferred_type_of_communication = "Which.type.of.communication.do.you.generally.prefer.") %>% 
  select(Age,Social_media_accounts,Time_spent_on_social_media_in_a_day,Preferred_type_of_communication,Time_spent_on_physical_activities_in_a_day) %>% 
  group_by(Age)
  

####################################Chart3########################################################################

newDF <- originalDF %>% 
    rename(Age = "What.is.your.age.",
           Social_media_accounts = "Which.social.media.platform.s.do.you.like.the.most.or.use.the.most.",
           Time_spent_on_social_media_in_a_day = "How.much.time.do.you.spend.on.social.media.in.a.day.",
           Preferred_type_of_communication = "Which.type.of.communication.do.you.generally.prefer.") %>% 
    select(Age,Social_media_accounts,Time_spent_on_social_media_in_a_day,Preferred_type_of_communication) %>% 
    group_by(Age)


##################################################Intro page code#######################################################
olList <-  shiny::tags$ol(
  shiny::tags$li("While using various social media, how does everyone stay in touch with each other?"),
  shiny::tags$li("Which social media platforms are most popular?"),
  shiny::tags$li("What age group spends the most time on social media throughout the day?")
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
      shiny::tags$p("The data used for this project was collected through a user conducted survey by", strong("MAHEEP MAHAT")),
      shiny::tags$a(href="https://raw.githubusercontent.com/info201b-au20/info201-final-group-project/gh-pages/Effects%20of%20Social%20Media%20(Responses).csv", 
                    "Click here to view the raw data from the dataset"),
      shiny::tags$br(),
      shiny::tags$br(),
      shiny::tags$a(href = "https://data.world/maheepmahat/data-of-usage-of-social-media-by-students-between-age-17-22/workspace/file?filename=Effects+of+Social+Media+%28Responses%29.xlsx",
                    "Click here to visit the page where we downloaded the dataset from"),
      shiny::tags$br(),
      shiny::tags$br(),
      p(strong("Questions we seek to answer throughout the project:")),
      olList,
      shiny::tags$img(src = "https://belatina.com/wp-content/uploads/2020/06/thumbs_b_c_d5bcace83abc78617d9aecb992d4b4f8.jpg")

)

Interactive_Page_1 <- tabPanel(
  titlePanel("Social media use vs Physical activity per day"),
  sidebarLayout(
    sidebarPanel(
            p("This chart tests our hypothesis that there is an inverse correlation between amount of time spent social media 
			and the amount of time spent on physical activity per day. The idea was that the more time one spends on social media
			, the less time one has to be physically active. Since there is no easily discernable pattern in the chart
			to the right, we have concluded that there is no correlation (neither positive or negative) between time spent on social
			media and time spent of physical activity.")),
    mainPanel(
            plotlyOutput("socialmedia_vs_exercise"),
			sliderInput(
				"size",
				label = shiny::tags$h4("Size of soical media line (darkred)"), min = 1, max = 5, value = 2
			),
			sliderInput(
				"size2",
				label = shiny::tags$h5("Size of physical activity points (steelblue)"), min = 1, max = 5, value = 2
			)
    )
  )
)


Interactive_Page_2 <- tabPanel(
  titlePanel("Total count of time on social media vs physical activity hours"),
  sidebarLayout(
    sidebarPanel(
            p("This chart shows, on average, how much time college aged students spend on social media and physical
			activity per day. Almost no students spend zero time on social media. About two thirds of college aged 
			students spend what we would call a reasonable amount (0 - 2.5 hrs) of time on social media per day. 
			Conversley, the other third spend an excessive amount of time (2.5+ hrs) on social media."),
			p("This chart also shows that most college aged students spend at least the recommended amount of time (1 hr)
			on physicial activity per day with only 15 percent of students getting, on average, no physical activity.")
			),
    mainPanel(
      plotlyOutput("effects"),
      selectInput(
        "x_axis",
        label = "Change x-axis",
        choices = c("Time_spent_on_physical_activities_in_a_day","Time_spent_on_social_media_in_a_day")
      ),
      selectInput(
        "color",
        label = "choose color",
        choices = c("red","blue","yellow","green"),
        selected = "blue"
      )
    )
  )
)


Interactive_Page_3 <- tabPanel(
  titlePanel("Preferred method of communication for different age groups"),
    sidebarLayout(
        sidebarPanel(
            p("This simple scatter plot gives a precise visual about how different age groups
ranging from 14 - 23 use social media to communicate. This chart was used to show
the preferred methods of communication because it shows more than one way an
an age group preferred to communicate. This makes it easier to see the trend of
communication between different age groups. The trend of this chart shows that
people between the ages of 18 - 19 prefer all the types of communication methods
while age groups between 14 - 16, and 21 - 23 tend to prefer half or less than half
to communicate. The different preferred types of communication types go up
with age then slowly go back down after the age of 20.")),
        mainPanel(
            p(plotlyOutput("chart")),
            selectInput(
                "x_input",
                label = "set x-axis",
                choices = c("Age","Time_spent_on_social_media_in_a_day"),
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

threetakeawaysList <- shiny::tags$ol(
  shiny::tags$li(" It was suprizing to see that people still prefer face to face
  communication. With so many available platforms to communicate,
  it is nice to see that people still prefer face to face communication."),
  shiny::tags$li("Between the ages 18-20, people prefer all types of communication
  while ages between 14-18 and 21-23 both are age groups that prefer less than
  half of the communication platforms."),
  shiny::tags$li("19 years have the highest amount of physical activity hours as well
  as the highest amount of hours spent on social media. This was surprising as 
  you would think people who spent lots of time on social media would not have 
  much time spent on physical activity.")
)
Conclusion_Page <- tabPanel(
  titlePanel("Conclusion"),
  h2("Conclusion"),
  p("Everyday people are investing a large amount of their own time and
  attention into social media. Our group analyized data to see how people are
  spending their time on the internet and how their age groups affect their 
  preffered method of communication. Looking at the data, we set out to answer
  4 questions:"),
  
  shiny::tags$h3("While using various social media, how does everyone stay in touch with 
     each other?"),
  p("Looking at the data, we can see that there are many ways that people use
    use various social media to stay in touch. People use social media 
    platforms like Instagram, Twitter, Facebook, Tiner, as well Snapchat and
    many other platforms. But to stay in touch, you can see that they do not
    only use social media. To communicate, people also use text, call, and 
    communicate with people face to face."),
 
   shiny::tags$h3("Which social media platforms are the most popular?"),
  p("The data shows that some of the most popular social media platforms that 
  people are using are Youtube, Twitter, Instagram, and Snapchat."),

    shiny::tags$h3("What age group spends the most time on social media throughout the day? "),
  p("According to the survey, the age group that spends the most time on social
  media throughout the day is 19 year olds. "),

    shiny::tags$h3("3 Major Takeaways"),
  p("The three major takeaways that our group took from this project is:  "),
  threetakeawaysList, #List of the 3 major takeaways from are project
  img(src = "https://www.invoiceberry.com/blog/wp-content/uploads/2016/05/different_people_on_smartphones-e1462207780342.jpeg")
  
)

ui <- fluidPage(
  navbarPage(
    title = NULL,
    Intro_page,
    Interactive_Page_1,
    Interactive_Page_2,
    Interactive_Page_3,
    Conclusion_Page
  )
)
