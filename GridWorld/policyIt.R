
rm(list=ls(all=TRUE))

source("gridWorld.R")

g = newGrid()

  

  policymat <- matrix(rep(1,(g$x*g$y)), ncol=g$x, nrow=g$y)


    
  plotGrid(g)

  ## plot the policy
  plotGrid(g,policy=policymat) 
  
  actions=NULL
  # get set of actions if none given
  if (is.null(actions)) {
    actions <- c(1:length(g$actions)) # {1,2,3,4}
  }
  states=NULL
  # get (x,y) for all states if none given
  if (is.null(states)) {
    for (i in 1:g$x) {
      for (j in 1:g$y){
        states <- append(states, list(c(i,j)))
      }
    }
  }


    
  policy <- NULL
  for (i in 1:g$x) {
    for (j in 1:g$y){
      policy <- append(policy, list(c(i,j, policymat[i,j])))
    }
  }
  
  # takes in states and policy and returns 100x100 transition matrix
  transM <- function(policy){
    t <- matrix(0, nrow=100, ncol=100)
    rewards <- c(rep(0,100))
    for(i in 1:100){
      s <- unlist(states[i])
      a <- unlist(policy[i])
      rewards[i] <- expReward(s,a[3], g)
      for(j in 1:100){
       sp <- unlist(states[j])
       t[i,j]  <- transProb(s,a[3],sp,g)
       
      }
    }
    
    return(list(t, rewards))
  }
  
  x <- transM(policy)
  
  # should give the value of the policy at each state
  pval <- solve(diag(100) - .999*x[[1]])%*%x[[2]]
  
  pvalM <- matrix(pval, nrow=10, ncol=10, byrow=T)

  f <- 0
  
  while(f == 0){
  
    newP <- matrix(0, nrow=10, ncol=10, byrow=F)
    for(i in 1:10){
      for(j in 1:10){
        
        v1 <- c(0,0,0,0)
        
        for(a in actions){
          
          v1[a] <- expReward(c(i,j),a=a,g)
          v2 <- 0
          for(k in 1:10){
            for(l in 1:10){
              
              v2  <- v2 + transProb(c(i,j),a,c(k,l),g)*pvalM[k,l]
              
            }
          }
          v1[a] <- v1[a] + .999*v2
        }
        newP[i,j] <- which.max(v1)
        
      }
    }
    
    
    plotGrid(g,policy=newP)
    newPL <- NULL
    for (i in 1:g$x) {
      for (j in 1:g$y){
        newPL <- append(newPL, list(c(i,j, newP[i,j])))
      }
    }
    
    x <- transM(newPL)
    
    # should give the value of the policy at each state
    newPVal <- solve(diag(100) - .999*x[[1]])%*%x[[2]]
    
    newPValM <- matrix(newPVal, nrow=10, ncol=10, byrow=T)
    
    if(sum(newPValM) > sum(pvalM)){
      pvalM <- newPValM
      print("go")
    } else{
      sum(newPValM)
      sum(pvalM)
      print("winner")
      f <- 1
    }
    
  }
  
  