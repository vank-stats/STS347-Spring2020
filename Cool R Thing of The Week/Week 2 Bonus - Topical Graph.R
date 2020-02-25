specialtext <- "Happy Valentine's Day"
library(ggplot2)

















dat <- data.frame(t = seq(0, 2 * pi, by = 0.005))
dat$x <- 16 * sin(dat$t)^3
dat$y <-  13*cos(dat$t) - 5*cos(2*dat$t) - 2*cos(3*dat$t) - cos(4*dat$t)

ggplot(dat, aes(x = x, y = y)) +
  geom_line(color = "red") +
  geom_text(NULL, x = 0, y = 0, label = specialtext, size = 6)
