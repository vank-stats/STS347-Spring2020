# 1

set.seed(2320)

# 2

data <- matrix(rnorm(1000 * 30), nrow = 1000, ncol = 30)

# 3
# In a standard normal distribution, the mean is 0 and standard deviation is 1

# 4

out <- t.test(data[1, ])
mypvals <- out$p.value

# 5
# We should anticipate a "large" p-value because the null model is actually
# true so most likely our data will not be unusual in this situation.

# 6

# a
# We want to set the seed to generate our random data. This should be done once.
# Once we have our data, the loop will be used to perform many t-tests.

# b
# There are 1,000 rows in the matrix. This is our number of samples.
# Our sequence should index over the values 1 to 1000.

# c
# We should use mypvals[i] to update the ith element in a mypvals vector.
# If we just used mypvals we would keep storing our new p-value over our old one.

# d
# We need to replace the 1st row of the data with the ith row


# 7

set.seed(2320)
data <- matrix(rnorm(1000 * 30), nrow = 1000, ncol = 30)

mypvals <- NULL
for(i in 1:1000) {
  out <- t.test(data[i, ])
  mypvals[i] <- out$p.value
}
mean(mypvals <= 0.05)

# I got 0.051. About 5.1% of the time I correctly reject H0 when alpha = 0.05.



# 8

set.seed(2320)
data <- matrix(rnorm(1000 * 30), nrow = 1000, ncol = 30)

mypvals <- NULL
for(i in 1:1000) {
  out <- t.test(data[i, ])
  mypvals[i] <- out$p.value
}
mean(mypvals <= 0.1)

# I got 0.117. About 11.7% of the time I correctly rejected H0 when alpha = 0.1.



# 9

set.seed(2320)
data <- matrix(rnorm(1000 * 30), nrow = 1000, ncol = 30)

mypvals <- NULL
check <- NULL
for(i in 1:1000) {
  out <- t.test(data[i, ])
  mypvals[i] <- out$p.value
  check_logical <- (out$conf.int[1] < 0 & out$conf.int[2] > 0)
  check[i] <- as.numeric(check_logical)
}
mean(mypvals <= 0.05)
mean(check)

# 94.9% of the confidence intervals correctly contained 0