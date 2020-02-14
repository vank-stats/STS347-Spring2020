# Question 1 - Read in the data
library(readxl)
bridges <- read_excel("Notes 3 - StatewideBridges.xls")

# Question 2
summary(bridges)
# There are 13,367 bridges and the oldest was built in 1891

# Question 3
hist(bridges$YEARBUILT)
# The 1960s had the most bridges built (followed by the 1950s)

# Question 4
Alamance <- bridges[bridges$COUNTY == "ALAMANCE", ]

nrow(Alamance)
length(Alamance$COUNTY)
# length() gives number of variables for a data frame, so we need to put a
# vector into the function to get number of elements (the 149 bridges)

min(Alamance$YEARBUILT)
# oldest bridge in Alamance was built in 1923

max(Alamance$YEARBUILT)
# most recent Alamance bridge in the data set was built in 2010

table(Alamance$STRUCTURALLYDEFICIENT)
# 26 bridges are labelled as structurally deficient
# the remaining 123 are not structurally deficient