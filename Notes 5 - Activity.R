# Solutions for Notes 5 - Activity

data("ToothGrowth")
# The variable does is considered numeric. This next line creates adds new 
# variable called dose2 to the ToothGrowth data set that is a factor instead.
ToothGrowth$dose2 <- factor(ToothGrowth$dose)
# In the str() function output, dose2 is listed as a factor now (like supp)
str(ToothGrowth)

library(ggplot2)
g <- ggplot(ToothGrowth, aes(x = supp, y = len))
g
# We haven't added any geoms to our graphing object yet, so R plots a blank
# graph for now.


g + geom_boxplot()
# We might want to add color, fix labels, or add info from another variable


g + geom_boxplot(color = "darkcyan")
g + geom_boxplot(fill = "darkcyan")
# color changes the lines of the boxplot, fill changes the inside of the boxplot


g + geom_boxplot(aes(fill = supp))
# This code gives a different color to our two supplements and adds a legend
g + geom_boxplot(fill = c("red", "blue"))
# This also gives a different color to each supplement but without a legend


g + geom_boxplot(aes(fill = supp), show.legend = FALSE)
# The default is show.legend = TRUE because our first graph had a legend


g + geom_boxplot(aes(fill = dose2))
# This creates two sets of side by side boxplots, one for each supplement.
# The plots are now color coded by the dose.


ggplot(ToothGrowth, aes(x = dose, y = len)) +
  geom_boxplot()
# Error: Continuous x aesthetic
# This is because dose is treated as numeric in our data


g1 <- ggplot(ToothGrowth, aes(x = dose2, y = len))
g1 + geom_boxplot()
# This code uses dose2, which we made sure was a factor, so now we get side by
# side boxplots of each dosage.


g1 + geom_boxplot() +
  geom_jitter(height = 0, width = 0.1)
# geom_jitter() adds points to the graph (like a scatter plot)
# Jittering refers to randomly shifting the points a little bit so that they 
# don't end up on top of one another. The height and width arguments let us 
# control how much they shift. Since the height contains important information
# (their length), we don't want the points to move in that direction. However,
# the width doesn't tell us anything as long as we keep the points with their
# respective dose2 groups.


g1 + geom_boxplot() +
  coord_flip()
# This gives us horizontal boxplots instead of vertical ones (the x and y 
# coordinates get flipped)


ggplot(ToothGrowth, aes(x = dose2, y = len)) +
  geom_boxplot(outlier.color = "red", outlier.shape = 1)
# This made the outliers red circles that aren't filled in