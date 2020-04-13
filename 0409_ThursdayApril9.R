# Create gpa object
gpa <- 2

# A statement with if()
if(gpa == 4) {	"whoa!" }

# Added an else, for what to do if gpa does not equal 4
if(gpa == 4) {	"whoa!" 
  } else { "not a 4.0 :( "}


# Trying if() with else if() and else
age <- 10
if(age >= 65) { "senior discount"
  } else if(age < 13) { "child discount"
  } else { "normal price" }


# Using the ifelse() function
money <- 1000000000
ifelse(money > 999999, "millionaire", "not a millionaire")

# Using the if_else() function from dplyr
# Only difference from ifelse() is an option for what to do with missing values
library(dplyr)
if_else(money > 999999, "millionaire", "not a millionaire", 
        "no money info provided")


# The case_when() function from dplyr lets you specify many conditions
# and their corresponding outcomes
temp <- 101
case_when(temp <= 32 ~ "freezing!",
          temp > 32 & temp < 55 ~ "a bit chilly",
          temp >= 55 & temp < 75 ~ "perfect",
          temp >= 75 & temp < 90 ~ "a bit warm",
          temp >= 90 ~ "too hot!")


# Example of using case_when() to create a variable
data(mtcars)
summary(mtcars$mpg)
mtcars$mileage <- case_when(mtcars$mpg < 15 ~ "bad",
                            mtcars$mpg >= 15 & mtcars$mpg < 25 ~ "ok",
                            mtcars$mpg >=25 ~ "good")




# Examples #1

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

status <- NA
ifelse(pval < 0.10, status <- "Significant", status <- "Not significant")
status


# Fourth box
set.seed(2320)
pval <- t.test(rnorm(30,0,5), mu=-2)$p.value
status <- "Not Significant"
if(pval < 0.10){
  status <-  "Significant"
}
status
pval


# ifelse() example to illustrate how the first argument decided whether the
# output is the second argument (if true) or the third argument (if false)

ifelse(5 > 2, result <- "good math", result <- "bad math")
result

ifelse(2 > 5, result <- "good math", result <- "bad math")
result



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



set.seed(123)
pval <- -7
status <- NA
if(pval < 0.10) {
  status <-  "Significant"
  } else {
  status <- "Not Significant" }
status




set.seed(123)
pval <- t.test(rnorm(30,0,5), mu=-2)$p.value
status <- NA
if(0 < pval & pval < 0.10) {
  status <-  "Significant"
} else if(pval >= 0.10) {
  status <- "Not Significant"
} else { status <- "ERROR" }
status

# Try this code with p-value of -7
pval <- -7
status <- NA
if(0 < pval & pval < 0.10) {
  status <-  "Significant"
} else if(pval >= 0.10) {
  status <- "Not Significant"
} else { status <- "ERROR" }
status


# Differences between ifelse() and if_else()
# if_else() has an extra argument that lets us control the output if the thing
# we're checking is missing (e.g. if pval is NA)

pval <- NA
if_else(pval > 0 & pval < .1, 
        "Significant", "Not Significant", "Didn't run test")
ifelse(pval > 0 & pval < .1, "Significant", "Not Significant")



pval <- .4
status <- case_when(pval > 0 & pval < 0.10 ~ "Significant",
                    pval > 0.10 ~ "Not Significant", 
                    TRUE ~ "ERROR")
status


pval <- -7
status <- case_when(pval > 0 & pval < 0.10 ~ "Significant",
                    pval > 0.10 ~ "Not Significant", 
                    TRUE ~ "ERROR")
status




average <- 62
if(average >= 90 & average <= 100) { grade <- "A" }
if(average >= 80 & average < 90) { grade <- "B" }
if(average >= 70 & average < 80) { grade <- "C" }
if(average >= 60 & average < 70) { grade <- "D" }
if(average <= 60) { grade <- "F" }
grade


average <- 103
if(average >= 90 & average <= 100) { grade <- "A" }
if(average >= 80 & average < 90) { grade <- "B" }
if(average >= 70 & average < 80) { grade <- "C" }
if(average >= 60 & average < 70) { grade <- "D" }
if(average <= 60) { grade <- "F" }
grade



average <- -95
if(average >= 90 & average <= 100) { grade <- "A" }
if(average >= 80 & average < 90) { grade <- "B" }
if(average >= 70 & average < 80) { grade <- "C" }
if(average >= 60 & average < 70) { grade <- "D" }
if(average <= 60) { grade <- "F" }
grade


average <- 103
if(average >= 90 & average <= 100) { grade <- "A" 
} else if(average >= 80 & average < 90) { grade <- "B" 
} else if(average >= 70 & average < 80) { grade <- "C" 
} else if(average >= 60 & average < 70) { grade <- "D" 
} else if(average > 0 & average <= 60) { grade <- "F" 
} else { grade <- "ERROR" }
grade



average <- -89
if(average >= 90 & average <= 100) { grade <- "A" }
if(average >= 80 & average < 90) { grade <- "B" }
if(average >= 70 & average < 80) { grade <- "C" }
if(average >= 60 & average < 70) { grade <- "D" }
if(average <= 60) { grade <- "F" }
if(average < 0 | average > 100) {grade <- "ERROR"}
grade





average <- c(87, 70, 100, 95)
if(average >= 90 & average <= 100) { grade <- "A" }
if(average >= 80 & average < 90) { grade <- "B" }
if(average >= 70 & average < 80) { grade <- "C" }
if(average >= 60 & average < 70) { grade <- "D" }
if(average <= 60) { grade <- "F" }
grade






average <- c(87,70, 100, 95, -72)
grade <- case_when(average >= 90 & average <= 100 ~ "A",
                   average >= 80 & average < 90 ~ "B",
                   average >= 70 & average < 80 ~ "C",
                   average >= 60 & average < 70 ~ "D",
                   average >= 0 & average < 60 ~ "F",
                   TRUE ~ "ERROR")
grade

data.frame(average, grade)