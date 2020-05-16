library(xml2)
library(magrittr)
library(rvest)

FLlist <- read_html("http://www.floridahealth.gov/programs-and-services/office-of-medical-marijuana-use/medical-marijuana-treatment-centers/index.html")

FLDispensaries <- as.data.frame(FLlist %>%
                                  html_nodes("table") %>%
                                  .[[2]] %>%
                                  html_table(header = TRUE))

FLTable <- html_nodes(x=FLlist, xpath='//*[@id="DispensingFacilities"]/tbody/tr/td/p/text()')

#helper
trim <- function (x) gsub("^\\s+|\\s+$", "", x)

mat<-matrix(list(), ncol=4)
li <- c()
row <- 0;
col <- 1;
temp <- "";
for(i in FLTable){
  if(col %% 3 == 0) {
    temp <- trim(html_text(i));
  } else if(col %% 4 == 0) {
    li <- c(li, paste(temp, trim(html_text(i))));
  } else {
  li <- c(li,trim(html_text(i)));
  }
  if(col %% 4 == 0) {
    row <- row + 1;
    mat[[row]] <- li;
    li <- c();
  }
  col <- col + 1;
}
#to matrix/list to dataframe
library(plyr)
mat.df <- as.data.frame(do.call(rbind, mat))
write.csv(mat.df, "FLTest.csv")
