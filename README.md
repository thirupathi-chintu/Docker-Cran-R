# Docker-Cran-R
install.packages("devtools")
library("devtools")
devtools::install_github("klutometis/roxygen")
library(roxygen2)
setwd("packages")
create("test")

R CMD build test

pkg <- list.files("./packages", pattern = "tar.gz", full.names = TRUE)
file.copy(pkg, "pkg")
list.files("pkg")

docker build -t thirupathip/cran .

docker run -d -p 8000:8000 thirupathip/cran 


to see packages list
open http://127.0.0.1:8000/

install.packages("test", repos = "http://127.0.0.1:8000/", type = "source")