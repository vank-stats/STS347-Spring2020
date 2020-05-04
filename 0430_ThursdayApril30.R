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


# Question 6
RejectH0(samples = 5000, samplesize = 10, munull = 0, mutrue = 0.5)

RejectH0(samples = 5000, samplesize = 30, munull = 0, mutrue = 0.5)

# Question 7
out <- NULL
myseq <- seq(10, 50, 10)
for(i in myseq){
  out[i / 10] <- RejectH0(samples = 5000, samplesize = i, munull = 0, 
                          mutrue = 0.5)
}
out



# What happens if the null model *is* true and our sample size increases?
out <- NULL
myseq <- seq(10, 50, 10)
for(i in myseq){
  out[i / 10] <- RejectH0(samples = 5000, samplesize = i, munull = 0, 
                          mutrue = 0)
}
out
plot(myseq, out, type = 'l')



# Example Lists

x <- 1:5
m <- matrix(1:25, nrow = 5)
mylist <- list(x, m, sleep)
mylist
mylist2 <- list(myseq = x, mymat = m, mydata = sleep)
mylist2


# Update MyTrim() function to output a list
MyTrim <- function(vec){
  xmax <- max(vec)
  print(xmax)
  xmin <- max(vec)
  print(xmin)
  S <- sum(vec) - xmax - xmin
  L <- length(vec) - 2
  M <- S / L
  output <- list(mymax = xmax, mymin = xmin, S = S, L = L, M = M)
  return(output)
}
out <- MyTrim(mtcars$mpg)
out$mymin




# Examples of the MySum() function

# One option - uses a for loop
mysum <- function(x){
  vec <- vector()
  for(i in 1:x){
    vec[i] <- i
  }
  sum(vec)
}
mysum(2)

# Another option - does everything in one line
MySum <- function(val) {
  sum(1:val)
}
MySum(5)

# Dr. V's approach
MySum <- function(max = 5) {
  vec <- 1:max
  sum(vec)
}
MySum(100)



# Write a function name “TwoDice” with one argument, N. The function will simulate 
# rolling two dice and calculating the sum of the two dice. The argument, N, will 
# determine how many times to repeatedly roll your two dice and calculate their sum.
# For example, TwoDice(10) would simulate the sum of each of ten rolls of two dice.
# You should be able to create a vector that contains the sum from each of your N 
# iterations and then output the result.

TwoDice <- function(N) {
  rolls <- matrix(sample(1:6, 2 * N, replace = TRUE), nrow = N)
  apply(rolls, 1, sum)
}
TwoDice(20)

# First, let's try to do this without a function when N = 1
rolls <- sample(1:6, 2, replace = TRUE)
sum(rolls)

# First, let's try to do this without a function when N = 3
N <- 3
rolls <- matrix(sample(1:6, 2 * N, replace = TRUE), nrow = N)
apply(rolls, 1, sum)