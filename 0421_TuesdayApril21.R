myprint <- function(num = 5) {
  for(i in 1:num) { print(i) }
}

myprint()
myprint(num = 3)
myprint(2)

out <- myprint(2)
out


# What about a function with two arguments
myprint2 <- function(low = 1, high = 5) {
  for(i in low:high) { print(i) }
}
myprint2()
myprint2(10, 16)
myprint2(10, 5)


# What about a function without a default for our argument
myprint3 <- function(num) {
  for(i in 1:num) { print(i) }
}
myprint3()



# Create a function called MyMean on p. 2

MyMean <-  function(X) { 
  S <- sum(X)
  L <- length(X)
  M <- S/L
  m <- c("The mean is: ", M)
  newS <- paste("Sum is:", S)
  newL <- paste0("Length is:", L)
  print(newS) 
  print(newL, quote = FALSE)
  print(m, quote = FALSE)
  M
  X
}

# Question 2
MyMean(iris) # doesn't work because not all variables are numeric
MyMean(mtcars) # gives us output that may not be useful

MyMean(10)
MyMean(1:10)
MyMean(matrix(1:9, ncol = 3))

# Question 3
MyMean(iris$Petal.Length)

# Question 4
c(1:100)
paste(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
paste0(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

# Question 7
out <- MyMean(iris$Petal.Length)
out

# Question 8 - switch the order of the last two lines with M / X
MyMean <-  function(X) { 
  S <- sum(X)
  L <- length(X)
  M <- S/L
  m <- c("The mean is: ", M)
  newS <- paste("Sum is:", S)
  newL <- paste0("Length is:", L)
  print(newS) 
  print(newL, quote = FALSE)
  print(m, quote = FALSE)
  X
  M
}
out2 <- MyMean(iris$Petal.Length)
out2





# MyTrim() function example on p. 3

# Code to get trimmed mean (remove min and max) for mpg variable w/o a function
xmax <- max(mtcars$mpg)
xmin <- min(mtcars$mpg)
S <- sum(mtcars$mpg) - xmax - xmin
L <- length(mtcars$mpg) - 2
M <- S/L
M

# Function to do this for ANY variable

MyTrim <- function(vec){
  xmax <- max(vec)
  xmin <- min(vec)
  S <- sum(vec) - xmax - xmin
  L <- length(vec) - 2
  M <- S / L
  M
}

# Verify that it works for mtcars$mpg and iris$Sepal.Length
MyTrim(vec = mtcars$mpg)
MyTrim(mtcars$mpg)

MyTrim(iris$Sepal.Length)
mean(iris$Sepal.Length, trim = 1/75)



# Example exploring Type I Errors and Power

set.seed(2320)
mydata <- matrix(rnorm(1000 * 30), nrow = 1000, ncol = 30)
mypvals <- NULL
for(i in 1:1000) {
  out <- t.test(mydata[i, ], alternative = "two.sided", mu = 0)
  mypvals[i] <- out$p.value
}

sum(mypvals <= 0.05) / 1000

# Turning it into a function

RejectH0 <- function(samples = 1000, samplesize = 30, munull = 0, seed = 2320) {
  set.seed(seed)
  mydata <- matrix(rnorm(samples * samplesize), nrow = samples, ncol = samplesize)
  mypvals <- NULL
  for(i in 1:samples) {
    out <- t.test(mydata[i, ], alternative = "two.sided", mu = munull)
    mypvals[i] <- out$p.value
  }
  
  sum(mypvals <= 0.05) / samples
}

# Question 2
RejectH0()

# Question 3
RejectH0(samples = 5000, samplesize = 20)

# Question 4
RejectH0(samples = 5000, samplesize = 20, munull = 1)

# Question 5
RejectH0 <- function(samples = 1000, samplesize = 30, munull = 0, 
                     seed = 2320, mutrue = 0) {
  set.seed(seed)
  mydata <- matrix(rnorm(samples * samplesize, mean = mutrue), nrow = samples, 
                   ncol = samplesize)
  mypvals <- NULL
  for(i in 1:samples) {
    out <- t.test(mydata[i, ], alternative = "two.sided", mu = munull)
    mypvals[i] <- out$p.value
  }
  
  sum(mypvals <= 0.05) / samples
}

# How often will we reject H0: mu = 1 when mu really is 1?
RejectH0(samples = 5000, samplesize = 20, munull = 1, mutrue = 1)
# Around 5% of the time