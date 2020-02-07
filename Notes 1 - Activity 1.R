# Question 1
# Create x and y vectors then do simple linear regression of x predicting y
x <- c(1, 3, 4, 8)
y <- c(55, 84, 88, 99)
lm(y ~ x)

# Questions 2 and 3
# Two ways to create a vector with the values 5 through 10
z <- c(5, 6, 7, 8, 9, 10)
z2 <- seq(5, 10)

# Question 4
# Find the standard deviation of z (or z2 - they should be the same!)
sd(z)
sd(z2)

# Question 5
# The number 111 is the 12th element of values (use values[12] to check)
# The 50th element is the value 491
values <- seq(1, 1000, 10)
values
values[50]