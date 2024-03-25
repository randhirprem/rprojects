# Functions in R

# Functions in R are objects they execute a task.
# Function structure : name <- function(arguement) {statements} .
# The arguements specify the components of the function.

myfirstfn <- function(x) {x+x}
myfirstfn(10)

# Stepwise working functions

mysecondfn <- function(t,z) {
  value = z*3
  value = value*t
  print(value)
}

t=5
z=9
mysecondfn(t,z)

#Loops 
# FOR loops allow a certian operation to be repeated a fixed number of times
# WHILE loops are where the loop fufils requires a logic to start or terminate

#For loop example
for (i in 1:15) {
  print(i)
}

#example of a function inside a loop inside an if-else logic
#PrimVec = function(n){
  #if(n >= 2) {
    #s =(2,n)
    #p = c()
    #for (i in seq(2,n)){
      #if(any(s==i)){
        #p = c(p,i)
        #s = c(s[s%%i] !=0],i)
      #}
    #}
  #return(p)}
  #else{
    #stop("Input at least 2")
  #}
#}
#PrimVec(100)
