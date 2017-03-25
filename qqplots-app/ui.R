library(shiny)
shinyUI(fluidPage(
  
  titlePanel("QQ Plots"),
  
  sidebarLayout(
    sidebarPanel(
  
      selectInput("dist", label = h3("Choose the Distribution"), 
                  choices = list("Beta"=1,"Binomial"=2,"Chi-Squared"=3,
                   "Exponential"=4,"F"=5,"Gamma"=6,"Normal" = 7, "Poisson" = 8), 
                  selected = 7),
      
      conditionalPanel(
        condition = "input.dist == 1",  
        sliderInput(  "beta", "Beta ",
        min = 0, max=100, value=1
        )),
      
      conditionalPanel(
        condition = "input.dist == 2",  
        sliderInput(  "shape1", "Binomial ",
                      min = 0, max=100, value=1
        )),
      
      conditionalPanel(
        condition = "input.dist == 3",  
        sliderInput(  "chiSquared", "Chi-Squared ",
                      min = 0, max=100, value=1
        )),
      conditionalPanel(
        condition = "input.dist == 4",  
        sliderInput(  "exponential", "Exponential ",
                      min = 0, max=100, value=1
        )),
      conditionalPanel(
        condition = "input.dist == 6",  
        sliderInput(  "gamma", "Gamma ",
                      min = 0, max=100, value=1
        )),
      conditionalPanel(
        condition = "input.dist == 7",  
        sliderInput(  "normMean", "Mean ",
                      min = 0, max=1000, value=1
        ),
        sliderInput(  "normSD", "SD ",
                      min = 0, max=5, value=1,step=0.1
        )),
      conditionalPanel(
        condition = "input.dist == 8",  
        sliderInput(  "poisson", "Poisson ",
                      min = 0, max=100, value=1
        )),
      
      
      hr(),
      fluidRow(column(3, verbatimTextOutput("value")))
      
    
    ),
  
   mainPanel(
    plotOutput("qqplot")
  )
 )
))