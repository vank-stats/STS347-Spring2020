# Question 1
# x contains 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, and 50
# xm will store the mean of x (which happens to be 8.75)
x <- c(0:10, 50)
xm <- mean(x)
mean(x, trim = .1)
xm

# Question 2
# The trim argument will "trim" that proportion of the data from the top and
# bottom of our vector (e.g. trim = 0.1 mean remove 10% of data from the top
# and 10% of data from the bottom)
?mean

# Question 3
# The rm() function removes that object from our environment. To get the object
# back we can re-run the code that created the object
x <- 1:5
rm(x)

# Question 4
# This line puts the data set ChickWeight into our environment
data(ChickWeight)

# This line prints the ChickWeight data set in the console
ChickWeight

# This line opens a popup to view the data in the source pane
View(ChickWeight)

# This line opens a help file for the data set to see what variables are etc.
?ChickWeight

# This code loads a package called graphics and creates separate scatterplots
# for each chick showing their weight over time
require(graphics)
coplot(weight ~ Time | Chick, data = ChickWeight,
       type = "b", show.given = FALSE)