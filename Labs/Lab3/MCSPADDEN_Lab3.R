# Chris McSpadden
# EBIO 4420 Lab 3
# 02/05/2021

#lab step #3 - number of chip bags
chips <- 5

#lab step #3 - number of guests attending
guests <- 8

#lab step #5 - how many bags each guest will eat
avgConsumption <- 0.4

# how many bags will be left at the end
chipsRemaining <- 5 - ((guests + 1) * avgConsumption)

# self ranking of each star wars episode
self <- c(7,9,8,1,2,3,4,6,5)

# Penny's ranking of each star wars episode
penny <- c(5,9,8,3,1,2,4,7,6)

# Lenny's ranking of each star wars episode
lenny <- c(6,5,4,9,8,7,3,2,1)

# Stewie's ranking of each star wars episode
stewie <- c(1,9,5,6,8,7,2,3,4)

# Penny's rank for episode IV
PennyIV <- penny[4]

# Lenny's rank for episode IV
LennyIV <- lenny[4]

# everyones rankings
everyone <- cbind(self,penny,lenny, stewie)

str(PennyIV, penny, everyone)
# this str function returns "num 3"

# putting ranking vectors into a dataframe in two ways
everyoneDF1 <- data.frame(everyone)
everyoneDF2 <- data.frame(everyone)

typeof(everyone)
typeof(everyoneDF1)
# lab step #13: the DF and vectors are the same in terms of dimensions; the vector is stored as numbers while the DF is stored as obs of variables; the vector contains doubles while the DF contains lists

# Vector of episode names
episodeNames <- c("I","II","III","IV","V","VI","VII","VIII","IX")

#name rows of ranking vector
row.names(everyone) <- episodeNames

#name rows of ranking DF
row.names(everyoneDF1) <- episodeNames

#access third row
everyone[3,]

#access fourth column of DF
everyoneDF1[,4]

# my rank of episode 5
self[5]

#penny's rank of episode 2
penny[2]

#everyones rank for episodes 4-6
everyone[4:6,]

# everyones rank for 2,5,7
everyone[c(2,5,7),]

# penny and Stewie ranking for 4 and 6
everyone[c(4,6),c(2,4)]

# switch lenny's ranks for 2 and 5
lennyII <- everyone[2,3]
everyone[2,3] = everyone[5,3]
everyone[5,3] = lennyII

#indexing with names instead of numbers
everyone["III","penny"]
everyoneDF1["I",'self']

# switch back lenny's ranks for 2 and 5 using names
lennyII <- everyone["II","lenny"]
everyone["II","lenny"] = everyone["VI","lenny"]
everyone["VI","lenny"] = lennyII

# re-do Lenny's switch with DF
lennyIIDF <- everyoneDF1$lenny[2]
everyoneDF1$lenny[2] = everyoneDF1$lenny[5]
everyoneDF1$lenny[5]= lennyIIDF
