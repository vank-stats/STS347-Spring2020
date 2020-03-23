library(ggplot2)
library(gridExtra)

# Normal Distribution Graphs

g1 <- ggplot(data = data.frame(x = c(-3, 3)), aes(x)) +
  stat_function(fun = dnorm, n = 101) +
  labs(title = "Standard Normal Distribution")

g2 <- ggplot(data = data.frame(x = c(70, 130)), aes(x)) +
  stat_function(fun = dnorm, n = 101, args = list(mean = 100, sd = 10)) +
  labs(title = "Normal Distribution with Mean = 100, SD = 10")

# Notice that we're using a function called stat_function() to add a normal
# distribution curve to both graphs. In the first, the default is a standard
# normal (mean = 0 and s.d. = 1). In the second, we use the args = ___ argument
# to say which arguments of the dnorm() function we want to use

grid.arrange(g1, g2, ncol = 2)



# T-Distribution Graph

# The dplyr library contains the mutate() function to add variables to our data
# The tidyr library contains pivot_longer() which lets us convert our data from
# a "wide" format where each t-distribution gets it's own column, to a "long"
# or "tidy" format where our variables are distribution and density function
# value. This lets us easily plot separate lines by the distribution variable.

library(dplyr)
library(tidyr)

df <- data.frame(x = seq(-3, 3, .01))
df <- mutate(df, t_5 = dt(x, 5), t_10 = dt(x, 10), t_30 = dt(x , 30))
df <- pivot_longer(df, -x, names_to = "dist", values_to = "density")
df$dist <- factor(df$dist, levels = c("t_5", "t_10", "t_30"))

ggplot(df, aes(x = x, y = density, color = dist)) +
  geom_line(aes(linetype = dist)) +
  labs(title = "T-Distributions")




# F-Distribution Graph

df <- data.frame(x = seq(0, 10, .01))
df <- mutate(df, f_2_27 = df(x, 2, 27), f_5_45 = df(x, 5, 45),
             f_8_2 = df(x, 8, 2))
df <- pivot_longer(df, -x, names_to = "dist", values_to = "density")

ggplot(df, aes(x = x, y = density, color = dist)) +
  geom_line(aes(linetype = dist)) +
  labs(title = "F-Distributions")



# Chi-Squared Distribution Graph

df <- data.frame(x = seq(0, 30, .01))
df <- mutate(df, chisq_2 = dchisq(x, 2), chisq_10 = dchisq(x, 10),
             chisq_5 = dchisq(x, 5))
df <- pivot_longer(df, -x, names_to = "dist", values_to = "density")
df$dist <- factor(df$dist, levels = c("chisq_2", "chisq_5", "chisq_10"))

ggplot(df, aes(x = x, y = density, color = dist)) +
  geom_line(aes(linetype = dist)) +
  labs(title = "Chi-Squared Distributions")




# Working with probabities - Example 1
# by default the lower tail is shaded/calculated, so these are the same

pt(1.28, df = 24, lower.tail = TRUE)
pt(1.28, df = 24)


# Working with probabities - Example 2
# We can use lower.tail = FALSE or calculate 1 minus the lower tail to calculate
# areas ABOVE some cutoff

pt(1.28, df = 24, lower.tail = FALSE)
1 - pt(1.28, 24)


# T distribution probabilties on p. 7

# two options for a
pt(2, 12)
pt(2, 12, lower.tail = TRUE)

# b
pt(-0.5, 5, lower.tail = FALSE)

#c
pt(1.28, 999, lower.tail = FALSE)



# Finding p-values (bottom of p. 7)

# Use lower.tail = TRUE because Ha has a < sign
pnorm(-1.1, lower.tail = TRUE)

# This test always has us shade to the RIGHT, so use lower.tail = FALSE
pf(2.8, 3, 20, lower.tail = FALSE)

# Chi-squared tests also have us shade to the RIGHT
pchisq(10.2, 4, lower.tail = FALSE)




# Central Limit Theorem Examples (p. 8)

# 1 - Make mymatrix then verify it looks right

set.seed(32320) # if you want to get same numbers as me
mymatrix <- matrix(rnorm(1000 * 10, mean = 50, sd = 4), ncol = 10)
mean(mymatrix) # 49.994 is very close to mu = 50
sd(mymatrix) # 4.006 is very close to sigma = 4
dim(mymatrix) # matrix is 1000 rows and 10 columns


# 2 - Make mymeans and generate a histogram

mymeans <- apply(mymatrix, 1, mean) # calculate means of all 1000 rows

library(ggplot2)
ggplot(NULL, aes(x = mymeans)) +
  geom_histogram(binwidth = 0.5, color = "white")



# 3 - Add normal curve to your graph

ggplot(NULL, aes(x = mymeans)) +
  geom_histogram(aes(y = ..density..), binwidth = 0.5, color = "white") +
  stat_function(aes(x = c(46, 54)), fun = dnorm, n = 101,
                args = list(mean = 50, sd = 4), color = "blue") + 
  stat_function(aes(x = c(46, 54)), fun = dnorm, n = 101,
                args = list(mean = 50, sd = 4/sqrt(10)), color = "red", lty = 2)


# 4 - QQ plots

ggplot(NULL, aes(sample = mymeans)) +
  geom_qq(distribution = qnorm, dparams = list(mean = 4, sd = 4/sqrt(10))) +
  geom_qq_line(distribution = qnorm, dparams = list(mean = 4, sd = 4/sqrt(10))) +
  labs(title = "Comparing mymeans to Normal(50, 10/sqrt(4))",
       subtitle = "Samples of size 10 from Normal(50, 10) Distribution")


# 5 - Exploring Chi-Squared

df <- 10
rvs <- rchisq(5000, 10)
mean(rvs)
sd(rvs)
sqrt(2*df)



# 6 - mymatrix2 - 1000 rows of 30 random Chi-Squared values

mymatrix2 <- matrix(rchisq(1000 * 30, 10), ncol = 30)


# 7 mymeans2 - Calculate means of samples of 30 Chi-squared values

mymeans2 <- apply(mymatrix2, 1, mean)

# a - histogram

ggplot(NULL, aes(x = mymeans2)) +
  geom_histogram(binwidth = 0.125, color = "white")

# b - mean
mean(mymeans2)

# c - sd
sd(mymeans2)
sqrt(df * 2)
sqrt(df * 2) / sqrt(30)


# 8 - add normal curve to histogram

df <- 10
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




#Where does the t-distribution come from? (p. 11)

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





# Additional examples (p. 13) - added later