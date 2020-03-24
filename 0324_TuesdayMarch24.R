# Looking at dnorm, pnorm, and qnorm - p. 3

# d stands for density and calculates the probability density function
# at some value x (i.e. tells us how tall the curve is at that point)

dnorm(0) # At x = 0, the pdf of x is around 0.4 (see the graph later)

# p stands for probability and it calculates the probability of a value below
# whatever we enter for q

pnorm(0) # There is a 0.5 probability of getting an x value less than 0
pnorm(-1.96) # There is a 0.025 probability of an x value less than -1.96

# q stands for quantile and it calculates the value that has probability p
# to the left of it (i.e. the reverse of pnorm())

qnorm(0.5) # The x value with probability 0.5 to the left of it is x = 0
qnorm(0.025) # The x value with probability 0.025 to the left of it x = -1.96



# Graphs on pages 4 and 5

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
df <- mutate(df, t_5 = dt(x, 5), t_10 = dt(x, 10), t_30 = dt(x , 30),
             norm = dnorm(x))
df <- pivot_longer(df, -x, names_to = "dist", values_to = "density")
df$dist <- factor(df$dist, levels = c("t_5", "t_10", "t_30", "norm"))

ggplot(df, aes(x = x, y = density, color = dist)) +
  geom_line(aes(linetype = dist)) +
  labs(title = "T-Distributions")

pnorm(-2)
pt(-2, 5)

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