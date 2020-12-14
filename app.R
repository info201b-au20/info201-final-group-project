#Packages used
library(shiny)
library(plotly)
library(tidyverse)
library(ggplot2)
library(shinyWidgets)
library("RColorBrewer")
library(rsconnect)
library(shinydashboard)


#Source files
source("app_UI.R")
source("app_Server.R")
includeCSS("css_code.txt")





shinyApp(ui, server)