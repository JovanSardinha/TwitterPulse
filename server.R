library(shiny)
library(ggplot2)
library(shinyIncubator)

source("movier.R")
shinyServer(function(input, output,session) {
  
 
  
   tweets<-reactive({
     
     input$update
     # ...but not for anything else
     isolate({
       withProgress(session, {
         setProgress(message = "Getting Tweets")
         search_twitter(input$track)
       })
     })
     })
   
   
  output$score <- renderText({ 
    paste("Tweets about the movie -", (input$track))
  })
  
  
  output$graph<-renderPlot({
  qplot(computeSentiment(tweets()),xlab="Scores",ylab="Frequency")
  }
    )
  
  output$cloud<-renderPlot({
    plotwordCloud(tweets())
  })
  
})