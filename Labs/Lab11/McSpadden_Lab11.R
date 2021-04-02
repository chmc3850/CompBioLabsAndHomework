# Lab 11 - Computational Biology 
# data filtering, subsetting, summarizing, and plotting
# Chris McSpadden
# 04/02/21

#include appropriate libraries
library("dplyr")
library("ggplot2")

#import data
data <- read.csv("GlobalWoodDensityDatabase.csv", stringsAsFactors = F)

#rename some columns
colnames(data)[1] <- "Number"
colnames(data)[4] <- "Density"
colnames(data)[6] <- "Reference"

# remove na row
data <- data[-which(is.na(data$Density)),]

# collapse multiple species into one species with mean density for each
condensed_data <- summarize(group_by(data, Binomial, Family), Density = mean(Density))

# create new data frame with mean density for each family
fam_density <- summarize(group_by(condensed_data, Family), MeanDensity = mean(Density))

# sort data by mean density
sorted_density <- arrange(fam_density, MeanDensity)

#find family of highest and lowest 8 densities
lowest_density <- head(sorted_density, 8)
highest_density <- tail(sorted_density, 8)

#subset data with all data from highest and lowest density families
keepRowsLow <- (condensed_data$Family %in% lowest_density$Family)
low_fam_data <- condensed_data[keepRowsLow,]

keepRowsHigh <- (condensed_data$Family %in% highest_density$Family)
high_fam_data <- condensed_data[keepRowsHigh,]

# plot lowest density fams
p1 <- ggplot(low_fam_data, aes(y = Density)) + 
  geom_boxplot() + facet_wrap(facets = ~Family, scale="free") +
  labs(title = "Families with Lowest Mean Density", y = "Density (g/cm^3)")
p1

# plot highest density fams
p2 <- ggplot(high_fam_data, aes(y = Density)) + 
  geom_boxplot() + facet_wrap(facets = ~Family, scale="free") +
  labs(title = "Families with Highest Mean Density", y = "Density (g/cm^3)")
p2

#plot low density with flipped format
p3 <- ggplot(low_fam_data, aes(Family, Density)) +
  geom_boxplot() +
  coord_flip() +
  labs(title = "Families with Lowest Mean Density", y = "Density (g/cm^3)", x = "Family")
p3

#plot high density with flipped format
p4 <- ggplot(high_fam_data, aes(Family, Density)) +
  geom_boxplot() +
  coord_flip() +
  labs(title = "Families with Highest Mean Density", y = "Density (g/cm^3)", x = "Family")
p4
