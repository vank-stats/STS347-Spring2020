# Chaos Game Using Base Graphics and plot() function

plot(1, xlim = c(0, 2), ylim = c(0, 2.1), type = "n")
x <- c(0, 1, 2)
y <- c(0, 2, 0)
points(x, y, pch = 19)
labels <- c("A", "B", "C")
text(x, y + .1, labels)
segments(0, 0, 2, 0)
segments(0, 0, 1, 2)
segments(1, 2, 2, 0)
points(1, 1, pch = 19)

startX <- 1
startY <- 1

for(i in 1:10000){
  
  myvertices <- c("A", "B", "C")
  mysample <- sample(myvertices, 1)
  
  if(mysample == "A") {
    midX <- (startX + 0) / 2
    midY <- (startY + 0) / 2
  } else if(mysample =="B"){
    midX <- (startX + 1) / 2
    midY <- (startY + 2) / 2
  } else {
    midX <- (startX + 2) / 2
    midY <- (startY + 0) / 2
  }
  
  points(midX, midY, pch = 19)
  
  startX <- midX
  startY <- midY
  
}
