#Packages usedgit 
library(shiny)
library(plotly)
library(tidyverse)
library(ggplot2)
library(shinyWidgets)
library("RColorBrewer")


#Source files
source("app_UI.R")
source("app_Server.R")





shinyApp(ui, server)