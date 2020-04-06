#Example 5 - Let's explore the concept of being __% confident.

nsim <- 100
n <- 30
std <- 5
loc <- 0.9

output <-replicate(nsim, t.test(rnorm(n, 100, std), mu = 100, 
                                alternative = "two.sided", 
                                conf.level = loc)$conf.int[1:2])

output <- t(output) # Make each row a CI instead of each column

# contain_mu is TRUE if 100 is in our CI and FALSE if it isn’t
# The line after that determines what proportion of our CIs contained mu

contain_mu <- output[, 1] <= 100 & output[, 2] >= 100
sum(contain_mu) / nsim




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





library(dplyr)
myiris <- filter(iris, Species != "setosa")

# Use formula syntax (Quantitative ~ Categorical)
t.test(Sepal.Length ~ Species, data = myiris)

# Use standard approach (two quantitative vectors)
SL_ver <- filter(myiris, Species == "versicolor")$Sepal.Length
SL_vir <- filter(myiris, Species == "virginica")$Sepal.Length
t.test(SL_vir, SL_ver)



# Example 1 - Variances 25 and 225, Sample sizes 100 and 20
set.seed(6493)
x1 <- rnorm(100, 100, 5)
x2 <- rnorm(20, 100, 15)
var(x1)  
var(x2)
t.test(x1, x2, var.equal = TRUE)
t.test(x1, x2, var.equal = FALSE)


# Example 2 - Variances 225 and 25, Sample sizes 100 and 20
set.seed(6493)
x1 <- rnorm(100, 100, 15)
x2 <- rnorm(20, 100, 5)
var(x1)  
var(x2)
t.test(x1, x2, var.equal = TRUE)
t.test(x1, x2, var.equal = FALSE)


# Example 3 - Variances 225 and 225, Sample sizes 100 and 20
set.seed(6493)
x1 <- rnorm(100, 100, 15)
x2 <- rnorm(20, 100, 15)
var(x1)  
var(x2)
t.test(x1, x2, var.equal = TRUE)
t.test(x1, x2, var.equal = FALSE)


# Example 4 - Variances 25 and 225, Sample sizes 100 and 100
set.seed(6493)
x1 <- rnorm(100, 100, 5)
x2 <- rnorm(100, 100, 15)
var(x1)  
var(x2)
t.test(x1, x2, var.equal = TRUE)
t.test(x1, x2, var.equal = FALSE)
