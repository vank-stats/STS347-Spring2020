# Load the ggplot2 library since we will use it for all of these examples
library(ggplot2)


# Load the diamonds data set for the graph below
data(diamonds)

# Graph on p. 1 of Notes 5
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point() +
  labs(title = "How is the carat of a diamond related to price?",
       subtitle = "Using the diamonds dataset from ggplot2",
       x = "Carat (One carat = 1/5 of a gram)",
       y = "Price (in dollars)",
       caption = "Created for STS347 - Notes 5")



# Load the Orange data set for the graphs on p. 2 and 3
data(Orange)

# Create a base for our graph and store it in an object called p
p <- ggplot(Orange, aes(x = age, y = circumference))

# Add a geom_point() layer to p to create a scatterplot
p + geom_point()

# Map the Tree variable to color in the geom_point() layer
p + geom_point(aes(color = Tree))

# Reorder the legend of the colors
p + geom_point(aes(color = Tree)) +
  scale_color_discrete(limits = 1:5)

# color = Tree can be put in an aes() function inside ggplot() or geom_point()
ggplot(Orange, aes(x = age, y = circumference, color = Tree)) +
  geom_point()

# All of the points turn red
p + geom_point(color = "red")

# If we put color = "red" inside aes(), it creates a legend because it thinks 
# "red" is a variable
p + geom_point(aes(color = "red"))

# Change color of points to "slateblue"
p + geom_point(color = "slateblue")

# size = 4 Makes the points bigger
p + geom_point(color = "slateblue", size = 4)

# alpha = 0.5 makes the points somewhat see through
p + geom_point(color = "slateblue", size = 4, alpha = 0.5)

# shape = 17 for filled in triangle, shape = 24 for outline of a triangle
p + geom_point(color = "slateblue", size = 4, alpha = 0.5, shape = 17)
p + geom_point(color = "slateblue", size = 4, alpha = 0.5, shape = 24)


# Example at bottom of p. 3
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(size = 5, alpha = 0.7, shape = 18) +
  labs(title = "How mileage and weight of cars relate",
       subtitle = "Using the mtcars data set",
       x = "Weight of the car (in 1000s of pounds)",
       y = "Miles per (US) gallon",
       caption = "STS347 - Notes 5 Exercise",
       color = "Cylinders") +
  theme_classic()


# Load data set for p. 4 example
data("txhousing")

# Example on p. 4
ggplot(txhousing, aes(x = factor(year), y = sales, fill = factor(year))) +
  geom_boxplot(alpha = 0.5, show.legend = FALSE) +
  coord_flip() +
  labs(title = "Texas Housing Sales",
       x = "Year",
       y = "Number of Sales (log scale)") +
  scale_y_log10()


# Code for graph at bottom of p. 5
ggplot(trees, aes(x = Height, y = Girth)) +
  geom_point(size = 4) +
  geom_vline(xintercept = 75, col = "red", linetype = 2, size = 2) +
  geom_hline(yintercept = 15) +
  geom_abline(slope = 0.1, intercept = 5, color = "tan", size = 3, linetype = 3) +
  geom_segment(x = 65, xend = 80, y = 10, yend = 18, color = "orange") +
  geom_smooth(method = "lm") +
  geom_label(x = 73, y = 20, label = "My height", color = "red") +
  geom_text(x = 80, y = 20, label = "r = 0.519") +
  theme_classic()
