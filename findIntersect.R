#Call allIntersections(matrix) to find all the intersections on a graph. 
#The matrix has to be made up of two colums, one for the x-coordinates, one for the y-coordinates

findIntersect <- function(xa, x1a, ya, y1a, xb, x1b, yb, y1b) {

  x = 0
  y = 0
  #Find the slopes first
  if ((xa != x1a) & (ya != y1a))
    m1 = (y1a - ya)/(x1a -xa)
  else 
    m1 = 0
  if ((xb != x1b) & (yb != y1b))
    m2 = (y1b - yb)/(x1b -xb)
  else
    m2 = 0
  
  #Next, find the value of c
  if (m1 != 0)
    c1 = ya - (m1*xa)
  if (m2 != 0)
    c2 = yb - (m2*xb)
  
  if (m2 != 0 &  m1 != 0) {
  #Next find where they intersect

    # Find X  
    x = (c2 - c1) / (m1 - m2)
    
    # Find Y
    y = m1*x + c1
  }
  else if (m1 == 0 & m2 == 0) {
    if (xa == x1a & xb != x1b) {
      x = xa
      y = yb
    }
    else if (xa != x1a & xb == x1b) {
      x = xb
      y = ya
    }
    else { # Parallel lines
      x = -1
      y = -1
    }
  }
  else if (m1 == 0 & m2 != 0) {
    if (xa == x1a) { #vertical line
       x = xa
       y = m2*x + c2
    }
    else if (ya == y1a) { #horizontal line
       y = ya
       x = (y - c2)/m2 
    }
  }
  
  else if (m1 != 0 & m2 == 0) {
    if (xb == x1b) { #vertical line
      x = xb
      y = m1*x + c1
    }
    else if (yb == y1b) { #horizontal line
      y = yb
      x = (y - c1)/m1 
    }
  }

  
  

  if (!is.nan(x)) {
    isInX1 = FALSE
    isInX2 = FALSE
    
    isInY1 = FALSE
    isInY2 = FALSE
    
    
      if (xa < x1a) {
        if (x > xa & x < x1a)
          isInX1 = TRUE
      }
      else {
        if (x <= xa & x >= x1a)
          isInX1 = TRUE
      }
      if (xb < x1b) {
        if (x > xb & x < x1b)
          isInX2 = TRUE
         }
        else {
          if (x <= xb & x >= x1b)
          isInX2 = TRUE
        }

      if (ya < y1a) {
        if (y > ya & y < y1a)
          isInY1 = TRUE
      }
      else {
        if (y <= ya & y >= y1a)
          isInY1 = TRUE
      }
      if (yb < y1b) {
        if (y > yb & y < y1b)
          isInY2 = TRUE
      }
      else {
        if (y <= yb & y >= y1b)
          isInY2 = TRUE
      }
 #   }
    
  
    if (isInX1 == TRUE & isInX2 == TRUE & isInY1 == TRUE & isInY2 == TRUE)
      return(c(x,y))
    else
      return(c(-1,-1))
  }
  else return(c(-1,-1))
  #Return x and y
  
}


allIntersections <- function(m) {
  inter <- data.frame(-1,-1)
  colnames(inter) <- c("x", "y")
  if (!ncol(m) == 2) {
    return(0)
  }
  else {
    for (i in 1:(nrow(m)-3)) {
      for (j in (i+2):(nrow(m)-1)) {
        res <- findIntersect(m[i,1], m[(i+1),1], m[i,2], m[(i+1),2], m[(j),1], m[(j+1),1], m[(j),2], m[(j+1),2])
#        print(toString(res))
        inter <- rbind(inter, res)
      }
    }
  }
  return(inter[which(inter$x != -1),])
}


permsTSP <- function(x,fun = NULL, ...) {
  if (is.numeric(x) && length(x) == 1 && x > 0 && trunc(x) == 
      x) 
    x <- seq(x)
  n <- length(x)
  nofun <- is.null(fun)
  TSPLen <- factorial(length(x))/2
#  out <- vector("list", gamma(n + 1))
  out <- vector("list", length = TSPLen)
  p <- ip <- seqn <- 1:n
  d <- rep(-1, n)
  d[1] <- 0
  m <- n + 1
  p <- c(m, p, m)
  i <- 1
  use <- -c(1, n + 2)
  count <- 0
  while (m != 1 & count < TSPLen) {
    out[[i]] <- if (nofun) 
      x[p[use]]
    else fun(x[p[use]], ...)
    i <- i + 1
    m <- n
    chk <- (p[ip + d + 1] > seqn)
    m <- max(seqn[!chk])
    if (m < n) 
      d[(m + 1):n] <- -d[(m + 1):n]
    index1 <- ip[m] + 1
    index2 <- p[index1] <- p[index1 + d[m]]
    p[index1 + d[m]] <- m
    tmp <- ip[index2]
    ip[index2] <- ip[m]
    ip[m] <- tmp
    count = count + 1
  }
  out
  
}


minPermutes <- function(m) {
  source("TSP.R")
  cheapest = Inf
  selected = m
  m1 <- permsTSP(2:nrow(m))
  for (i in 1:length(m1)) {
    m3 <- cbind(m[m1[[i]],1], m[m1[[i]],2])
    m3 <- rbind(m[1,],m3)
    m3 <- rbind(m3,m3[1,])
    z <- calculateCost(m3)
    if (z < cheapest) {
      cheapest = z
      selected = m3
    }
  }
  return(selected)
}


allPermuteIntersects <- function(m) {
  m1 <- permsTSP(2:nrow(m))
  totalInters <- 0
  print(c("Number of permutations is: ",length(m1)))
  for (j in 1:length(m1)) {
  m2 <- m[1,]
  for (i in 1:nrow(m)-1)
    m2 <- rbind(m2,m[m1[[j]][i],])
    m2 <- rbind(m2,m2[1,])
    totalInters <- totalInters + nrow(allIntersections(m2))
#    plot(m2) you really don't want to do this for more than 8 nodes
#    lines(m2)
 # print(".")
  }
  return(totalInters)
}
