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
        print(toString(res))
        inter <- rbind(inter, res)
      }
    }
  }
  return(inter[which(inter$x != -1),])
}