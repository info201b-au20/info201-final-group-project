library(shiny)

page_one <- tabPanel(
  "Introductory page",
  sidebarLayout(
    sidebarPanel(
        
    ),
    mainPanel(
        
    )
  )
)
  
page_two <- tabPanel(
  "Interactive Page 1",
  sidebarLayout(
    sidebarPanel(
        
    ),
    mainPanel(
        
    )
  )
)

ui <- fluidPage(
  navbarPage(
    "Application",
    page_one,
    page_two
  )
)