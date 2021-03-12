# Logistic growth model function

LogisticGrowth <- function(r, K, g, init){
  n <- rep(NA, g) # pre allocated vector for abundance of pop
  n[1] = init # abundance of population at time 1
  K <- 10000 # carrying cap
  r <- 0.8 # growth rate
  time <- 1:g #relevant time frame
  
  for (i in 2:g){
    n[i] <- n[i-1] + ( r * n[i-1] * (K - n[i-1])/K ) # logistic growth eqn
    abundance <- n
    print(n[i])
  }
  plot(time,abundance, main = "Population Abundance over Time", xlab = "Time", ylab = "Pop Abundance")
  
  results <- cbind(time, abundance)
  colnames(results) <- c("Generations", "Abundance")
  rownames(results) <- NULL
  return(results)
}

# function test
g <- 12 # number of generations
init <- 2500 # initial population size
K <- 10000 # carrying cap
r <- 0.8 # growth rate

LogisticGrowth(r, K, g, init)

write.csv(LogisticGrowth(r, K, g, init), "Logistic_growth_results.csv")
