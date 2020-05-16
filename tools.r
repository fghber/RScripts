library(tools)
src <-"C:/Users/x/Desktop"
pdffiles <- list.files(path = src, pattern = "pdf",  full.names = TRUE)
test <- lapply(pdffiles, function(i) system(paste('"C:/Program Files (x86)/Cmd/bin/pdftotext.exe"', 
paste0('"', i, '"'), paste0('"path/out/', basename(file_path_sans_ext(i)), '.txt"')), wait = FALSE) )
