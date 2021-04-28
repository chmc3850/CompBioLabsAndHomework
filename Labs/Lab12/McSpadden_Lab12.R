# Chris McSpadden
# 04/09/2021
# Compuatational Bio

#### Much of this code has been adapated from class ####
# Working with some data from the Colorado Department of Public Health
# and Environment (CDPHE) on COVID-19 in Colorado.

#include appropriate libs
library("dplyr")
library("ggplot2")

# Change the next line to work for YOUR OWN computer:
setwd("/Users/chris/OneDrive/Documents/School/SP21/Computational_Bio_4420/compBioSandbox/CompBio_on_git/Datasets/COVID-19/CDPHE_Data/CDPHE_Data_Portal")

stateStatsData <- read.csv("DailyStateStats2/CDPHE_COVID19_Daily_State_Statistics_2_2021-04-02.csv", 
                           stringsAsFactors = F)
colnames(stateStatsData)[1] <- "Name"


####################################################
## Explore the data
####################################################
# here are some suggestions for simple exploration , but please use your own ideas!
names(stateStatsData) 
str(stateStatsData)
summary(stateStatsData)
unique(stateStatsData$Name)
unique(stateStatsData$Desc_)
table(stateStatsData$Name)


##################################################################
##  Tasks
##################################################################

# try to figure out ways to do all of the following using functions 
# from the Tidyverse

# 1. subset the data so that we only keep the rows where the text in the column (variable) named "Name" is "Colorado"
ColoradoData <- filter(stateStatsData, Name == "Colorado")
# 2. subset to keep only the columns "Date", "Cases", and "Deaths"
substateStats <-stateStatsData %>%
  select("Date", "Cases", "Deaths")
# 3. change the data in the "Date" column to be actual dates rather than a character
stateStatsData$Date <- strptime(stateStatsData$Date, format = "%m/%d/%Y", tz = "")
# 4. sort the data so that the rows are in order by date from earliest to latest
new <- substateStats %>% 
  arrange(Date)
# 5. subset the data so that we only have dates prior to May 15th, 2020
dt <- as.POSIXlt("2020-05-15")
index <- which(as.Date(stateStatsData$Date) < dt)
priorDates <- stateStatsData[index , ]



#### Part 1: doing it all in one pipeline with pipes ####
ColoradoData <- stateStatsData %>%
  filter( Name == "Colorado") %>%
  select(Date, Cases, Deaths) %>%
  mutate( Date = strptime( Date, format = "%m/%d/%Y", tz = "") ) %>%
  arrange( Date ) %>%
  filter( Date < as.POSIXlt("2020-05-15") ) # dt defined above


#### Part 2 Plotting the data ####
CasesPlot <- ggplot(ColoradoData, aes(x = as.Date(Date), y = Cases))+
  scale_y_continuous(trans='log10') +
  geom_line() + xlab("Date")
CasesPlot

p2 <- ggplot(ColoradoData, aes(x = as.Date(Date), y = Deaths))+
  scale_y_continuous(trans='log10') +
  geom_line() + xlab("Date")
p2


#### Part 3 Add doubling times ####
addDoublingTimeRefLines <- function( myPlot, doublingTimeVec, someKindOfData, startFrom ) {
  
}

# Rescale x-axis: make x-axis days since number of cases
#ColoradoData$DaysSince <- as.integer(ColoradoData$Date - ColoradoData$Date[1])
ColoradoData$DaysSince <- as.integer(julian(ColoradoData$Date, origin = min(ColoradoData$Date)))

nInit <- ColoradoData$Cases[1] #initial number of cases 
CasesPlot <- ggplot(ColoradoData, aes(x = DaysSince, y = Cases))+
  scale_y_continuous(trans='log10') +
  geom_line() + 
  xlab(paste("Days since case", nInit))

CasesPlot


# add ref lines
doubTime <- 3 # days
timePoints <- seq(0, max(ColoradoData$DaysSince), doubTime)
nDoublings <- 0:(length(timePoints) - 1)
doubRefNums <- 2^(nDoublings) * nInit
refData <- data.frame(timePoints, doubRefNums)

CasesPlot + geom_line(data = refData, aes(x = timePoints, y = doubRefNums), linetype = "dashed", color = "gray")

# add text to label each ref line



