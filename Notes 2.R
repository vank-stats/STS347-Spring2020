# Data structure examples on p. 1

f <- 3
state <- "North Carolina"
logic <- 1 < 2

# Showed that true has to be capitalized for logical elements

replogic <- rep(true, 10)
replogic <- rep(TRUE, 10)
replogic

# Tested what type of element state and f were

is.numeric(state)
is.numeric(f)



# Example 1

a <- c(4, 8, 15, 16, 23, 42)
b <- seq(5, 10, 1)

a[3] # prints third element of a
a[3:6] # prints third-sixth elements of a
b[2] # prints second element of b
a[1] <- 8 # assigns 8 to the first element of a
subset <- a[3:6] # assigns third-sixth elements of a to subset
a[c(1, 3, 4)] # prints first, third, and fourth elements of a

# Next three lines are all ways to print the numbers three through ten
c(3:10)
3:10
seq(3, 10)

seq(3, 10, 2) # counts by twos from 3 up to 9 (stopping at 10)
a[-3] # prints a without the third element
x <- rep(4, 10) # assigns a vector of ten number 4s to x




# Example 2

cells <- c(1, 26, 24, 68) # Need to run this from above

# assign values of cells to 2x2 mymatrix by columns
mymatrix <- matrix(cells, nrow = 2, ncol = 2, byrow = FALSE)

dim(mymatrix) # verify the dimensions of my matrix (2 x 2)

# Create a 5 x 2 matrix called y that contains values 1-10 by columns
y <- matrix(1:10, ncol = 2) 
y

# Create a 2 x 5 matrix called w that contains values 1-10 by columns
w <- matrix(1:10, nrow = 2)
w

w[2, 4] # print element in 2nd row and 4th column of w
y[, 2] # print all elements in 2nd column of y
y[2, ] # print all elements in 2nd row of y
w[1, c(4, 5)] # print 4th and 5th elements in first row of w
z <- matrix(rep(10, 9), 3, 3) # create 3x3 matrix called z with 10 in every cell

# Possible solution for h
q <- matrix(10:18, nrow = 3)

y[2:3, ] # print the 2nd and 3rd rows of y
y[c(2, 3, 5), 2] # print the 2nd, 3rd, and 5th elements in the 2nd column of y





# Example 3

data(sleep) # load sleep data set into our environment
View(sleep) # view pop up window of the sleep data
?sleep # access help file for sleep
summary(sleep) # summary of the data set
extra # R can't find this variable without typing sleep$extra
sleep$extra # prints a vector of the extra variable in the sleep data set
sleep$ID # prints a vector of the ID variable in the sleep data set

# the attach() function means we don't need to type sleep$ before
# each variable, but it can clutter up our environment
# Remember to use the detach() function when you're done with attached variables
attach(sleep)
extra # this time R does know to print the vector of the extra variable
detach(sleep)
extra # since we used detach() R will give us an error again

sleep$extra[sleep$ID == 1] # prints values from extra variable where ID is 1
sleep$extra[sleep$group == 1] # prints values from extra for group 1
summary(sleep$extra[sleep$group == 1]) # summarizes vector from above

extra1 <- sleep$extra[sleep$group == 1] # stores group 1 extra values in extra1
extra2 <- sleep$extra[sleep$group == 2] # stores group 2 extra values in extra2
diff <- extra2 - extra1 # calculates the difference between extra values
t.test(diff) # conducts a paired t test of the data (see notes for specifics)

sleep[1, ] # prints first row of sleep data set (as a data frame)
sleep[, 1] # prints first column of sleep data set (as a vector)
is.vector(sleep[1, ]) # FALSE
is.data.frame(sleep[1, ]) # TRUE
is.vector(sleep[, 1]) # TRUE
str(sleep[, 1]) # str() gives the structure of an object (numeric vector here)
str(sleep[1 , ]) # this is a data frame with 1 observation and 3 variables
is.data.frame(sleep[, 1]) # FALSE
sleep[1, 1] # prints element in row 1 and column 1
sleep[1, 2] # prints element in row 1 and column 2
sleep[1, 3] # prints element in row 1 and column 3
sleep[2, 3] # prints element in row 2 and column 3



# Example of a list

a <- 3
b <- c("red", "white", "blue")
c <- matrix(1:12, nrow = 3)
mylist <- list(a, b, c, sleep)
mylist

mylist[[1]]
is.vector(mylist[[2]])

mylist[[2]][1]
b[1]
mylist[[4]]$extra


# If a vector contains a character, R converts everything to characters
myvec <- c(5, "Elon", TRUE)
