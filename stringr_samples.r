#install.packages("stringr")
library(stringr)
words <- c("proposition", "proper", "Poor", "paul", "park", "car")
words[stringr::str_detect(words, "(?i)^p[a-zA-Z]+r$")]

str="NÜµ (simplified Chinese: 汉字";
str_detect(str,'\\W');

s <- "height(female), weight, BMI, and BMI."
stringr::str_replace(s, "(?<=,|^)([()\\w\\s]+),\\s(.*?)((?: and)?(?=\\1))", "\\2")
