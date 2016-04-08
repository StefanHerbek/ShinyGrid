#Load package
library(shiny)
source("gridWorld.R")

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Grid World"),
  
  mainPanel(
    tabsetPanel(id='mytabs',
                tabPanel("Game",
                         fluidRow(
                          column(3,
                          br(),
                          br(),
                          br(),
                          br(),
                          br(),
                          br(),
                          br(),
                          actionButton('upButton',"Up", width = 135),
                          fluidRow(
                                  column(6,actionButton('leftButton', "Left", width = 60)),
                                  column(6,actionButton('rightButton', "Right"))
                          ),
                          actionButton('downButton',"Down", width = 135),
                          br(),
                          br(),
                          actionButton('resetButton',"Reset", width = 135)
                        ),
                        column(9, plotOutput("game"),
                         tableOutput('score')
                        )
                    )
                ),
                tabPanel("Solve",
  

                  sidebarLayout(
                    sidebarPanel(

                      numericInput("step","Step Value:", value = -1, step = 1),
                      numericInput("puddle","Puddle Value:", value = -10, step = 1),
                      numericInput("goal","Goal Value:", value = 50, step = 1),
                      sliderInput("noise", "Probability of taking correct action", min = 0, max = 1, value = .7, step = .01)
                      ),
                      mainPanel(plotOutput("grid"),
                      checkboxInput("solution","Show Optimal Strategy"))
                    )
                )
      )
  )
))