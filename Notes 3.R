# Read in Example data (used Import Dataset menu - From Text (readr))
library(readr)
spring2020 <- read_delim("Notes 3 - Course Data.txt", 
                                  "\t", escape_double = FALSE, comment = "#", 
                                  trim_ws = TRUE)
is.data.frame(spring2020)

# Read in Notes 3 - Temperature Anomalies

temps <- read_csv("Notes 3 - Temperature Anomalies.txt")
# The default options worked well here so read_csv() function only includes
# file name. Your file path may look different if the data is in a different
# folder than where your R Script is.


# Read in Notes 3 - bison

library(readxl)
bison <- read_excel("Notes 3 - bison.xlsx")


# Example 1 - Three ways to calculate the median
x <- seq(1, 10)
median(x)
quantile(x, 0.5)
mean(x, trim = 0.5)

# Example 2 - Two ways to calculate Q1
x <- 1:10
out <- summary(x)
out[2]
quantile(x, 0.25)


# Subsetting, Sorting, and Organizing with ChickWeight data

data(ChickWeight)

# Stores first 12 rows in chick1
chick1 <- ChickWeight[1:12, ] 

# Stores all rows where Chick = 2 in chick2
chick2 <- ChickWeight[ChickWeight$Chick == 2, ] 

# Stores all rows where Chick = 3 in chick3 (using dplyr library)
library(dplyr)
chick3 <- filter(ChickWeight, Chick == 3)


# Example using ChickWeight

library(dplyr) # don't need this if you already loaded it
exercise <- filter(ChickWeight, Time == 0, Diet == 1) # step (i)
exercise <- arrange(exercise, weight) # step (ii)
exercise <- rename(exercise, time = Time, chick = Chick, diet = Diet) #step(iii)
exercise[1, ] # step (iv) - chick 18 is lightest in this data set


# Example using bridges data

library(readxl)
bridges <- read_excel("Notes 3 - StatewideBridges.xls")

Alamance <- filter(bridges, COUNTY == "ALAMANCE")

mycounties <- c("ALAMANCE", "GUILFORD")
AG <- filter(bridges, COUNTY %in% mycounties)

AG$age <- 2020 - AG$YEARBUILT # base R solution
AG <- mutate(AG, age = 2020 - YEARBUILT) # tidyverse solution using dplyr

AG <- arrange(AG, desc(age))
AG[1,] # oldest bridge was built in 1923


# Tedious ways to find means of groups
diet1 <- filter(ChickWeight, Diet == 1)
diet2 <- filter(ChickWeight, Diet == 2)
diet3 <- filter(ChickWeight, Diet == 3)
diet4 <- filter(ChickWeight, Diet == 4)
mean(diet1$weight)
mean(diet2$weight)
mean(diet3$weight)
mean(diet4$weight)

# Base R way to find means of groups
aggregate(weight ~ Diet, data = ChickWeight, FUN = "mean")

# Tidyverse way to find means of groups
summarize(group_by(ChickWeight, Diet), mean(weight))


# Average ages using AG bridges data
aggregate(age ~ COUNTY, data = AG, FUN = "mean")
summarize(group_by(AG, COUNTY), mean(age))

