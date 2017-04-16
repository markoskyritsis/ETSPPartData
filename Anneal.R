calculateCost = function(MAT) {
  return(getDist(MAT))
}

acceptanceProbability <- function(oldCost, newCost, Temp) {
  prob <- exp((oldCost - newCost)/Temp)
  print(c("prob",prob))
  return(prob)
}

newSolution <- function(m) {
  switch1 = 0
  switch2 = 0
  while (switch1 == switch2) {
    switch1 <- round(runif(min = 2, max = (nrow(m)-1), n = 1))
    switch2 <- round(runif(min = 2, max = (nrow(m)-1), n = 1))
  }
  temp <- m[switch1,]
  m[switch1,] <- m[switch2,]
  m[switch2,] <- temp
  return(m)
}

Anneal <- function(x,y, Temp = 100000, alpha = 0.999) {
  m <- matrix(c(x,y),ncol = 2)
  m <- rbind(m,m[1,])
  best <- m
  oldCost <- calculateCost(m)
  T_min <- 1
  while (Temp > T_min) {
      m1 <- newSolution(m)
      newCost <- calculateCost(m1)
      prob <- acceptanceProbability(oldCost, newCost, Temp)
      rand <- runif(min = 0,max = 1, n = 1)
      if (prob > rand) {
        m <- m1
        oldCost <- newCost
        if (newCost < calculateCost(best))
          best <- m
      }
 #    }
      Temp = Temp*alpha
  }
  
  return(best)
}