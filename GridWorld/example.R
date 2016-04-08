rm(list=ls(all=TRUE))

source("gridWorld.R")

g = newGrid()

## plot grid world
plotGrid(g)

## plot the state
plotGrid(g,showState = TRUE)

## transition to a new state and plot it
## 1 = up
## 2 = right
## 3 = down
## 4 = left

for(i in 1:10){
  Sys.sleep(1)
  t <- nextStep(1,g)
  g = t$g
  a <- t$t
  plotGrid(g,showState = TRUE)
  print(g$r[g$s[1],g$s[2]])
  print(a)
  
}


## a randomly generated policy
policy = matrix(sample(1:4,g$x*g$y,replace=TRUE),nrow=g$x,ncol=g$y)

## plot the policy
plotGrid(g,policy=policy)


## probability of moving from s to sp by taking action a
s = c(1,7)
sp = c(1,8)
a = 1
transProb(s,a,sp,g)


## expected reward from taking action a in state s
expReward(s,a,g)