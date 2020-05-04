# p. 1
# Let's make our first function

myprint <- function(num = 5) {
  for(i in 1:num) { print(i) }
}


# Let's try doing a few things with our function

myprint() # The function runs using 5 as the default and prints 1 through 5
myprint(num = 2) # We make the num argument 2, so it prints 1 through 2
myprint(3) # num is the first argument, so we can leave off "num = " if we want
out <- myprint(2) # We attempt to store the output of our function in an object
out # Our function only prints the values, it doesn't store them, so out is empty
args(myprint) # We can look up the standard arguments for our function
myprint # This will print the code of the function for us



### p. 2



# Let's try creating another function called MyMean()

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
MyMean(10)  # works for a numeric scalar
MyMean(1:10)  # works for a numeric vector
MyMean(matrix(1:9, ncol = 3))  # works for a numeric matrix
MyMean(mtcars)  # works for a dataset where all variables are numeric
MyMean(iris)  # does not work if any variables are non-numeric

# Question 4
MyMean(iris$Petal.Length) # option 1
MyMean(X = iris$Petal.Length) # option 2

# Question 7
out <- MyMean(1:10)
out



### p. 3



# Practice Example

# Here is our code that we want to turn into a function
xmax <- max(mtcars$mpg)
xmin <- min(mtcars$mpg)
S <- sum(mtcars$mpg) - xmax - xmin
L <- length(mtcars$mpg) - 2
M <- S/L
M

# Here is what it looks like as a function
MyTrim <- function( vec ){
  xmax <- max(vec)
  xmin <- min(vec)
  S <- sum(vec) - xmax - xmin
  L <- length(vec) - 2
  M <- S / L
  M
}

# Let's try it on the mpg variable in the mtcars dataset

MyTrim(mtcars$mpg)  # we get the same result as above!

# Now let's try it on the Sepal.Length variable in the iris dataset and then
# verify it using the mean() function

MyTrim(iris$Sepal.Length)
mean(iris$Sepal.Length, trim = 1 / 75)



### p. 4



# More practice

# Here is a loop to explore Type I error rates

set.seed(2320)
mydata <- matrix(rnorm(1000 * 30), nrow = 1000, ncol = 30)
mypvals <- NULL
for(i in 1:1000) {
  out <- t.test(mydata[i, ], alternative = "two.sided", mu = 0)
  mypvals[i] <- out$p.value
}

sum(mypvals <= 0.05) / 1000


# Question 1 - create our function

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


# Question 2 - Verify we get same result as above when we use the default args

RejectH0()


# Question 3 - We get 0.052

RejectH0(samples = 5000, samplesize = 20)


# Question 4 - We get 0.9884

RejectH0(samples = 5000, samplesize = 20, munull = 1)


# Question 5 - Rewrite H0 to add an argument to set the true value of mu

RejectH0 <- function(samples = 1000, samplesize = 30, munull = 0, mutrue = 0, 
                     seed = 2320) {
  set.seed(seed)
  mydata <- matrix(rnorm(samples * samplesize, mean = mutrue), 
                   nrow = samples, ncol = samplesize)
  mypvals <- NULL
  for(i in 1:samples) {
    out <- t.test(mydata[i, ], alternative = "two.sided", mu = munull)
    mypvals[i] <- out$p.value
  }
  sum(mypvals <= 0.05) / samples
}



### p. 5



# Question 6 - We get 0.3008

RejectH0(samples = 5000, samplesize = 10, mutrue = 0.5, munull = 0)


# Question 7

out <- NULL
myseq <- seq(10, 50, 10)
for(i in myseq){
  out[i / 10] <- RejectH0(samples = 5000, samplesize = i, munull = 0, 
                     mutrue = 0.5)
}
out



### p. 6



# Example of two lists, one without named objects and one adding names

x <- 1:5
m <- matrix(1:25, nrow = 5)
mylist <- list(x, m, sleep)
mylist
mylist2 <- list(myseq = x, mymat = m, mydata = sleep)
mylist2


# Updating our MyTrim() function

MyTrim <- function( vec ){
  xmax <- max(vec)
  xmin <- min(vec)
  S <- sum(vec) - xmax - xmin
  L <- length(vec) - 2
  M <- S / L
  output <- list(mymax = xmax, mymin = xmin, S = S, L = L, M = M)
  return(output)
}

# Try running it on the mpg variable from mtcars data

out <- MyTrim(mtcars$mpg)
out


# Store mymax from out into an object called maxmpg

maxmpg <- out$mymax
maxmpg



### p. 8



# Practice Exercise #1

# a

vec <- 1:5
sum(vec)

# b

MySum <- function(max = 5) {
  vec <- 1:max
  sum(vec)
}

# c

MySum(2)
MySum(5)
MySum(100)




### p. 9



# Practice Exercise #2

TwoDice <- function(N = 1) {
  rolls <- matrix(sample(1:6, 2 * N, replace = TRUE), ncol = 2)
  sums <- apply(rolls, 1, sum)
  prop7s <- mean(sums == 7)
  out <- list(sums = sums, sevens = prop7s)
  print(paste0("Of your ", N, " rolls, ", 100*prop7s, 
               "% of the rolls summed to 7"))
  out
}

# Test the function with 10 rolls and 100 rolls

TwoDice(10)
TwoDice(100)


# Roll 10,000 pairs of two dice and create a histogram of the results

rolls10000 <- TwoDice(10000)
library(ggplot2)
ggplot(NULL, aes(x = rolls10000$sums)) +
  geom_histogram(color = "white", bins = 11) +
  scale_x_continuous(breaks = 1:13)


# Modify the function to also produce a histogram

TwoDice <- function(N = 1) {
  rolls <- matrix(sample(1:6, 2 * N, replace = TRUE), ncol = 2)
  sums <- apply(rolls, 1, sum)
  prop7s <- mean(sums == 7)
  out <- list(sums = sums, sevens = prop7s)
  print(paste0("Of your ", N, " rolls, ", 100*prop7s, 
               "% of the rolls summed to 7"))
  out
  library(ggplot2)
  ggplot(NULL, aes(x = sums)) +
    geom_histogram(color = "white", bins = 11) +
    scale_x_continuous(breaks = 1:13)
}

TwoDice(10000)
