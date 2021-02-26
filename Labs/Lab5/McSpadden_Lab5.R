# Lab 5 EBIO 4420 - Loop and conditionals
# Chris McSpadden

# set wd
setwd("~/School/SP21/Computational_Bio_4420/LabsAndHW/Labs/Lab5")

# Problem 1
x <- 22 
threshold <- 5

# for loop tests if x is greater than threshold
if (x > 5){
  print(paste("x is larger than", threshold))  
} else {
  print(paste("x is smaller than or equal to", threshold))
}

# Problem 2a
rawData <- read.csv("ExampleData.csv")
data <- rawData$x # convert dataframe to vector

# for loop changes negatives to NA in data variable
for (i in 1:length(data)){
  if (data[i] < 0){
    data[i] <- NA
  }
}

# Problem 2b
data[is.na(data)] <- NaN # change NA in data to NaN

# Problem 2c
data[which(is.nan(data))] <- 0 # change NaN in data to 0

# Problem 2d
# for loop tests if data is in range 50:100
inRange <- 0
for (i in 1:length(data)){
  if (data[i] >= 50 & data[i] <= 100){
    inRange <- inRange + 1
  }
}

# a better way to write problem 2d
inRangeImproved <- length(which(data >= 50 & data <= 100))

# Problem 2e 
FiftyToOneHundred <- data[which(data >= 50 & data <= 100)] # vector of data in range 50:100

# Problem 2f
write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred.csv") # write the vector to a csv


# Problem 3
CO2Data <- read.csv("CO2_data_cut_paste.csv")

# Problem 3a
FirstYear <- CO2Data$Year[which(CO2Data$Gas != 0)[1]] # find first year gas is not 0

#Problem 3b
CO2Data$Year[which(CO2Data$Total >= 200 & CO2Data$Total <= 300)] # find years where total emissions is btw 200 and 300


#### PART 2 ####

# parameter variables
totalGenerations <- 1000
initPrey <- 100 	# initial prey abundance at time t = 1
initPred <- 10		# initial predator abundance at time t = 1
a <- 0.01 		# attack rate
r <- 0.2 		# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators
t <- 1:totalGenerations #time

n <- rep(NA, totalGenerations) # pre-allocated vector of NAs for n
p <- rep(NA, totalGenerations) # pre-allocated vector of NAs for p
n[1] <- initPrey # set initial value for prey
p[1] <- initPred # set initial value for preditors

# calc Lotka-Volterra model
for (i in 2:totalGenerations){
  n[i] <- n[i-1] + (r * n[i-1]) - (a * n[i-1] * p[i-1])
  p[i] <- p[i-1] + (k * a * n[i-1] * p[i-1]) - (m * p[i-1])
  
  if (n[i] < 0){
    n[i] <- 0
  }
}

#plot results
plot(t,n, xlab = "Time", ylab = "Predator and Prey Abundance", main = "Abundance vs. Time", col = "Green", lty = 1)
lines(t,p, col = "Red", lty = 2)
legend("topright", legend=c("Prey", "Pred"),col=c("Green", "Red"), lty=1:2, cex=0.8) # add legend

# results matrix
myResults <- cbind(t, n, p) #create matrix
colnames(myResults) <- c("TimeStep", "PreyAbundance", "PredatorAbundance") #name columns

#write results to file
write.csv(x = myResults, file = "PredPreyResults.csv")
