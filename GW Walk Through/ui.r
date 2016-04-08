
# Load package
library(shiny)
source("gridWorld.R")


# Step 1 # Title and Plot Grid
# #############################################################################
# # Grid World App
# 
# shinyUI(fluidPage(
#   # Application title
#   titlePanel("Grid World"),
#   mainPanel(plotOutput('grid'))
#   )
# )
# 
# #############################################################################

# # Step 2 # Add Buttons
# #############################################################################
# # Using fluidRow to break up buttond and plot
# 
# shinyUI(fluidPage(
# 
#   titlePanel("Grid World"),
#   mainPanel(
#     fluidRow(
#       # column will break up your panel
#       # all panels are made with 12 "units"
#       column(3,
#              # actionButton shiny function 
#              # 'upButton' is name from server
#              # "Up" will be displayed on UI
#              actionButton('upButton',"Up")
#       ), column(9,plotOutput('grid'))
#     )
#   )
# ))
# 
# #############################################################################

# # Step 3 # More Buttons
# #############################################################################
# 
# shinyUI(fluidPage(
# 
#   titlePanel("Grid World"),
#   mainPanel(
#     fluidRow(
#       column(3,
#              # br's to add space 
#               br(),
#               br(),
#               br(),
#               br(),
#               br(),
#               br(),
#               br(),
#              # use width to change size of the button
#               actionButton('upButton',"Up", width = 135),
#               fluidRow(
#                 # breaking up column with right and left
#                 column(6,actionButton('leftButton', "Left", width = 60)),
#                        column(6,actionButton('rightButton', "Right"))
#                       ),
#                       actionButton('downButton',"Down", width = 135)
#       ), column(9,plotOutput('grid'))
#     )
#   )
# ))
# 
# #############################################################################

# Step 4 # Add score table
# #############################################################################
# 
# shinyUI(fluidPage(
# 
#   titlePanel("Grid World"),
#   mainPanel(
#     fluidRow(
#       column(3,
#              br(),
#              br(),
#              br(),
#              br(),
#              br(),
#              br(),
#              br(),
#              actionButton('upButton',"Up", width = 135),
#              fluidRow(
#                column(6,actionButton('leftButton', "Left", width = 60)),
#                column(6,actionButton('rightButton', "Right"))
#              ),
#              actionButton('downButton',"Down", width = 135)
#       # Use output table to add the results table
#       ), column(9,plotOutput('grid'),
#           tableOutput('score')
#          )
#     )
#   )
# ))
# 
# #############################################################################

# Step 5 # Add reset button and the game part is done!
# #############################################################################
# 
# shinyUI(fluidPage(
# 
#   titlePanel("Grid World"),
#   mainPanel(
#     fluidRow(
#       column(3,
#              br(),
#              br(),
#              br(),
#              br(),
#              br(),
#              br(),
#              br(),
#              actionButton('upButton',"Up", width = 135),
#              fluidRow(
#                column(6,actionButton('leftButton', "Left", width = 60)),
#                column(6,actionButton('rightButton', "Right"))
#              ),
#              actionButton('downButton',"Down", width = 135),
#              # add some breaks and then the new button
#              br(),
#              br(),
#              actionButton('resetButton',"Reset", width = 135)
#       ), column(9,plotOutput('grid'),
#                 tableOutput('score')
#       )
#     )
#   )
# ))
# 
# #############################################################################

# Step 6 # Tab layout
# #############################################################################
# 
# shinyUI(fluidPage(
# 
#   titlePanel("Grid World"),
#   
#   mainPanel(
#     # Within the main panel we create a tabset panel
#     tabsetPanel(id='mytabs',
#       # our first tab will be called Game
#       tabPanel("Game",
#         fluidRow(
#           column(3,
#             br(),
#             br(),
#             br(),
#             br(),
#             br(),
#             br(),
#             br(),
#             actionButton('upButton',"Up", width = 135),
#             fluidRow(
#               column(6,actionButton('leftButton', "Left", width = 60)),
#               column(6,actionButton('rightButton', "Right"))
#             ),
#             actionButton('downButton',"Down", width = 135),
#             br(),
#             br(),
#             actionButton('resetButton',"Reset", width = 135)
#           ),
#           column(9, plotOutput("grid"),
#             tableOutput('score')
#           )
#         )
#       ),
#       # New tab will be called Solve
#       tabPanel("Solve"
#       )
#     )
#   )
# ))
# 
# #############################################################################

# Step 7 # Create and plot new grid
# #############################################################################
# 
# shinyUI(fluidPage(
# 
#   titlePanel("Grid World"),
#   
#   mainPanel(
#     # Within the main panel we create a tabset panel
#     tabsetPanel(id='mytabs',
#       # our first tab will be called Game
#       tabPanel("Game",
#         fluidRow(
#           column(3,
#             br(),
#             br(),
#             br(),
#             br(),
#             br(),
#             br(),
#             br(),
#             actionButton('upButton',"Up", width = 135),
#             fluidRow(
#               column(6,actionButton('leftButton', "Left", width = 60)),
#               column(6,actionButton('rightButton', "Right"))
#             ),
#             actionButton('downButton',"Down", width = 135),
#             br(),
#             br(),
#             actionButton('resetButton',"Reset", width = 135)
#           ),
#           column(9, plotOutput("game"),
#             tableOutput('score')
#           )
#         )
#       ),
#       tabPanel("Solve",
#           mainPanel(plotOutput("grid"))
#         )
#       )
#   )
# ))
# 
# #############################################################################

# Step 8 # Add way to change values of squares
# #############################################################################
# 
# shinyUI(fluidPage(
#   
#   titlePanel("Grid World"),
#   mainPanel(
#     tabsetPanel(id='mytabs',
#       tabPanel("Game",
#         fluidRow(
#           column(3,
#           br(),
#           br(),
#           br(),
#           br(),
#           br(),
#           br(),
#           br(),
#           actionButton('upButton',"Up", width = 135),
#           fluidRow(
#             column(6,actionButton('leftButton', "Left", width = 60)),
#             column(6,actionButton('rightButton', "Right"))
#           ),
#           actionButton('downButton',"Down", width = 135),
#           br(),
#           br(),
#           actionButton('resetButton',"Reset", width = 135)
#         ),
#         column(9, plotOutput("game"),
#           tableOutput('score')
#         )
#       )
#     ),
#     tabPanel("Solve",
#       # sidebar layout just a built in way to breat up the panel
#       sidebarLayout(
#         sidebarPanel(
#           # use numericInput to change values of the steps
#           numericInput("step","Step Value:", value = -1, step = 1),
#           numericInput("puddle","Puddle Value:", value = -10, step = 1),
#           numericInput("goal","Goal Value:", value = 50, step = 1)
#         ),
#         mainPanel(plotOutput("grid"))
#         )
#       )
#     )
#   )
# ))
# 
# #############################################################################

# Step 9 # Add slider for noise
# #############################################################################
# 
# shinyUI(fluidPage(
#   
#   titlePanel("Grid World"),
#   mainPanel(
#     tabsetPanel(id='mytabs',
#       tabPanel("Game",
#         fluidRow(
#           column(3,
#           br(),
#           br(),
#           br(),
#           br(),
#           br(),
#           br(),
#           br(),
#           actionButton('upButton',"Up", width = 135),
#           fluidRow(
#             column(6,actionButton('leftButton', "Left", width = 60)),
#             column(6,actionButton('rightButton', "Right"))
#           ),
#           actionButton('downButton',"Down", width = 135),
#           br(),
#           br(),
#           actionButton('resetButton',"Reset", width = 135)
#         ),
#         column(9, plotOutput("game"),
#           tableOutput('score')
#         )
#       )
#     ),
#     tabPanel("Solve",
#       sidebarLayout(
#         sidebarPanel(
#           # 
#           numericInput("step","Step Value:", value = -1, step = 1),
#           numericInput("puddle","Puddle Value:", value = -10, step = 1),
#           numericInput("goal","Goal Value:", value = 50, step = 1),
#           # use sliderInput to add the slider
#           sliderInput("noise", "Probability of taking correct action", min = 0, max = 1, value = .7, step = .01)
#         ),
#         mainPanel(plotOutput("grid"))
#         )
#       )
#     )
#   )
# ))
# 
# #############################################################################

# Step 10 # Add checkbox for solution
#############################################################################

shinyUI(fluidPage(
  
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
            # Use checkboxInput to add the checkbox
            checkboxInput("solution","Show Optimal Strategy")
          )
        )
      )
    )
  )
))

#############################################################################

