# Computational Biology - Independent Project
# Chris McSpadden
# 04/16/2021

setwd("~/School/SP21/Computational_Bio_4420/Independent Project")

#include appropriate libraries
library("dplyr")
library("ggplot2")
library(gplots) 
require(stringr)   

data <- read.csv("Raw_Data.csv", stringsAsFactors = F) #read in raw data
rownames(data) <- make.names(data[,1], unique = T) #set mushroom names as labels rather than a column
data <- data[,-1] #remove col with mushroom names
colnames(data) <- str_replace_all(colnames(data), "[:punct:]", " ") # remove period from column names
rownames(data) <- str_replace_all(rownames(data), "[:punct:]", " ") # remove period from row names

habIdx <- c(5,6,9,10,11,13) #indecies for habitat columns
habitat <- data[habIdx] # subset microhabitat data
habitat <- habitat[-which(rowSums(habitat[,-1]) == 0),] # remove rows with 0 observations

plants <- data[-habIdx] #subset plant species data
plants <- plants[-which(rowSums(plants[,-1]) == 0),] # remove rows with 0 observations


########## calculate and visualize species evenness or SAD #############

SpeciesTotals <- rowSums(data) # total number of observations for each species
Species <- 1:nrow(data) # total number of species

# plot fishers distribution for SAD
FisherSAD <- hist(SpeciesTotals, 
                  breaks = length(SpeciesTotals), 
                  main = "Species Abundance Distribution (Fisher)", 
                  xlab = "Individuals Per Species", 
                  ylab = "Number of Species")



############################# trying out heatmaps ###########################
library(RColorBrewer) # lib for color schemes
coul <- colorRampPalette(brewer.pal(8, "PiYG"))(25) # heatmap color scheme

# Mat <- as.matrix(data) # test matrix with all data
# heatmap(Mat,Colv = NA, Rowv = NA, col = coul, margins=c(10,5)) # heatmap of all data

habitatMat <- as.matrix(habitat) 
heatmap(habitatMat, Colv = NA, Rowv = NA, col= colorRampPalette(brewer.pal(8, "Blues"))(25), margins=c(8,5),  main = "Mushroom Species vs. Habitat" ) # heatmap of all species with microhabitat
# heatmap(habitatMat, scale = "column") #normalized scale

plantMat <- as.matrix(plants)
heatmap(plantMat, Colv = NA , Rowv = NA,col= colorRampPalette(brewer.pal(8, "Greens"))(25), margins=c(10,5), main = "Mushroom Species vs. Tree Species" ) # heatmap of all species with tree/plant species


###### Trying out a new formula for SAD #######
# TotalsByHabitat <- colSums(data) #total number of observations per habitat
# AbundanceByHabitat <- hist(TotalsByHabitat, 
                           breaks = 28)
