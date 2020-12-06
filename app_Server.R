library(plotly)

server <- function(input, output, session) {
  output$chart <- renderPlotly({ 
        chart <- ggplot(data = newDF) +
        geom_point(mapping = aes_string(x = input$x_input, y = "Preferred_type_of_communication"),
                   color = input$color_input) 
        ggplotly(chart)
  })
}  
