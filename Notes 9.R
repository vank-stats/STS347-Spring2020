# One Way ANOVA

# Problem 1
library(ggplot2)
ggplot(iris, aes(x = Species, y = Petal.Width)) + 
  geom_boxplot()


# Problem 2

# Generating an ANOVA table using aov() and data = ___
out <- aov(Petal.Width ~ Species, data = iris)
anova(out) 
plot(out)

# alternative method using lm() and no data = ___
out2 <- lm(iris$Petal.Width ~ iris$Species)   
anova(out2)
plot(out2)



# Two Way ANOVA

# Read in the data using code from Import Dataset menu
library(readr)
pigs <- read_table2("Notes 9 - pigs.txt")

# We need to convert these to categorical variables

pigs$b12 <- factor(pigs$b12)
pigs$antib <- factor(pigs$antib)

# Generate boxplots to visualize the data – below are some options

ggplot(pigs, aes(x = b12, y = weight)) + 
  geom_boxplot()
ggplot(pigs, aes(x = antib, y = weight)) + 
  geom_boxplot()
ggplot(pigs, aes(x = b12, y = weight, color = antib)) + 
  geom_boxplot()
ggplot(pigs, aes(x = antib, y = weight, color = b12)) + 
  geom_boxplot()

# Generate the anova table and view the results

out.twoway <- aov(weight ~ b12 + antib + b12 * antib, data = pigs) 
summary(out.twoway)

# Generate residual plots

plot(out.twoway)

# Verify critical values from hand drawn table

qf(.05, 1, 8, lower.tail = FALSE)



# Simple and Multiple Linear Regression

# Problem 1

cor(mtcars$wt, mtcars$mpg)

# Problem 2

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()

# Problem 3

# Example without using data = ___
lm(mtcars$mpg ~ mtcars$wt)

# Example using data = ___
lm(mpg ~ wt, data = mtcars)


# Problem 4

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)


# Problem 5

out <- lm(mpg ~ wt, data = mtcars)
summary(out)


# Problem 6

lm(mpg ~ wt - 1, data = mtcars)


# Problem 7

lm(mpg ~ 1, data = mtcars)


# Problem 8

out2 <- lm(mpg ~ wt + hp, data = mtcars)
summary(out2)


# Problem 9

plot(out2)
