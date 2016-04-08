

tForPolicy<-function(policy,g){
  T = matrix(0,g$x*g$y,g$x*g$y)
  indX = 1
  for(x in 1:g$x){
    for(y in 1:g$y){
      indY = 1
      for(xp in 1:g$x){
        for(yp in 1:g$y){
          T[indX,indY] = transProb(c(x,y),policy[x,y],c(xp,yp),g)
          indY = indY + 1
        }
      }
      indX = indX + 1
    }
  }
  return(T)
}

rForPolicy<-function(policy,g){
  R = rep(0,g$x*g$y)
  ind = 1
  for(x in 1:g$x){
    for(y in 1:g$y){
      R[ind] = expReward(c(x,y),policy[x,y],g)
      ind = ind + 1
    }
  }
  return(R)
}

polEval<-function(policy,g,gamma=1.0){
  T = tForPolicy(policy,g)
  R = rForPolicy(policy,g)
  
  v = solve(diag(length(R)) - gamma*T,R)
  return(v)
}


polUpdate<-function(v,g,gamma=1.0,ties.method="first"){
  vA = sapply(1:length(g$actions),
              function(a){
                policy=matrix(a,g$x,g$y)
                T = tForPolicy(policy,g)
                R = rForPolicy(policy,g)
                return(R + gamma*T%*%v)
              })
  return(matrix(max.col(vA,ties.method=ties.method),g$x,g$y,byrow=TRUE))
}

start <- matrix(c(1,1,1,1,1,1,1,1,1,2,
                  4,4,4,1,4,1,1,1,1,2,
                  4,4,4,4,2,4,4,1,2,2,
                  4,3,1,1,2,2,2,2,2,2,
                  4,3,2,1,1,1,1,1,2,2,
                  2,1,1,1,2,1,1,1,2,2,
                  2,3,4,1,2,2,2,1,1,2,
                  2,2,2,1,1,1,1,1,1,3,
                  2,2,2,2,4,1,2,2,4,4,
                  1,1,1,1,1,1,1,1,1,4),
                ncol = 10, nrow = 10, byrow = T)

solvePolIter<-function(g,polInit=NULL,gamma = 0.99){
  if(is.null(polInit)){
    polInit = start
    }
  
  converged = FALSE
  while(!converged){
    v = polEval(polInit,g,gamma)
    policy = polUpdate(v,g,gamma)
    
    converged = all(policy == polInit)
    
    polInit = policy
  }
  return(policy)
}