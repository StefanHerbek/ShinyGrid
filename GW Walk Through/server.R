
source("gridWorld.R")
source("solveGridWorld.R")

# Step 1 # Grid World App
# ############################################################################
# 
# shinyServer(function(input,output){
#   g1 <- newGrid()
#   # output$ followed by a name will be used to send output to ui
#   # renderPlot is the shiny function for graph output
#   output$grid <- renderPlot({   
#     plotGrid(g1,showState = TRUE)
#   })
# })
# 
# #############################################################################

# step 2 # Add Up Button
# ############################################################################
# # Using reactive values to update plot after button event
# 
# shinyServer(function(input,output){
#   # reactiveValues is used for holding variables that will be updated and passed between functions
#   game <- reactiveValues()
#   game$g1 <- newGrid()
#   # creating the event button that will update the game
#   observeEvent(input$upButton,{
#     ns <- nextStep(1,game$g1)
#     game$g1 <- ns$g
#   })
#   
#   output$grid <- renderPlot({   
#     plotGrid(game$g1,showState = TRUE)
#   })
# })
# 
# # #############################################################################

# Step 3 # More Buttons
# #############################################################################
# 
# shinyServer(function(input,output){
#   game <- reactiveValues()
#   game$g1 <- newGrid()
# 
#   observeEvent(input$upButton,{
#     ns <- nextStep(1,game$g1)
#     game$g1 <- ns$g
#   })
#   
#   observeEvent(input$leftButton,{
#     ns <- nextStep(4,game$g1)
#     game$g1 <- ns$g
#   })
#   
#   observeEvent(input$rightButton,{
#     ns <- nextStep(2,game$g1)
#     game$g1 <- ns$g
#   })
#   
#   observeEvent(input$downButton,{
#     ns <- nextStep(3,game$g1)
#     game$g1 <- ns$g
#   })
#   
#   output$grid <- renderPlot({   
#     plotGrid(game$g1,showState = TRUE)
#   })
# })
# 
# #############################################################################

# Step 4 # Lets keep score
# #############################################################################
# 
# shinyServer(function(input,output){
# 
#   game <- reactiveValues()
#   game$g1 <- newGrid()
#   game$score <- 0
#   game$results <- data.frame(Try = "Start", Action = "NA", Reward = 0, Score = 0, stringsAsFactors = F)
# 
#   # Each button must update the score and results dataframe
#   observeEvent(input$upButton,{
#     ns <- nextStep(1,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Up", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$leftButton,{
#     ns <- nextStep(4,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Left", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$rightButton,{
#     ns <- nextStep(2,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Right", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$downButton,{
#     ns <- nextStep(3,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Down", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
# 
#   output$grid <- renderPlot({   
#     plotGrid(game$g1,showState = TRUE)
#   })
#   
#   # New output with the results table
#   output$score <- renderTable(
#     head(game$results, 3)
#   )
# })
# 
# #############################################################################

# step 5 # add reset button
# #############################################################################
# 
# shinyServer(function(input,output){
#   
#   game <- reactiveValues()
#   game$g1 <- newGrid()
#   game$score <- 0
#   game$results <- data.frame(Try = "Start", Action = "NA", Reward = 0, Score = 0, stringsAsFactors = F)
#   
#   observeEvent(input$upButton,{
#     ns <- nextStep(1,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Up", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$leftButton,{
#     ns <- nextStep(4,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Left", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$rightButton,{
#     ns <- nextStep(2,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Right", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$downButton,{
#     ns <- nextStep(3,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Down", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   # Reset the score and reinitialize the game
#   observeEvent(input$resetButton,{
#     game$g1 <- newGrid()
#     game$score <- 0
#     game$results <- data.frame(try = "start", action = "NA", reward = 0, Score = 0, stringsAsFactors = F)
#     
#   })
#   
#   output$grid <- renderPlot({   
#     plotGrid(game$g1,showState = TRUE)
#   })
# 
#   output$score <- renderTable(
#     head(game$results, 3)
#   )
# })
# 
# #############################################################################

# Step 6 # no changes for server
# ############################################################################
# 
# shinyServer(function(input,output){
#   
#   game <- reactiveValues()
#   game$g1 <- newGrid()
#   game$score <- 0
#   game$results <- data.frame(Try = "Start", Action = "NA", Reward = 0, Score = 0, stringsAsFactors = F)
#   
#   observeEvent(input$upButton,{
#     ns <- nextStep(1,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Up", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$leftButton,{
#     ns <- nextStep(4,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Left", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$rightButton,{
#     ns <- nextStep(2,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Right", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$downButton,{
#     ns <- nextStep(3,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Down", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$resetButton,{
#     game$g1 <- newGrid()
#     game$score <- 0
#     game$results <- data.frame(try = "start", action = "NA", reward = 0, Score = 0, stringsAsFactors = F)
#     
#   })
#   
#   output$grid <- renderPlot({   
#     plotGrid(game$g1,showState = TRUE)
#   })
# 
#   output$score <- renderTable(
#     head(game$results, 3)
#   )
# })
# 
# #############################################################################

# Step 7 # Create and plot new grid
# #############################################################################
# 
# shinyServer(function(input,output){
#   
#   game <- reactiveValues()
#   game$g1 <- newGrid()
#   game$score <- 0
#   game$results <- data.frame(Try = "Start", Action = "NA", Reward = 0, Score = 0, stringsAsFactors = F)
#   
#   observeEvent(input$upButton,{
#     ns <- nextStep(1,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Up", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$leftButton,{
#     ns <- nextStep(4,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Left", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$rightButton,{
#     ns <- nextStep(2,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Right", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$downButton,{
#     ns <- nextStep(3,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Down", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$resetButton,{
#     game$g1 <- newGrid()
#     game$score <- 0
#     game$results <- data.frame(try = "start", action = "NA", reward = 0, Score = 0, stringsAsFactors = F)
#   })
#   
#   output$game <- renderPlot({   
#     plotGrid(game$g1,showState = TRUE)
#   })
#   
#   output$score <- renderTable(
#     head(game$results, 3)
#   )
#   # same as before, but this will not be getting passed between functions
#   output$grid<-renderPlot({
#     g2 = newGrid()
#     plotGrid(g2)
#   })
# })
# 
# #############################################################################

# Step 8 # add way to change values of squares
# #############################################################################
# 
# shinyServer(function(input,output){
#   
#   game <- reactiveValues()
#   game$g1 <- newGrid()
#   game$score <- 0
#   game$results <- data.frame(Try = "Start", Action = "NA", Reward = 0, Score = 0, stringsAsFactors = F)
#   
#   observeEvent(input$upButton,{
#     ns <- nextStep(1,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Up", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$leftButton,{
#     ns <- nextStep(4,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Left", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$rightButton,{
#     ns <- nextStep(2,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Right", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$downButton,{
#     ns <- nextStep(3,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Down", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$resetButton,{
#     game$g1 <- newGrid()
#     game$score <- 0
#     game$results <- data.frame(try = "start", action = "NA", reward = 0, Score = 0, stringsAsFactors = F)
#   })
#   
#   output$game <- renderPlot({   
#     plotGrid(game$g1,showState = TRUE)
#   })
#   
#   output$score <- renderTable(
#     head(game$results, 3)
#   )
# 
#   output$grid<-renderPlot({
#     # plug the new inputs into the grid function
#     g2 = newGrid(step = input$step, puddle = input$puddle, goal = input$goal)
#     plotGrid(g2)
#   })
# })
# 
# #############################################################################

# Step 9 # Add slider for noise
# #############################################################################
# 
# shinyServer(function(input,output){
#   
#   game <- reactiveValues()
#   game$g1 <- newGrid()
#   game$score <- 0
#   game$results <- data.frame(Try = "Start", Action = "NA", Reward = 0, Score = 0, stringsAsFactors = F)
#   
#   observeEvent(input$upButton,{
#     ns <- nextStep(1,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Up", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$leftButton,{
#     ns <- nextStep(4,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Left", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$rightButton,{
#     ns <- nextStep(2,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Right", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$downButton,{
#     ns <- nextStep(3,game$g1)
#     game$g1 <- ns$g
#     game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
#     game$results <- rbind(c("Down", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
#   })
#   
#   observeEvent(input$resetButton,{
#     game$g1 <- newGrid()
#     game$score <- 0
#     game$results <- data.frame(try = "start", action = "NA", reward = 0, Score = 0, stringsAsFactors = F)
#   })
#   
#   output$game <- renderPlot({   
#     plotGrid(game$g1,showState = TRUE)
#   })
#   
#   output$score <- renderTable(
#     head(game$results, 3)
#   )
#   
#   output$grid<-renderPlot({
#     # Just added the noise input
#     g2 = newGrid(step = input$step,
#                  puddle = input$puddle,
#                  goal = input$goal,
#                  noise = (1-input$noise))
#     plotGrid(g2)
#   })
# })
# 
# #############################################################################

# Step 10 Add solver
#############################################################################

shinyServer(function(input,output){
  
  game <- reactiveValues()
  game$g1 <- newGrid()
  game$score <- 0
  game$results <- data.frame(Try = "Start", Action = "NA", Reward = 0, Score = 0, stringsAsFactors = F)
  game$policy <- NULL
  
  observeEvent(input$upButton,{
    ns <- nextStep(1,game$g1)
    game$g1 <- ns$g
    game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
    game$results <- rbind(c("Up", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
  })
  
  observeEvent(input$leftButton,{
    ns <- nextStep(4,game$g1)
    game$g1 <- ns$g
    game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
    game$results <- rbind(c("Left", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
  })
  
  observeEvent(input$rightButton,{
    ns <- nextStep(2,game$g1)
    game$g1 <- ns$g
    game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
    game$results <- rbind(c("Right", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
  })
  
  observeEvent(input$downButton,{
    ns <- nextStep(3,game$g1)
    game$g1 <- ns$g
    game$score <- game$score + game$g1$r[game$g1$s[1],game$g1$s[2]]
    game$results <- rbind(c("Down", ns$name, game$g1$r[game$g1$s[1],game$g1$s[2]], game$score), game$results)
  })
  
  observeEvent(input$resetButton,{
    game$g1 <- newGrid()
    game$score <- 0
    game$results <- data.frame(try = "start", action = "NA", reward = 0, Score = 0, stringsAsFactors = F)
  })
  
  output$game <- renderPlot({   
    plotGrid(game$g1,showState = TRUE)
  })
  
  output$score <- renderTable(
    head(game$results, 3)
  )
  
  output$grid<-renderPlot({
    g2 = newGrid(step = input$step,
                 puddle = input$puddle,
                 goal = input$goal,
                 noise = (1-input$noise))
    # evaluating the checkbox 
    if(input$solution){
      # using the solveGridWorld funciton to create the arrows
      plotGrid(g2,policy=solvePolIter(g2))
    }else{
      plotGrid(g2,showState = TRUE)
    }
  })
})

#############################################################################