library(shiny)

Intro_page <- tabPanel(
  "Introductory page",
  sidebarLayout(
    sidebarPanel(
        
    ),
    mainPanel(
        
    )
  )
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
  "Interactive Page 3",
  sidebarLayout(
    sidebarPanel(
      
    ),
    mainPanel(
      
    )
  )
)

Conclusion_Page <- tabPanel(
  "Conclusion",
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
    Intro_page,
    Interactive_Page_1,
    Interactive_Page_2,
    Interactive_Page_3,
    Conclusion_Page
  )
)