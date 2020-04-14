# Chaos Game Using ggplot2 Graphics

df <- data.frame(x = c(0, 1, 2), y = c(0, 2, 0), labels = c("A", "B", "C"))
points <- data.frame(x = 1, y = 1)

library(ggplot2)
ggplot(df) + 
  geom_segment(aes(x = c(0, 0, 1), xend = c(1, 2, 2), 
                   y = c(0, 0, 2), yend = c(2, 0, 0))) +
  geom_label(aes(x = x, y = y, label = labels)) + 
  geom_point(data = points, aes(x = x, y = y)) +
  coord_cartesian(xlim = c(0, 2), ylim = c(0, 2.1)) +
  theme_classic() +
  labs(x = "", y = "", title = "Chaos Game")

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
  
  points[i + 1, ] <- c(midX, midY)

  startX <- midX
  startY <- midY
  
}

ggplot(df) + 
  geom_segment(aes(x = c(0, 0, 1), xend = c(1, 2, 2), 
                   y = c(0, 0, 2), yend = c(2, 0, 0))) +
  geom_point(data = points, aes(x = x, y = y)) +
  geom_label(aes(x = x, y = y, label = labels)) + 
  coord_cartesian(xlim = c(0, 2), ylim = c(0, 2.1)) +
  theme_classic() +
  labs(x = "", y = "", title = "Chaos Game")
