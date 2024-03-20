getwd()
setwd("/Users/randhirprem/Desktop/r-projects-advance")
getwd()

fin <- read.csv("P3-Future-500-The-Dataset - P3-Future-500-The-Dataset.csv", 
                stringsAsFactors = T, na.strings = c(""))
fin
head(fin)
tail(fin, 10)
str(fin)
summary(fin)


#CHANGING FROM NON-FACTOR TO FACTOR--------------------------------------------
fin$ID <- factor(fin$ID)
summary(fin)
str(fin)

fin$Inception <- factor(fin$Inception)
str(fin)
summary(fin)


#factor variable trap----------------------------------------------------------
#conversion for character
a <- c("12","13", "14", "12", "12")
a
typeof(a)
b <- as.numeric(a)
b
typeof(b)
#Converting into Numerics for Factor:
z <- factor(c("12","13", "14", "12", "12"))
z
typeof(z)
# z type is interger and they are 1,2,3 as a category of values of z 
# factorisation integer and 3 levels
#this is check by doing this
y <- as.numeric(z)
y
typeof(y)
#you can see y now is a double 1 2 3 1 1 the pattern of the values of z
#-----------------------
#correct:
x <- as.numeric(as.character(z))
typeof(x)

#FVT EXAMPLE -------------------------------
head(fin)
str(fin)
#fin$Profit <- factor(fin$Profit)

head(fin)
str(fin)

summary(fin)

#sub() and gsub()
fin$Expenses <- gsub(" Dollars","",fin$Expenses)
head(fin)
fin$Expenses <- gsub(",","",fin$Expenses)
head(fin)
str(fin)
# note that fin$Expenses is now a chr variable

fin$Revenue <- gsub("\\$","",fin$Revenue)
head(fin)
#the $ is removed

fin$Revenue <- gsub(",","",fin$Revenue)
head(fin)
str(fin)
# note that fin$Revenue is now a chr variable

#for growth
fin$Growth <- gsub("%","",fin$Growth)
head(fin)
str(fin)

fin$Expenses <- as.numeric(fin$Expenses)
fin$Revenue <- as.numeric(fin$Revenue)
fin$Profit <- as.numeric(fin$Profit)
fin$Growth <- as.numeric(fin$Growth)
str(fin)

summary(fin)
#-------------- what is NA?
?NA
#--------------------Locate Missing Data---------------------------------------

head(fin,24)
complete.cases(fin)
fin[!complete.cases(fin),]

#filtering with non missing data------------------------------------------------
head(fin)
fin[fin$Revenue == 9746272,]
which(fin$Revenue == 9746272)
fin[which(fin$Revenue == 9746272),]

head(fin)
fin[fin$Employees == 45,]
fin[which(fin$Employees == 45),]

#filtering using is.na() for missing data -------------------------------------
head(fin,24)

?is.na()
#example
a <- c(1,24,543,NA,76,45,NA)
is.na(a)
#in case
is.na(fin$Expenses)
fin[is.na(fin$Expenses),]
#in case for missing state columns with NA
fin[is.na(fin$State),]

#Removing records with missing data -------------------------------------------
#in case we remove industry columns with NA , year with NA we keep-------------
# Step 1 Create a back up
fin_backup <- fin

#Step 2 Find Rows with empty values
fin[!complete.cases(fin),]

#Step 3 Find the NA in industry column with filter
fin[is.na(fin$Industry),]

#step 4 which row is not empty in industry column
fin[!is.na(fin$Industry),]

#step 5 assign it back to fin as a subset
fin <- fin[!is.na(fin$Industry),]

#step 6 check not complete cases
fin[!complete.cases(fin),]

#Resetting the data frame index ------------------------------------------------
fin
rownames(fin) <- 1:nrow(fin)
fin
#Alternative--------
#fin
#rownames(fin) <- NULL
#fin

#Replace missing data: Factual Analysis
fin[!complete.cases(fin),]
fin[is.na(fin$State),]
fin[is.na(fin$State) & fin$City=="New York",]
fin[is.na(fin$State) & fin$City=="New York","State"] <- "NY"
#Check
fin[c(11,377),]

fin[!complete.cases(fin),]
fin[is.na(fin$State),]
fin[is.na(fin$State) & fin$City=="San Francisco",]
fin[is.na(fin$State) & fin$City=="San Francisco","State"] <- "CA"
fin[c(82,265),]

#Replacing with median -------------------------------------------------------

med_empl_retail <- median(fin[fin$Industry == "Retail","Employees"],na.rm = TRUE)
#Check mean
mean(fin[,"Employees"],na.rm = TRUE) #across all industries
mean(fin[fin$Industry == "Retail","Employees"],na.rm = TRUE) # across retail
# Filter creation for future input
fin[is.na(fin$Employees) & fin$Industry == "Retail",]
# add the median info to the missing retail employee number
fin[is.na(fin$Employees) & fin$Industry == "Retail","Employees"] <- med_empl_retail
#check:
fin[3,]

#For missing infor in financal services
med_empl_financial_services <- median(fin[fin$Industry == "Financial Services","Employees"],na.rm = T)
fin[is.na(fin$Employees) & fin$Industry == "Financial Services","Employees"] <- med_empl_financial_services
fin[330,]

fin[!complete.cases(fin),]
#------Growth Column-----------------------------------------------------------
fin[!complete.cases(fin),]

med_growth_constr <- median(fin[fin$Industry=="Construction","Growth"], na.rm=T)
fin[is.na(fin$Growth)& fin$Industry=="Construction","Growth"] <- med_growth_constr
fin[8,]

fin[!complete.cases(fin),]
#------------------Mini Exercise -------------------------------------
#revenue
med_rev_constr <- median(fin[fin$Industry=="Construction","Revenue"],na.rm=T)
fin[is.na(fin$Revenue)&fin$Industry=="Construction",]
fin[is.na(fin$Revenue)&fin$Industry=="Construction","Revenue"] <- med_rev_constr
fin[!complete.cases(fin),]

#Expenses
#Careful dont add the expense to the IT industry
med_exp_constr <- median(fin[fin$Industry=="Construction","Expenses"],na.rm=T)
fin[is.na(fin$Expenses)&fin$Industry=="Construction"& is.na(fin$Profit),]
fin[is.na(fin$Expenses)&fin$Industry=="Construction","Expenses"] <- med_exp_constr
fin[!complete.cases(fin),]

#Replace Missing DATA: derived values
#Revenue - Expenses = Profit
#Expenses = Revenue - Profit
fin[is.na(fin$Profit),"Profit"] <- fin[is.na(fin$Profit),"Revenue"] - fin[is.na(fin$Profit),"Expenses"]
fin[c(8,42),]

fin[!complete.cases(fin),]
fin[is.na(fin$Expenses),"Expenses"] <- fin[is.na(fin$Expenses),"Revenue"] - fin[is.na(fin$Expenses),"Profit"]
fin[c(15),]
fin[!complete.cases(fin),]

#Visualisation
#install.package("ggplot2")
library(ggplot2)
#A Scatterplot clasified by industry showing revenue, expense & profit
p <- ggplot(data=fin)
p
p + geom_point(aes(x=Revenue, y=Expenses,
                   colour=Industry, size=Profit))

#A Scatterplot that includes industry trends for the expense-revenue relationship
d <- ggplot(data=fin,aes(x=Revenue, y=Expenses,
                         colour=Industry))
d + geom_point()+
  geom_smooth(fill=NA, size=1.2)

#Boxplots showing growth by Industry
f<- ggplot(data=fin, aes(x=Industry, y=Growth, 
                         colour=Industry))
f + geom_boxplot(size=1)
# Extra
f + geom_jitter() + geom_boxplot(size=1, alpha=0.5, outlier.colour = NA)
