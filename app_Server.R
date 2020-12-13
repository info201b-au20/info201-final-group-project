library(plotly)

server <- function(input, output, session) {
  new_dataframe$id <- seq.int(nrow(new_dataframe))
	output$socialmedia_vs_exercise <- renderPlotly({ 
		socialmedia_vs_exercise <- ggplot(new_dataframe, aes(x = id)) + 
		geom_line(aes(y = Time_spent_on_social_media_in_a_day, color = "darkred"), size = input$size) + 
		geom_point(aes(y = Time_spent_on_physical_activities_in_a_day, color="steelblue"), size = input$size2) +
		scale_color_manual(values = c("darkred", "steelblue"), labels = c("Hours on social media", "Hours on physical activity")) +
		labs(title = "Social media use vs physical activity", x = "Survey Entry ID (ordered from least to greatest by hours on social media)", y = "Hours")

	  
	  
		ggplotly(socialmedia_vs_exercise)
		
})
	output$effects <- renderPlotly({ 
	  effects <- ggplot(new_dataframe, aes_string(x = input$x_axis)) +
			geom_bar() +
			labs(title = "Time spent on social media", x = "range of hours", y = "frequency")
  
		ggplotly(effects)
	})
	output$chart <- renderPlotly({ 
		chart <- ggplot(data = newDF) +
		geom_point(mapping = aes_string(x = input$x_input, y = "Preferred_type_of_communication"),
				   color = input$color_input) 
		ggplotly(chart)
	})
}  
