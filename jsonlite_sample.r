#install.packages("jsonlite")
library(jsonlite)
df <- data.frame(
  a = c (1:5), 
  b = c("Rick","Dan","Michelle","Ryan","Gary"),
  c = c(623.3,515.2,611.0,729.0,843.25)
)
val <- toJSON(list( table = df), pretty = TRUE)
toJSON(list( table = list(entry = df)), pretty = TRUE)
toJSON(list(table = lapply(seq_len(nrow(df)), function(i) list(entry = df[i, , drop = FALSE]))), pretty = TRUE)

toJSON(c("foo","bar"))
