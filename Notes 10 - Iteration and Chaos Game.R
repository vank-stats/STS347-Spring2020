# Set up diagram (using base R graphs)

plot(0:2, 0:2, type = "n")
x <- c(0, 1, 2)
y <- c(0, 2, 0)
points(x, y, pch = 19)
labels <- c("A", "B", "C")
text(x + 0.05, y, labels)
segments(0, 0, 2, 0)
segments(0, 0, 1, 2)
segments(1, 2, 2, 0)
points(1, 1, pch = 19)


# Code to start the game

startX <- 1
startY <- 1
myvertices <- c("A", "B", "C")




# Code to update position for next dot

mysample <- sample(myvertices, 1)

if(mysample == "A") {
  midX <- (0 + startX) / 2
  midY <- (0 + startY) / 2
  } else if(mysample == "B") {
    midX <- (1 + startX) / 2
    midY <- (2 + startY) / 2
    } else {
      midX <- (2 + startX) / 2
      midY <- (0 + startY) / 2
    }

points(midX, midY, pch = 19)

startX <- midX
startY <- midY





# Learning about loops

# Example 1
for(i in 1:5) { print(i) }

#Example 2
for(index in seq(0, 10, 2)) { print(index) }

#Example 3
for(j in c(1, 12, 50)) {
  print(j)
  print(2 * j)
}

#Example 4
sum <- 0
for(k in 1:10) {
  sum <- sum + k
}
sum

#Example 5
sum <- 1
for(k in 2:10){
  sum[k] <- sum[k-1] + k
}
sum

#Example 6
m <- NULL
mymat <- matrix(1:25, nrow = 5, ncol = 5, byrow = TRUE)
for(i in 1:length(mymat[1, ])) {
  m[i] <- mean(mymat[, i])
}
# What is the object m? -- a vector of column means 
m
# How else have we calculated m in class?
apply(mymat, 2, mean)



### Practice #1 ###

sum <- 0
for(i in 1:100) {
  sum <- sum + i^2
  print(sum)
}