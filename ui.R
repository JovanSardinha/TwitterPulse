library(shiny)
library(shinyIncubator)


shinyUI(fluidPage(
  progressInit(),
  titlePanel("Twitter Pulse"),
  
  sidebarLayout(sidebarPanel(textInput("track", label = h3("Enter a word to know the pulse "), 
                                       value = ""),
                             actionButton("update", "Submit")
                            ) ,
  
  mainPanel(
    plotOutput("cloud"),
    plotOutput("graph")
  ),
 
  
  )))
  
  
  
 