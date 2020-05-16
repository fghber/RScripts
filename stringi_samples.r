#install.packages("stringi")
library(stringi)

stri_replace_all_fixed("The quicker brown fox jumped over the lazy dog.",
  c("quick", "brown", "fox"), c("slow")   vectorize_all=FALSE)

stri_replace_all_regex("The quicker brown fox jumped over the lazy dog.",
     "\\b"%s+%c("quick", "brown", "fox")%s+%"\\b", c("slow",  "black", "bear"), vectorize_all=FALSE)

string_1 = "[1] \"  .. ..$ : chr [1, 1] \\\"DM_4CRSOL\\\"\""
stringi::stri_extract(string_1, regex = '(?<=\\\\").*(?=\\\\")')


library("stringi")
Orgs <- data.frame("OrgName" = c('WAIROA ABANDONNED COUNCIL', 
                                 ' SMART ENVIORNMENTAL LTD', 
                                 'NEW ZEALAND INSTITUTE OF ABERATION ABILITYES'),
                   stringsAsFactors = FALSE)

patterns <- readLines("bad.csv")
replacements <- readLines("good.csv")

for(i in 1:nrow(Orgs)) {
  row <- Orgs[i,]
  print(as.character(row))
  row <- stri_replace_all_fixed(row, patterns, replacements, vectorize_all=FALSE)
  #row <- stri_replace_all_regex(as.character(row), "\\b" %s+% patterns %s+% "\\b", replacements, vectorize_all=FALSE)
  print(row)
  Orgs[i,] <- row
}



originalTXT<-"start abcd pat1 pat2 pat3 pat4"
test.pat<-"pat1|pat2|pat3|(?=(?<=abcd)(.|\n)*pat4)"
gregexpr(test.pat, originalTXT, perl=TRUE)

stri_match_all_regex(originalTXT, "(pat1)|(pat2)|(pat3)|(?<=abcd)(.|\n)+(pat4)")
overlappingMatch<-stri_match_all_regex(originalTXT,"(?<=abcd)(.|\n)+(pat4)")[[1]][,1]
stri_match_all_regex(originalTXT, "pat1|pat2|pat3|pat4")



s <- "height(female), weight, BMI, and BMI."
stringr::str_replace(s, "(?<=,|^)([()\\w\\s]+),\\s(.*?)((?: and)?(?=\\1))", "\\2")

street = c("2389 E Myronga Street NE")
#sub(x = street, pattern = "\\s((?i)Street|(?i)St\\.?)(?=\\sNE)", replacement = " St", x, perl=TRUE)
sub(x = street, pattern = "\\s((?i)Street|(?i)St\\.?)\\sNE", replacement = " St", perl=TRUE)
