# Question 1 - Read in the data
library(readxl)
bison <- read_excel("Notes 3 - bison.xlsx")

# Question 2
bison$`Northern herd spring calf ratio`
# R puts the name in slanted quotes `` (under esc key) if it has spaces

# Question 3
names(bison) <- c("year", "nh_scr", "ch_scr", "pdsi", "nh_SWEacc", "ch_SWEacc",
                  "nh_bison", "ch_bison", "elk")
# We are assigning the vector on the left to be the names of the bison data

# Question 4
# a
summary(bison)
summary(bison$elk)
# Either option above works, the mean elk herd in the data is 12,822 big

#b - There are 15 NA's (or missing values) in the elk data

# c
mean(bison$elk)
# This gives a response of NA

# d
mean(bison$elk, na.rm = TRUE)
# The mean function doesn't remove NA's by default unless we add na.rm = TRUE

# e
length(bison$elk)
# There are 36 values in the elk variable

# f
bison$elk
# There are 15 missing values (as mentioned before), so there aren't really
# 15 observations.

# g
length(bison$elk) - sum(is.na(bison$elk))
sum(!is.na(bison$elk))
# This is two ways to determine the number of non-missing values. There are
# likely others too

# h
plot(bison$nh_bison, bison$elk)
# There is a positive relationship between the variables and likely a moderate
# to strong correlation.

# i
cor(bison$nh_bison, bison$elk, use = "complete.obs")
# The correlation (after figuring out how to remove NA's from the calculation)
# is 0.729