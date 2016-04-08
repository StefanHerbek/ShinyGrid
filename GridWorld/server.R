
source("gridWorld.R")
source("solveGridWorld.R")

shinyServer(function(input, output) {
  
  game <- reactiveValues()
  game$g1 <- newGrid(noise = .3)
  game$score <- 0
  game$results <- data.frame(Try = "start", Action = "NA", Reward = 0, Score = 0, stringsAsFactors = F)
  output$game<-renderPlot({
    
    plotGrid(game$g1,showState = TRUE)

  })
  
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
    game$g1 <- newGrid(noise = .2)
    game$score <- 0
    game$results <- data.frame(try = "start", action = "NA", reward = 0, Score = 0, stringsAsFactors = F)

  })
  
  output$score <- renderTable(
    head(game$results, 3)
  )
  

  output$grid<-renderPlot({
    
    g2 = newGrid(step = input$step, puddle = input$puddle, goal = input$goal, noise = (1-input$noise))
    if(input$solution){
      plotGrid(g2,policy=solvePolIter(g2))
      # plotGrid(g2,policy=polUpdate(solveValueIter(g2, method = "Fast"), g2))
    }else{
      plotGrid(g2,showState = TRUE)
    }
  })
})