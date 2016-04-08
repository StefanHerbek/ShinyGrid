rm(list=ls(all=TRUE))

source("gridWorld.R")

g = newGrid()


  # set V0 to 0 for all states
  v = matrix(0,nrow=10, ncol=10)
  vUpdate = matrix(0,nrow=10, ncol=10)
  
  # set delta to 0
  delta = 0
  gamma = .5
  # repeat until convergence gamma=0.5
  repeat
  {
    before <- norm(v)
    for (i in 1:10){
      for(j in 1:10){
        va1 = expReward(c(i,j),a=1,g) 
        va2 = expReward(c(i,j),a=2,g) 
        va3 = expReward(c(i,j),a=3,g) 
        va4 = expReward(c(i,j),a=4,g) 
        nextVal <- 0
        for(k in 1:10){
          for(l in 1:10){
            nextVal  <- nextVal + transProb(c(i,j),which.max(c(va1,va2,va3,va4)),c(k,l),g)*v[k,l]  
          }
        }
        vUpdate[i,j] <- max(va1,va2,va3,va4) + nextVal
      }
    }
    v <- vUpdate
    delta <- abs(norm(v) - before) 
    
    if (delta<gamma)
    {
      break 
    }
  }

v

