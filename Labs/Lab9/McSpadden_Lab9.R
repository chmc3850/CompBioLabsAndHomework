# Computational Bio Lab 9 - Parsing data files
# Chris McSpadden
# 03/19/2021

library(lubridate)
# import data
camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)

# test code for extracting dates
oneDate <- camData$DateTime[2]
x <- strptime(oneDate, format = "%d/%m/%Y %H:%M", tz = "")
format(x,"%d-%m-%Y %H:%M")
year(x) <- 0015
if (year(x) < 2000){
  year(x) <- year(x) + 2000
}

### Problem 1 ####
# convert dates from strings to time
rawDates <- strptime(camData$DateTime, format = "%d/%m/%Y %H:%M", tz = "")
# strings <- format(rawDates,"%d-%m-%Y %H:%M") #properly formatted dates as strings

### Problems 2 and 3 ###
# loop through dates and add 2000 to each 2-digit year
for (i in 1:length(rawDates)){
  # find incorrect dates
  if (year(rawDates[i]) < 2000){
    # add 2000 to incorrect dates
    year(rawDates[i]) <- year(rawDates[i]) + 2000
  }
}

### Problem 4 ###

#this function takes season, station and species inputs and returns the avg time btw observations for those inputs
calcAvgTime <- function(season, station, species){
  idx <- which(camData$Season == season & camData$Station == station & camData$Species == species) # extract indicies that correspond to input
  
  times <- rep(NA,length(idx))
  # loop through all appropriate indecies and calc difftime
  for (i in 1:length(idx)){
    times <- c(times,difftime(rawDates[idx[i+1]], rawDates[idx[i]], units =     "days"))
  }
  times <- abs(times) # vector of each time difference
  avgTime <- mean(times, na.rm = TRUE) # avg time difference
  return(avgTime)
}

# test case for function
season <- "D" 
station <- "1"
species <- "Giraffe"
calcAvgTime(season,station, species)
