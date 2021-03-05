# Computational Bio 4420
# Lab 7 - Working with functions
# Chris McSpadden


#########

# Problem 1.  Area of a triangle when given base and height

# Function definition:
triangleArea <- function(base, height){
  area <- 0.5 * base * height # calc area
  return(area)
}

# Demonstration of usage:

b1 = 10
h1 = 9
triangleArea(b1,h1) #test case 1

b2 = 5
h2 = 6
triangleArea(b2,h2) #test case 2

########


# Problem 2. Absolute value function

# Function definition:
myAbs <- function(n){
  for (i in 1:length(n)){
    if (n[i] >= 0){
    }
    
    else if (n[i] < 0){
      n[i] <- sqrt(n[i]^2) # if number is negative, change to a positive
    }
  }
  return(n)
}

# Demonstration of usage:
myAbs(5)
myAbs(-2.3)
testVec <- c(1.1, 2, 0, -4.3, 9, -12)
myAbs(testVec)

#########

# Problem 3.  Fibonacci

# Function definition:
fibSeq <- function(n, start){
  fib <- rep(0,n) #pre-allocation for fibonacci
  fib[1] <- start
  fib[2] <- 1
  
  # for loop for fibonacci sequence
  for (i in 3:n){
    fib[i] <- fib[i-2] + fib[i-1]
  }
  return(fib)
}

# Demonstration of usage:
fibSeq(20, 0)
fibSeq(20, 1)


#########

# Problem 4a.  Square difference

# Function definition:
squareDiff <- function(x, y){
  diff <- (x - y) ^ 2
  return(diff)
}

# Demonstration of usage:
squareDiff(3, 5)
squareDiff(c(2, 4, 6), 4)


#########

# Problem 4b.  mean function

# Function definition:
avg <- function(vec){
  if (is.data.frame(vec)){
    vec <- vec[,1] #if input is DF, change to vector
  }
  mean <- sum(vec) / length(vec) # calc mean
  return(mean)
}

# Demonstration of usage:
avg(c(5, 15, 10))
data <- read.csv("DataForLab07.csv")
avg(data)


#########

# Problem 4c. sum of squares

# Function definition:
sumSquares <- function(vec){
  if (is.data.frame(vec)){
    vec <- vec[,1] #if input is DF, change to vector
  }
  
  mean <- avg(vec) # calc mean for vector
  squareDiffs <- rep(0, length(vec)) # pre-allocate vector for squared diffs
 
  for (i in 1:length(vec)){
    squareDiffs[i] <- squareDiff(vec[i], mean) # calc squared differences for each index
  }
  result <- sum(squareDiffs) # add up all square diffs
  return(result)
}

# Demonstration of usage:
sumSquares(data)
sumSquares(c(1,2,3,4,5))

########
