# server.R
library(shiny)
library(maps)
library(mapproj)

source("helpers.R")

counties <- readRDS("data/counties.rds")

shinyServer(
  
  function(input, output) {
    
    output$map <- renderPlot({
      
      data <- switch(input$var, 
                     "Percent White" = counties$white,
                     "Percent Black" = counties$black,
                     "Percent Hispanic" = counties$hispanic,
                     "Percent Asian" = counties$asian)
      
      color <- switch(input$var, 
                      "Percent White" = "green",
                      "Percent Black" = "red",
                      "Percent Hispanic" = "blue",
                      "Percent Asian" = "yellow")
      
      legend <- switch(input$var, 
                       "Percent White" = "% White",
                       "Percent Black" = "% Black",
                       "Percent Hispanic" = "% Hispanic",
                       "Percent Asian" = "% Asian")
      
      percent_map(data, color, legend, input$range[1], input$range[2])
    })
      
  }
)
    