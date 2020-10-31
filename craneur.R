library(craneur)
colin <- Craneur$new("Colin")
lapply(list.files("usr/pkg", pattern = "tar.gz", full.names = TRUE), function(x) colin$add_package(x))
colin$write(path = "usr/ran")
