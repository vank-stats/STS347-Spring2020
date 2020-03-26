pnorm(-1.1, lower.tail = TRUE)
pf(2.8, 3, 20, lower.tail = FALSE)
pchisq(10.2, 4, lower.tail = FALSE)

?rnorm

# Question 1
set.seed(32620)
mymatrix <- matrix(rnorm(n = 1000 * 10, mean = 50, sd = 4), 
                   nrow = 1000, ncol = 10)
dim(mymatrix)
mean(mymatrix)
sd(mymatrix)

# Question 2
mymeans <- apply(mymatrix, 1, mean)
data <- data.frame(mymeans = mymeans)
library(ggplot2)
# Option 1 (no data frame used, so data = NULL)
ggplot(data = NULL, aes(x = mymeans)) +
  geom_histogram(binwidth = .5, color = "white")
# Option 2 - create a dataframe that only contains our vector
ggplot(data, aes(x = mymeans)) +
  geom_histogram(binwidth = .5, color = "white") +
  labs(title = "1000 sample means from a Normal Dist.")

# Problem 3
ggplot(NULL, aes(x = mymeans)) +
  geom_histogram(aes(y = ..density..), binwidth = 0.5, color = "white") + 
  stat_function(aes(x = c(46, 54)), fun = dnorm, n = 101, 
                args = list(mean = 50, sd = 4), color = "blue") + 
  stat_function(aes(x = c(46, 54)), fun = dnorm, n = 101,
                args = list(mean = 50, sd = 4 / sqrt(10)), color = "red", lty = 2)


# Problem 4
ggplot(NULL, aes(sample = mymeans)) +
  geom_qq(distribution = qnorm, dparams = list(mean = 4, sd = 4/sqrt(10))) +
  geom_qq_line(distribution = qnorm, dparams = list(mean = 4, sd = 4/sqrt(10))) +
  labs(title = "Comparing mymeans to Normal(50, 10/sqrt(4))",
       subtitle = "Samples of size 10 from Normal(50, 10) Distribution")



# Problem 5
# Generate 5000 random chi-squared values. Check their mean and sd.
chi_sq_vals <- rchisq(5000, df = 5)
mean(chi_sq_vals) # Yep! This is close to 5
sd(chi_sq_vals) # Yep! This is close to sqrt(2 * 5)

# Problem 6 - choose any number between 2 and 10 for df. I chose 5.
mymatrix2 <- matrix(rchisq(1000 * 30, 5), nrow = 1000, ncol = 30)

# Problem 7
mymeans2 <- apply(mymatrix2, 1, mean)
ggplot(NULL, aes(x = mymeans2)) +
  geom_histogram(binwidth = .125, color = "white") +
  labs(title = "1000 sample means from a Chi-Squared Dist.")

# Shape is close to normal / bell-shaped
mean(mymeans2) # VERY close to df = 5
sd(mymeans2) # Much closer to sqrt(2 * 5) / sqrt(30)
sqrt(2 * 5)
sqrt(2 * 5) / sqrt(30)


# Problem 8
df <- 5
ggplot(NULL, aes(x = mymeans2)) +
  geom_histogram(aes(y = ..density..), color = "white") +
  stat_function(aes(x = c(min(mymeans2), max(mymeans2))), fun = dnorm, n = 101,
                args = list(mean = df, sd = sqrt(2 * df / 30)), color = "red")


# 9 - using qq plot to verify normality of mymeans2

ggplot(NULL, aes(sample = mymeans2)) +
  geom_qq(distribution = qnorm) +
  geom_qq_line(distribution = qnorm) +
  labs(title = paste0("Comparing mymeans2 to Normal Distribution"),
       subtitle = paste0("Samples of size 30 from Chi-Squared(", df, 
                         ") Distribution"))



set.seed(1234)

mymat <- matrix(rnorm(5000 * 10, 50, 4), ncol = 10)
mymeans <- apply(mymat, 1, mean)
mysds <- apply(mymat, 1, sd)

# Assume the null is true!
myts <- (mymeans - 50) / (mysds / sqrt(10))
g <- ggplot(NULL, aes(x = myts)) +
  geom_histogram(aes(y = ..density..), color = "white", binwidth = 0.25)
g

#Doesn't this look normal?
g + stat_function(fun = dnorm, color = "red") +
  stat_function(fun = dt, args = list(df = 9), color = "blue", lty = 2)

ggplot(NULL, aes(sample = myts)) +
  geom_qq(distribution = qnorm) +
  geom_qq_line(distribution = qnorm) +
  labs(title = "myts compared to Z")

ggplot(NULL,aes(sample= myts)) + 
  geom_qq(distribution = qt, dparams = list(df=9)) +
  geom_qq_line(distribution = qt, dparams = list(df = 9)) +
  labs(title = "myts compared to t(9)")
