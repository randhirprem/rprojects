getwd()

util <- read.csv("P3-Machine-Utilization - P3-Machine-Utilization.csv",stringsAsFactors = T)
head(util, 12)
str(util)
summary(util)
#derive utilisation colum
util$Utilization = 1 - util$Percent.Idle
head(util,12)

#Handling Date-Times in R
tail(util)
?POSIXct
util$PosixTime <- as.POSIXct(util$Timestamp, format="%d/%m/%Y %H:%M")
head(util,12)
summary(util)
#How to re arrange columns in df
util$Timestamp <- NULL
head(util,12)
util <- util[,c(4,1,2,3)]
head(util,12)

#what is a list?

summary(util)
RL1 <- util[util$Machine=="RL1",]
summary(RL1)
RL1$Machine <- factor(RL1$Machine)
summary(RL1)
#Construct list
# Character: Machine Name
# Vector (mean,min,max) Utilization of the month (excluding unkown hrs)
#Logical has utilization ever fallen below 90% T OR F
util_stats_rl1 <- c(min(RL1$Utilization, na.rm = T),
                    mean(RL1$Utilization, na.rm = T),
                    max(RL1$Utilization, na.rm = T))

util_stats_rl1
util_under_90_flag <- length(which(RL1$Utilization < 0.90)) > 0
util_under_90_flag

list_rl1 <- list("RL1", util_stats_rl1, util_under_90_flag)
list_rl1

#Naming Components of a list
names(list_rl1)
names(list_rl1) <- c("Machine", "Stats", "LowThreshold")
list_rl1
# Another way like data frame
rm(list_rl1)
list_rl1 <- list(Machine="RL1", Stats=util_stats_rl1, LowThreshold=util_under_90_flag)
list_rl1

#Extracting components of a list
# Three ways
#[]-will always return a list
#[[]]- will return the actual object within the componet
#$ - same as [[]] but prettier
list_rl1
list_rl1[1]
list_rl1[[1]]
list_rl1$Machine

list_rl1[2]
typeof(list_rl1[2])
list_rl1[[2]]
typeof(list_rl1[[2]])
list_rl1$Stats
typeof(list_rl1$Stats)

list_rl1[3]
typeof(list_rl1[3])
list_rl1[[3]]
typeof(list_rl1[[3]])
list_rl1$LowThreshold
typeof(list_rl1$LowThreshold)

#How would you access the 3rd element of the vector max utilization
list_rl1
list_rl1[[2]][3]
list_rl1$Stats[3]

#Add components into a list & deleting components into a list
list_rl1
list_rl1[4] <- "New Information"
list_rl1
#Another way to add component via $
# we will add vector all hrs utls unkown
list_rl1$UnknownHours <- RL1[is.na(RL1$Utilization),"PosixTime"]
list_rl1
#Remove component from a list, Use NULL method
list_rl1[4] <- NULL
list_rl1
#!! Notice numerations have shifted
list_rl1[4]
#Add Component 
#Data frame for this machine
list_rl1$Data <- RL1
list_rl1
summary(list_rl1)
str(list_rl1)
#Subseting a list -----
list_rl1
#Quick Challenge
list_rl1[[4]][1]
list_rl1$UnknownHours[1]


#Subsetting list
list_rl1
list_rl1[1:2]
list_rl1[c(1,4)]
sublist_rl1 <- list_rl1[c("Machine","Stats")]
sublist_rl1
sublist_rl1[[2]][2]
# double [[]] are not for subsetting
#list_rl1[[1:3]] error

#Building a timeseries polt
#install.packages("ggplot2)
library(ggplot2)

p <- ggplot(data=util)
p + geom_line(aes(x=PosixTime, y=Utilization,
                  colour=Machine),size=1.2) +
  facet_grid(Machine~.) + 
  geom_hline(yintercept = 0.90,
             colour="Gray", size=1.2,
             linetype=3)

myplot <- p + geom_line(aes(x=PosixTime, y=Utilization,
                            colour=Machine),size=1.2) +
  facet_grid(Machine~.) + 
  geom_hline(yintercept = 0.90,
             colour="Gray", size=1.2,
             linetype=3)

list_rl1$Plot <- myplot
list_rl1
summary(list_rl1)
