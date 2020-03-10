# These two links were used as starting points
# https://qiuyiwu.github.io/2019/01/29/Birthday/
# https://stackoverflow.com/questions/31782580/how-can-i-play-birthday-music-using-r

library(ggplot2)
library(ggforce) # geom_ellipse() 
library(magick) # add image
library(grid) # convert image
library(audio) # download audio

rlogo <- image_read("Pictures/rlogo.png")
g <- rasterGrob(rlogo, interpolate=TRUE)

candlelocs <- data.frame(x = c(2.5, 3, 4, 5, 6, 7),
                         y = c(4.5, 5, 4.5 , 5, 4.5, 5.2))

ggplot() +
  geom_ellipse(aes(x0 = 5, y0 = 2, a = 4.4, b = 1.7, angle = 0), fill = "pink") +
  geom_ellipse(aes(x0 = 5, y0 = 2, a = 4, b = 1.4, angle = 0), fill = "palegreen") +
  geom_rect(aes(xmin = 1, ymin = 2, xmax = 9, ymax = 5), fill = "palegreen") +
  geom_ellipse(aes(x0 = 5, y0 = 5, a = 4, b = 1.4, angle = 0), fill = "azure") +
  geom_segment(aes(x = 1, xend = 1, y = 2, yend = 5)) +
  geom_segment(aes(x = 9, xend = 9, y = 2, yend = 5)) +
  geom_rect(data = candlelocs, aes(xmin = x, ymin = y, 
                                   xmax = x + .2, ymax = y + 2), 
            fill  = "blue") +
  coord_fixed() +
  geom_text(aes(x = 5, y = 2.5, label = "Happy Bi      thday!"), size = 8) +
  geom_point(data = candlelocs, aes(x = x + .1, y = y + 2.1), shape = 24, size = 5,
             fill = "yellow", color = "red") +
  theme_void() +
  annotation_custom(g, xmin=4.95, xmax=5.95, ymin=2, ymax=3) +
  NULL


# This doesn't work on the cloud but can be used to play the birthday song
# bday_file <- tempfile()
# download.file("http://www.happybirthdaymusic.info/01_happy_birthday_song.wav", bday_file, mode = "wb")
# bday <- load.wave(bday_file)
# play(bday)
