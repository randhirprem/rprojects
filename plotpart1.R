getwd()
setwd("/Users/randhirprem/Desktop/r-projects-advance")
getwd()
#Data Visulaisation 

#The following visualistation is based on R-base

x <- 5:7
y <- 8:10

#scatterplot
plot(x,y)

#this is a time series, default here is a line plot
plot(lynx)


# example of oa plot with title colour, title magnification
plot(lynx, main="Lynx Trappings", col="red", col.main=52, cex.main=1.5)

#label names
plot(lynx,ylab= "Lynx Trappings", xlab="")

plot(lynx,ylab= "Lynx Trappings", xlab="", las=2)

#las - 0:3, scale oreientation
par(mfrow=c(2,2), col.axis="red")

plot(1:8, las=0 , xlab="xlab", ylab="ylab", main="LAS = 0")
plot(1:8, las=1 , xlab="xlab", ylab="ylab", main="LAS = 1")
plot(1:8, las=2 , xlab="xlab", ylab="ylab", main="LAS = 2")
plot(1:8, las=3 , xlab="xlab", ylab="ylab", main="LAS = 3")

#COLOUR MANIPULATION
colors()
 ?pch

x=2:4
plot(x,pch="c")
plot(x,pch=13)

#line types"
par(mfrow=c(1,1),col.axis="black")
library(plotrix)
plot(1:7, ylab="", main"Line Types lty 0:6", xlab="lty 0:6")

ablineclip(v=1, lty=1, col"sienna2", lwd=2)












