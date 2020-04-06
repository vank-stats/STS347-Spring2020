set.seed(2320) # giving us a starting point for generating random numbers

myvalues <- rnorm(50, mean = 100, sd = 5)
mean(myvalues)
sd(myvalues)

t.test(myvalues, alternative = "two.sided", mu = 100)
# p-value is 0.1402, which is bigger than 0.05
# There is not sufficient evidence that the population mean is different from 100

# CI is (97.65014, 100.34166)
# We are 95% confident the population mean is between 97.65 and 100.34


# Example 2

data(iris)
t.test(iris$Petal.Length, alternative = "greater", mu = 1.2, conf.level = .9)



out <- t.test(x = myvalues, alternative = "two.sided", mu = 100)

out
summary(out)
str(out)
out$statistic


# Example 3 - What happens for different levels of confidence

loc <- c(0.90, 0.95, 0.99) # stands for Level Of Confidence
ci <- matrix(NA, nrow = 3, ncol = 2)
out1 <- t.test(x=myvalues, alternative="two.sided", mu=100, conf.level=loc[1])
out2 <- t.test(x=myvalues, alternative="two.sided", mu=100, conf.level=loc[2])
out3 <- t.test(x=myvalues, alternative="two.sided", mu=100, conf.level=loc[3])

ci[1, ] <- out1$conf.int[1:2]
ci[2, ] <- out2$conf.int[1:2]
ci[3, ] <- out3$conf.int[1:2]

#How wide are the intervals?
diff <- ci[, 2] - ci[, 1]
cbind(loc, diff)

#Where are they centered?
apply(ci, 1, mean)
mean(myvalues)



# Example 4 - What happens if we change sample size?

set.seed(2320)
myvalues10 <- rnorm(10, 100, 1)
myvalues30 <- rnorm(30, 100, 1)
myvalues100 <- rnorm(100, 100, 1)
loc <- c(0.90, 0.95, 0.99)
ci <- matrix(NA, nrow = 3, ncol = 2)
out1 <- t.test(x=myvalues10, alternative="two.sided", mu=100, conf.level=loc[1])
out2 <- t.test(x=myvalues30, alternative="two.sided", mu=100, conf.level=loc[1])
out3 <- t.test(x=myvalues100, alternative="two.sided", mu=100,conf.level=loc[1])

ci[1, ] <- out1$conf.int[1:2]
ci[2, ] <- out2$conf.int[1:2]
ci[3, ] <- out3$conf.int[1:2]

#How wide are the intervals?
diff <- ci[, 2] - ci[, 1]
cbind(c(10, 30, 100), diff)

#Where are they centered?
apply(ci,1,mean)
mean(myvalues10)
mean(myvalues30)
mean(myvalues100)





#Let's explore the concept of being __% confident.

#Let's explore the concept of being __% confident.

nsim <- 10
n <- 30
std <- 5
loc <- 0.95

output <-replicate(nsim, t.test(rnorm(n, 100, std), mu = 100, 
                                alternative = "two.sided", 
                                conf.level = loc)$conf.int[1:2])

output <- t(output) # Make each row a CI instead of each column

# contain_mu is TRUE if 100 is in our CI and FALSE if it isn’t
# The line after that determines what proportion of our CIs contained mu

contain_mu <- output[, 1] <= 100 & output[, 2] >= 100
sum(contain_mu) / nsim



contain_mu <- output[, 1] <= 100 & output[, 2] >= 100

# Checks if lower endpoint of interval is below 100
output[, 1] <= 100

# Checks if upper endpoint of interval is above 100
output[, 2] >= 100

# Checks if 100 is inside our confidence interval
output[, 1] <= 100 & output[, 2] >= 100
