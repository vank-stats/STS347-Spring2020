# Set up the triangle to start
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


# Start the game
startX <- 1
startY <- 1

myvertices <- c("A", "B", "C")

mysample <- sample(myvertices, 1)

# Update our graph
if(mysample == "A") {
  midX <- (startX + 0) / 2    # A is at X = 0
  midY <- (startY + 0) / 2    # A is at Y = 0
} else if(mysample == "B"){
  midX <- (startX + 1) / 2    # B is at X = 1
  midY <- (startY + 2) / 2    # B is at Y = 2
} else {
  midX <- (startX + 2) / 2    # C is at X = 2
  midY <- (startY + 0) / 2    # C is at Y = 0
}

# Plot a point
points(midX, midY, pch = 19)
startX <- midX
startY <- midY






#Example 1
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



# Practice 1

sum <- 0
for(index in 1:100) {
  sum <- sum + (index^2)
  print(sum)
}


# We could try walking through the first few steps of our loop to make sure
# it's doing what we want it to do.

sum <- 0   # Sum starts as 0

index <- 1  # First index is 1
  sum <- sum + (index^2)    # We add current sum of 0 to 1^2 to get 1
  print(sum)

  index <- 2  # Second index is 2
  sum <- sum + (index^2)   # We add current sum of 1 to 2^2 to get 5
  print(sum)

  index <- 3  # Third index is 3
  sum <- sum + (index^2)   # We add current sum of 5 to 3^2 to get 14
  print(sum)
  


