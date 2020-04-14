# Examples of different if/else formats

gpa <- 4
if(gpa == 4) {	"whoa!" }

money <- 100
if(money > 999999) { "you’re a millionaire!"
  } else { "you’re not a millionaire :(" }

age <- 20
if(age >= 65) { "senior discount"
  } else if(age < 13) { "child discount"
  } else { "normal price" }

ifelse(money > 999999, "millionaire", "not a millionaire")

library(dplyr)
if_else(money > 999999, "millionaire", "not a millionaire", 
       "no money info provided")

temp <- 65
case_when(temp <= 32 ~ "freezing!",
          temp > 32 & temp < 55 ~ "a bit chilly",
          temp >= 55 & temp < 75 ~ "perfect",
          temp >= 75 & temp < 90 ~ "a bit warm",
          temp >= 90 ~ "too hot!")





### Examples #1 ###

# First box
set.seed(123)
pval <- t.test(rnorm(30,0,5), mu=-2)$p.value
status <- NA
if(pval < 0.10){
  status <-  "Significant"
}
status
pval


# Second box
set.seed(2320)
pval <- t.test(rnorm(30,0,5), mu=-2)$p.value
status <- NA
if(pval < 0.10){
  status <-  "Significant"
}
status
pval


# Third box
ifelse(pval < 0.10, "Significant", NA)


# Fourth box
set.seed(123)
pval <- t.test(rnorm(30,0,5), mu= -2)$p.value
status <- NA
if(pval < 0.10) {
  status <-  "Significant"
} else {
  status <- "Not Significant" }
status


# Fifth box
set.seed(123)
pval <- t.test(rnorm(30,0,5), mu= -2)$p.value
status <- NA
if(pval < 0.10) {
  status <-  "Significant"
} else {
  status <- "Not Significant" }
status

set.seed(2320)
pval <- t.test(rnorm(30,0,5), mu= -2)$p.value
status <- NA
if(pval < 0.10) {
  status <-  "Significant"
} else {
  status <- "Not Significant" }
status


# Sixth box
set.seed(123)
pval <- t.test(rnorm(30,0,5), mu=-2)$p.value
status <- NA
if(0 < pval & pval < 0.10) {
  status <-  "Significant"
} else if(pval >= 0.10) {
  status <- "Not Significant"
} else { status <- "ERROR" }
status


# Seventh box
status <- case_when(pval > 0 & pval < 0.10 ~ "Significant",
                    pval > 0.10 ~ "Not Significant", 
                    TRUE ~ "ERROR")
status



### Practice Problems ###

# Problem 1

average <- 77
if(average >= 90 & average <= 100) { grade <- "A" }
if(average >= 80 & average < 90) { grade <- "B" }
if(average >= 70 & average < 80) { grade <- "C" }
if(average >= 60 & average < 70) { grade <- "D" }
if(average <= 60) { grade <- "F" }
grade


# Problem 2

average <- 87
if(average >= 90 & average <= 100) { grade <- "A" }
if(average >= 80 & average < 90) { grade <- "B" }
if(average >= 70 & average < 80) { grade <- "C" }
if(average >= 60 & average < 70) { grade <- "D" }
if(average <= 60) { grade <- "F" }
grade

average <- 70
if(average >= 90 & average <= 100) { grade <- "A" }
if(average >= 80 & average < 90) { grade <- "B" }
if(average >= 70 & average < 80) { grade <- "C" }
if(average >= 60 & average < 70) { grade <- "D" }
if(average <= 60) { grade <- "F" }
grade


# Problem 3

average <- 103
if(average >= 90 & average <= 100) { grade <- "A" }
if(average >= 80 & average < 90) { grade <- "B" }
if(average >= 70 & average < 80) { grade <- "C" }
if(average >= 60 & average < 70) { grade <- "D" }
if(average <= 60) { grade <- "F" }
grade


# Problem 4

average <- -95
if(average >= 90 & average <= 100) { grade <- "A" }
if(average >= 80 & average < 90) { grade <- "B" }
if(average >= 70 & average < 80) { grade <- "C" }
if(average >= 60 & average < 70) { grade <- "D" }
if(average <= 60) { grade <- "F" }
grade


# Problem 5

average <- -95
if(average >= 90 & average <= 100) { grade <- "A" }
if(average >= 80 & average < 90) { grade <- "B" }
if(average >= 70 & average < 80) { grade <- "C" }
if(average >= 60 & average < 70) { grade <- "D" }
if(average <= 60) { grade <- "F" }
if(average < 0 | average > 100) { grade <- "ERROR"}
# Note: | is the symbol for "or"
grade


# Problem 6

average <- c(87, 70, 100, 95)
if(average >= 90 & average <= 100) { grade <- "A" }
if(average >= 80 & average < 90) { grade <- "B" }
if(average >= 70 & average < 80) { grade <- "C" }
if(average >= 60 & average < 70) { grade <- "D" }
if(average <= 60) { grade <- "F" }
grade


# Problem 6 - case_when() solution

average <- c(87,70, 100, 95)
grade <- case_when(average >= 90 & average <= 100 ~ "A",
                   average >= 80 & average < 90 ~ "B",
                   average >= 70 & average < 80 ~ "C",
                   average >= 60 & average < 70 ~ "D",
                   average <= 0 & average < 60 ~ "F",
                   TRUE ~ "ERROR")
grade

data.frame(average, grade)


# Example using else if

average2 <- 77
if(average2 >= 90 & average2 <= 100) { grade2 <- "A"
} else if(average2 >= 80) { grade2 <- "B"
} else if(average2 >= 70 ) { grade2 <- "C"
} else if(average2 >= 60 ) { grade2 <- "D"
} else if(average2 < 60 & average2 >= 0) { grade2 <- "F"
} else { grade2 <- "Error" }
grade2


# Problem 1

average2 <- 87
if(average2 >= 90 & average2 <= 100) { grade2 <- "A"
} else if(average2 >= 80) { grade2 <- "B"
} else if(average2 >= 70 ) { grade2 <- "C"
} else if(average2 >= 60 ) { grade2 <- "D"
} else if(average2 < 60 & average2 >= 0) { grade2 <- "F"
} else { grade2 <- "Error" }
grade2

average2 <- 87
if(average2 >= 90 & average2 <= 100) { grade2 <- "A"
} else if(average2 >= 80) { grade2 <- "B"
} else if(average2 >= 70 ) { grade2 <- "C"
} else if(average2 >= 60 ) { grade2 <- "D"
} else if(average2 < 60 & average2 >= 0) { grade2 <- "F"
} else { grade2 <- "Error" }
grade2


# Problem 2

average2 <- -95
if(average2 >= 90 & average2 <= 100) { grade2 <- "A"
} else if(average2 >= 80) { grade2 <- "B"
} else if(average2 >= 70 ) { grade2 <- "C"
} else if(average2 >= 60 ) { grade2 <- "D"
} else if(average2 < 60 & average2 >= 0) { grade2 <- "F"
} else { grade2 <- "Error" }
grade2


# Problem 3

average2 <- 103
if(average2 >= 90 & average2 <= 100) { grade2 <- "A"
} else if(average2 >= 80) { grade2 <- "B"
} else if(average2 >= 70 ) { grade2 <- "C"
} else if(average2 >= 60 ) { grade2 <- "D"
} else if(average2 < 60 & average2 >= 0) { grade2 <- "F"
} else { grade2 <- "Error" }
grade2

average2 <- 103
if(average2 >= 90 & average2 <= 100) { grade2 <- "A"
} else if(average2 >= 80 & average2 < 90) { grade2 <- "B"
} else if(average2 >= 70 & average2 < 80) { grade2 <- "C"
} else if(average2 >= 60 & average2 < 70) { grade2 <- "D"
} else if(average2 < 60 & average2 >= 0) { grade2 <- "F"
} else { grade2 <- "Error" }
grade2




### Practice (Cont.) ###

average2 <- 77
note <- "keep working hard"

if(average2 >= 90 & average2 <= 100) {
  grade2 <- "A"
  note <- "Great job!"
  } else if(average2 >= 80) {
    grade2 <- "B"
    note <- "Great job!"
    } else if(average2 >= 70 ) { grade2 <- "C"
    } else if(average2 >= 60 ) { grade2 <- "D"
    } else if(average2 < 60 & average2 >= 0) { grade2 <- "F"
    } else { grade2 <- "Error" }

grade2
note