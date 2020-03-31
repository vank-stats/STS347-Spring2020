# Example 1

set.seed(2320)
myvalues <- rnorm(50, mean = 100, sd = 5)

t.test(myvalues, alternative = "two.sided", mu = 100)
t.test(myvalues, alternative = "greater", mu = 100)
t.test(myvalues, alternative = "less", mu = 100)





# Example 2 - Try this on your own

t.test(iris$Petal.Length, mu = 1.2, alternative = "greater")
t.test(iris$Petal.Length, conf.level = 0.9)





# Note under Example 2

# store t.test() output in an object called out
out <- t.test(x = myvalues, alternative = "two.sided", mu = 100)

# print the output of the t.test() function
out 

# tells us what information is stored in this output
summary(out)

# tells us out is a list object and describes each element of the list
str(out)

# list names that we can call to pull out pieces of this output
names(out)

# prints the test statistic - includes a label (t)
out$statistic

# prints the p-value - includes just the number
out$p.value

# prints the test statistic - include $statistic, the label (t), and the number
out[1]





# Example 3 - What happens for different levels of confidence

loc <- c(0.90, 0.95, 0.99)
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





#Example 5 - Let's explore the concept of being __% confident.

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





# Example 6 - Let's continue to investigate the level of confidence

library(ggplot2)
mydata <- data.frame(row = 1:length(output[, 1]), 
                     point.estimate = apply(output, 1, mean), 
                     lower.bound = output[, 1], 
                     upper.bound = output[, 2], contain_mu = contain_mu)

ggplot(mydata, aes(x = row, y = point.estimate, color = contain_mu)) +  
  geom_pointrange(aes(ymin = lower.bound, ymax = upper.bound), size = 0.2) + 
  coord_flip() +
  geom_hline(yintercept = 100) +
  labs(title = paste0("Simulation of ", loc*100, "% confidence"),
       subtitle = paste0(sum(contain_mu), " out of ", nsim, 
                         " simulations captured mu"),
       x = "",
       y = "Confidence Intervals")





# Paired t tests - p. 8

# Create mysleep data frame in right hand column
library(dplyr)
library(tidyr)
mysleep <- pivot_wider(sleep, id_cols = ID,
                       names_from = group, 
                       names_prefix = "extra", 
                       values_from = extra)
mysleep <- mutate(mysleep, 
                  diff = extra1 - extra2)

# Formula syntax (response ~ explanatory or quantitative ~ categorical)
t.test(extra ~ group, paired = TRUE, data = sleep)

# Non-formula syntax - using pre-calculated differences
# Output says One Sample t-test, but is otherwise identical to above
t.test(mysleep$diff)

# Non-formula syntax - entering two vectors to take differences of
t.test(mysleep$extra1, mysleep$extra2, paired = TRUE)





# Two independent samples tests - p. 9

# Create a dataset called myiris containing two plant species
library(dplyr)
myiris <- filter(iris, Species != "setosa")

# Use formula syntax (Quantitative ~ Categorical)
t.test(Sepal.Length ~ Species, data = myiris)

# Use standard approach (two quantitative vectors)
SL_ver <- filter(myiris, Species == "versicolor")$Sepal.Length
SL_vir <- filter(myiris, Species == "virginica")$Sepal.Length
t.test(SL_vir, SL_ver)

# Re-do tests with equal variances assumption
t.test(Sepal.Length ~ Species, data = myiris, var.equal = TRUE)
t.test(SL_vir, SL_ver, var.equal = TRUE)





# Example - Investigate differences between var assumptions - p. 12

set.seed(6493)
x1 <- rnorm(100, 100, 5)
x2 <- rnorm(20, 100, 15)
var(x1)  
var(x2)
t.test(x1, x2, var.equal = TRUE)
t.test(x1, x2, var.equal = FALSE)
val <- c(x1, x2)
grp <- c(rep("A", 100), rep("B", 20)) 
mydata <- data.frame(val, grp)
ggplot(mydata, aes(x=grp, y=val)) +
  geom_boxplot()

# Swap the standard deviations
set.seed(6493)
x1 <- rnorm(100, 100, 15)
x2 <- rnorm(20, 100, 5)
var(x1)  
var(x2)
t.test(x1, x2, var.equal = TRUE)
t.test(x1, x2, var.equal = FALSE)
val <- c(x1, x2)
grp <- c(rep("A", 100), rep("B", 20)) 
mydata <- data.frame(val, grp)
ggplot(mydata, aes(x=grp, y=val)) +
  geom_boxplot()

# Both populations have sd of 15
set.seed(6493)
x1 <- rnorm(100, 100, 15)
x2 <- rnorm(20, 100, 15)
var(x1)  
var(x2)
t.test(x1, x2, var.equal = TRUE)
t.test(x1, x2, var.equal = FALSE)
val <- c(x1, x2)
grp <- c(rep("A", 100), rep("B", 20)) 
mydata <- data.frame(val, grp)
ggplot(mydata, aes(x=grp, y=val)) +
  geom_boxplot()

# Both samples are of size n = 100
set.seed(6493)
x1 <- rnorm(100, 100, 5)
x2 <- rnorm(100, 100, 15)
var(x1)  
var(x2)
t.test(x1, x2, var.equal = TRUE)
t.test(x1, x2, var.equal = FALSE)
val <- c(x1, x2)
grp <- c(rep("A", 100), rep("B", 100)) 
mydata <- data.frame(val, grp)
ggplot(mydata, aes(x=grp, y=val)) +
  geom_boxplot()





# Paired data as two independent samples?
t.test(mysleep$extra1, mysleep$extra2, paired = TRUE)
t.test(mysleep$extra1, mysleep$extra2)