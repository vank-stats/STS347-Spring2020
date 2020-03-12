library(ggplot2)

# Example 1

myvals <- 1:25
df <- data.frame(myvals)
ggplot(df, aes(x = myvals, y = myvals)) +
  geom_point(size = 4)

ggplot(df, aes(x = myvals, y = myvals, shape = myvals)) +
  geom_point(size = 4) +
  scale_shape_identity() +
  NULL # add this line if you want to comment out lines above



# Example 2

mycolors <- rep(c("red", "gold", "magenta", "orange", "tomato"), 5)
df2 <- data.frame(myvals, mycolors)

ggplot(df2, aes(x = myvals, y = myvals, shape = myvals)) +
  geom_point(size = 4, aes(color = mycolors)) +
  scale_shape_identity() +
  scale_color_identity() +
  NULL



# Plotting subsets of your data

# Create the base graph that we will subset
g <- ggplot(Orange, aes(x = age, y = circumference)) +
  geom_point(aes(color = Tree)) +
  geom_smooth(method = "lm")
g

# If color = Tree is in ggplot() function you get separate regression lines
# for each Tree (versus one overall line if it is in geom_point())
ggplot(Orange, aes(x = age, y = circumference, color = Tree)) +
  geom_point() +
  geom_smooth(method = "lm")

# Method 1
# Subsets the data and removes points outside this range.
# The regression line is refit with the smaller data set
# R gives warning messages telling us how much data was removed
g + xlim(800, 1500) + ylim(100, 150)

# Method 2
# Zooms in on this section of the graph but keeps original regression line
g + coord_cartesian(xlim = c(800, 1500), y = c(100, 150))

# Method 3
# Interactive! Works like method 2 where you can zoom in and out
# Mouse over points and the line to see more information on them

library(plotly) # You may need to install this first

ggplotly(g)




# Creating grids of graphs (aka "facetting")

p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

# Method 1 - using facet_wrap()

# One variable
p + facet_wrap(~ cyl)

# Two variables - notice how variable combos are communicated
p + facet_wrap(am ~ cyl)


# Method 2 - using facet_grid()

# One variable (looks the same as facet_wrap did)
p + facet_grid(~ cyl)

# Two variables (notice how variable labelling changes)
p + facet_grid(am ~ cyl)


# Question: Compare facet_wrap() to facet_grid()
g <- ggplot(mpg, aes(x = displ, y = hwy))

# With facet_grid() blank graphs included if no data in that combo
# Rows and columns correspond to a level of a variable
g + geom_point(alpha = 0.3) + facet_grid(cyl ~ class) + labs(title = "grid")

# With facet_wrap() graphs are removed if no data in that combo
# Each graph has levels labelled for each variable (not specific to rows/cols)
g + geom_point(alpha = 0.3) + facet_wrap(cyl ~ class) + labs(title = "wrap")



# Method 3 - using grid.arrange() - putting graphs together 

library(gridExtra) # You might need to install this first

g1 <- ggplot(Orange, aes(x = factor(age), y = circumference)) + geom_boxplot()
g2 <- ggplot(Orange, aes(x = age, y = circumference)) + geom_point()
g3 <- ggplot(Orange, aes(x = circumference)) + geom_histogram(color = "white")
g4 <- ggplot(Orange, aes(x = factor(Tree), y = circumference)) + geom_boxplot()


# 2 x 2 grid
grid.arrange(g1, g2, g3, g4, ncol = 2, nrow = 2)

# 2 rows, second row has 2 columns
grid.arrange(g2, arrangeGrob(g3, g4, ncol = 2), nrow = 2)

# 3 x 1 grid (graphs are stretched horizontally)
grid.arrange(g1, g2, g3, nrow = 3)

# 2 columns, second column has 2 rows
grid.arrange(g2, arrangeGrob(g3, g4, nrow = 2), nrow = 1)



# Example on p. 8
g1 <- ggplot(CO2, aes(x = conc, y = uptake)) +
  geom_point() +
  facet_grid(Type ~ Treatment)
g2 <- ggplot(CO2, aes(x = Type, y = conc)) +
  geom_boxplot()
g3 <- ggplot(CO2, aes(x = Treatment, y = uptake)) +
  geom_boxplot()
g4 <- ggplot(CO2, aes(x = Plant, y = uptake)) +
  geom_boxplot()

grid.arrange(g1, arrangeGrob(g2, g3, g4, ncol = 3), nrow = 2)