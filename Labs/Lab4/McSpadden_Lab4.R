# Lab 4 EBIO 4420
# Chris McSpadden

# Problem 1: printing hi 10 times
for (i in 1:10){
  print("hi")
}

# problem 2: piggy bank
piggyBank <- 10 #dollars
allowance <- 5 #dollars
gumCost <- 2 * 1.34 #cost of 2 packs of gum
weeks <- 8 #relevant time frame 

for (i in 1:weeks) {
piggyBank <- piggyBank + allowance - gumCost #update piggy bank total
print(piggyBank)
}

#Problem 3
pop <- 2000 # current population size
rate <- 0.05 # decay rate

for (i in 1:7){
  pop <- pop - (pop * rate) # update pop size
  print(pop)
}

#problem 4 and problem 7
n <- rep(NA, 12) # pre allocated vector for abundance of pop
n[1] = 2500 # abundance of population at time 1
K <- 10000 # carrying cap
r <- 0.8 # growth rate
time <- 1:12 #relevant time frame

for (i in 2:12){
  n[i] <- n[i-1] + ( r * n[i-1] * (K - n[i-1])/K ) # logistic growth eqn
  abundance <- n
  print(n[i])
}
plot(time,abundance)

# Problem 5a
vec <- rep(0,18) # vector with 18 zeros

#problem 5b
for (i in seq(1,18)){
  vec[i] <- i * 3
}

#problem 5c
vec1 <- rep(0,18) # vector with 18 zeros
vec1[1] <- 1

for (i in 1:17){
  vec1[i + 1] <- 1 + (2 * vec1[i]) 
}

# problem 6
fib <- rep(0,20) #pre-allocation for fibonacci
fib[2] <- 1

# for loop for fibonacci sequence
for (i in 3:20){
  fib[i] <- fib[i-2] + fib[i-1]
}

# problem 7: see line 29


