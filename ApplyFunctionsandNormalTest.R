#getwd()
#read.csv("SearchResults.csv")

#The Apply family of functions
?apply

x = matrix(c(1:9), nr=3, byrow=T)

apply(x,1,mean) # row mean
apply(x,2,mean) # column mean
apply(x,1,plot) # even graphics function

#Tapply apply by susetting a vector
?tapply
#Tapply factor given by an index 
tapply(1:4,c(3,3,3,3),sum,simplify = F)

#exercise test for normality
head(diamonds)
attach(diamonds)

qqnorm(depth)
hist(depth)

depthsmall = sample(depth,5000)
shapiro.test(depthsmall) # shapiro wilk test requires 5000 smaples maximum

library(nortest)
cvm.test(depth)

lillie.test(depth)# kolmogrov smirnov
sf.test(depthsmall) #shapiro francia
pearson.test(depth) # pearson normality test
