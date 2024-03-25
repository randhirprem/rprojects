## working with dataframe
?airmiles

head(airmiles)
tail(airmiles)
summary(airmiles)

?mtcars
summary(mtcars)
plot(mtcars)
hist(airmiles)
head(mtcars)
sum(mtcars$wt)
attach(mtcars)
sum(wt)
detach(mtcars)

mtcars[2,6]
mtcars[c(2,5,8),6]
