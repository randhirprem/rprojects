getwd()
setwd("/Users/randhirprem/Desktop/r-projects-advance")
getwd()
#basics
4 + 4 + 5

#basic operators + - * / ^ ----- with e.g
(5-3)^3 # - equals to 8
(7*2)^6 # - equals to 7529536

#Creating Objects --- with e.g
x <- c(4,5,6) # ---- this is a vector of x
c(4,5.2,76) -> y # this also works please se direction of <- 
#Check the types that x fulfills basic is double i.e float
#--------------- Check (x) -------
typeof(x)
is.vector(x)
is.matrix(x)
is.data.frame(x)
is.array(x)
is.list(x)
#-------------- Check (y) --------
typeof(y)
is.vector(y)
is.matrix(y)
is.data.frame(y)
is.array(y)
is.list(y)

#-----------Asigning function ---------
assign("z", c(4.2,1,5)) # function assign

# c(x,y,z) for concatenate
# ls() & objects() - see objects already created
ls()
objects()

# Removing Object
rm(z)
#rm("z") - alternative
#- z has been removed
#check--
ls()
objects()

#Exercise, remove x and create a vector new x vector that is (y,5,y)
x <- c(y,5,y)
x
# find the sum and sqrt of x
sum(x)
sqrt(x)
mean(x)
min(x)
max(x)
#to find a given position in the vector
x[1] # 4
x[2] # 5.2
x[1:4] # 4.0  5.2 76.0  5.0

#Logical test are the components of vector x < 5 store it in a new object
newobject <- x < 5 ; newobject

# Type of brackets
# () - standart round bracket
# [] - box for index
# {} - for function

#Basic functions----------

#Sequence
?seq
seq()
# simple sequence from 3 to 5
seq(3,5)
seq(from = 3, to = 5)
seq(from=3, length=3)
#step manipulation
seq(3,5,0.5)
seq(from=3, length=5, by=0.5)
seq(from=3,by=0.5, length=5)

#Paste
?paste
paste(1:4)
class(paste(1:4)) # check class of paste is character
paste("xyz",1:10)
paste("xyz",c(2,5,7,"test",4.5)) # random vector type string
paste("xyz", 1:10, sep= "")# modifying space

#Replicate
?rep
rep(c(3,4,5),3)
rep(1:10, times=3)
rep(1:10,3)
#example create a vector called z with 1,2,3 repeat it 3 times and replicate the entire value by 3 times
z <- c(1,2,3)
z
rep(z, each=3) # using each
rep(z, each=3, times=3) # combining the arguement

# Working with index positions
a <- 4:20
a
#find out which position the value 10 is at
which(a == 10) # returns position 7
a[3] # returns value of postion 3 which is 6

#------------------------------------Test--------------------------------------

# 1. Create and object "myobject" and assign the values 1:10 in 3 different ways
myobject <- 1:10
rm(myobject)
myobject <- (1:10)
rm(myobject)
myobject <- c(1,2,3,4,5,6,7,8,9,10)
rm(myobject)
assign("myobject", 1:10)
# 2. get the sum of the object
sum(myobject)

# 3. create the following vector by using the paste function 
# " R is great 4 and I will love it"
# " R is great 7 and I will love it"
# " R is great 45 and I will love it"
paste("R is great", c(4,7,45), "and I will love it")
# 4. vector of 1,2,3 : repeat the vector to get 11 x 1, 10 x 2 and 10 x 3
b <- rep(1:3, length=31);b
# 5. What is the value of this vector in position 7
b[7]
