library(shiny)
library(ggplot2)
data("mtcars")



shinyServer(function(input, output) {
  distrib <- c("qbeta","qbinom","qchisq",
               "qexp","qf","qgamma","qnorm", "qpois")
  
  output$qqplot <- renderPlot({
    
    index <- input$dist 
    
    distribution <- distrib[index] 
    param <- input$normMean
    param <- c(param,input$normSD)
    
    ggplot(mtcars, aes(sample = mpg)) +
      stat_qq(distribution = distribution, dparams = param)
  
  
    })
})

  



