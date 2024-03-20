getwd()
setwd("./Weather Data")
getwd()
#read data
Chicago <- read.csv("Chicago-C.csv", row.names = 1,stringsAsFactors = T)
NewYork <- read.csv("NewYork-C.csv", row.names = 1,stringsAsFactors = T)
Houston <- read.csv("Houston-C.csv", row.names = 1,stringsAsFactors = T)
SanFrancisco <- read.csv("SanFrancisco-C.csv", row.names = 1,stringsAsFactors = T)
#Check all Cities
Chicago
NewYork
Houston
SanFrancisco
#these are dataframe
is.data.frame(Chicago)
#convert to matrices
Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)
#Check
is.matrix(Chicago)
#List
Weather <- list(Chicago=Chicago,NewYork=NewYork, Houston=Houston, SanFrancisco=SanFrancisco)
Weather
#lets try out
Weather[3]
Weather[[3]]
Weather$Houston
# Using Apply
?apply
Chicago
apply(Chicago, 1, mean)
#check
mean(Chicago["DaysWithPrecip",])
#analyze one city
Chicago
apply(Chicago, 1, max)
apply(Chicago, 1, min)
#for practice dont make sense exercise
apply(Chicago, 2, max)
apply(Chicago, 2, min)

#compare
apply(Chicago, 1, mean)
apply(NewYork, 1, mean)
apply(Houston, 1, mean)
apply(SanFrancisco, 1, mean)
                          #Deliverable 1 but there is a faster way
#Recreate apply Function With LOOPS.
Chicago
#find mean of every row
#1. loops
output <- NULL #preparing empty vector
for(i in 1:5){ #run cycle of the loop
 output[i] <- mean(Chicago[i,]) 
}
output #Check
names(output) <- rownames(Chicago)
output
#2. via apply function
apply(Chicago, 1, mean)

#Using lapply()
?lapply
Chicago
t(Chicago)
Weather

lapply(Weather, t) # t(weather$chicago), t(weather$NewYork)...t(SanFrancisco)
mynewlist <- lapply(Weather, t)
mynewlist
#example 2
Chicago
rbind(Chicago, NewRow=1:12)
lapply(Weather, rbind, NewRow=1:12)
#example 3
?rowMeans 
rowMeans(Chicago)#identical to:apply(Chicago, 1,mean)
lapply(Weather, rowMeans)
#Deliverable 1 but there is a faster way
#colMeans
#rowSums
#colSums

#combing lapply with the [] operator.
Weather
Weather[[1]][1,1]
Weather$Chicago[1,1] #Weather$Chicago[1,1], Weather$NewYork[1,1].....
lapply(Weather, "[",1,1)
Weather
lapply(Weather,"[",1, )
Weather
lapply(Weather,"[", ,3)
#ADDING YOUR OWN FUNCTION
lapply(Weather, rowMeans)
lapply(Weather, function(x) x[1,] )
lapply(Weather, function(x) x[5,] )
lapply(Weather, function(x) x[,12] )
Weather
lapply(Weather, function(z) z[1,] - z[2,] )
lapply(Weather, function(z) round((z[1,] - z[2,])/z[2,],2))
# this is the deliverable to temperature flux will improve
#using sapply
?sapply
Weather
#Average high temp July
lapply(Weather, "[", 1,7)
sapply(Weather, "[", 1,7)
#Average High Temp last quarter
lapply(Weather,"[", 1,10:12)
sapply(Weather,"[", 1,10:12)
#Another example
lapply(Weather, rowMeans)
sapply(Weather, rowMeans)
round(sapply(Weather, rowMeans),2)#deliverable 1
#another example
sapply(Weather, function(z) round((z[1,] - z[2,])/z[2,],2))#deliverable 2
#By the way
sapply(Weather, rowMeans, simplify = F) #SAME AS LAPPLY
#Nesting Apply Functions
Weather
lapply(Weather, rowMeans)
Chicago
apply(Chicago,1,max)
#apply across whole list
lapply(Weather, apply, 1, max) # faster
lapply(Weather, function(x) apply(x,1,max)) # alternative
#tidy
sapply(Weather, apply, 1, max) #deliverable 3
sapply(Weather, apply, 1, min) #deliverable 4

#which.max 
?which.max
which.max(Chicago[1,])
names(which.max(Chicago[1,]))
#With APPLY
#with lapply & sapply
apply(Chicago,1,function(x)names(which.max(x)))
lapply(Weather,function(y)apply(y,1,function(x)names(which.max(x))))
sapply(Weather,function(y)apply(y,1,function(x)names(which.max(x))))
sapply(Weather,function(y)apply(y,1,function(x)names(which.min(x))))
