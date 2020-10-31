FROM rocker/r-base
RUN Rscript -e 'install.packages("httpuv", repos = "https://cran.rstudio.com/")'
RUN Rscript -e 'install.packages("jsonlite", repos = "https://cran.rstudio.com/")'
RUN Rscript -e 'install.packages("servr", repos = "https://cran.rstudio.com/")'
RUN Rscript -e 'install.packages("remotes", repos = "https://cran.rstudio.com/")'
RUN Rscript -e 'remotes::install_github("ColinFay/craneur")'
RUN mkdir usr/ran -p
RUN mkdir usr/pkg -p
COPY craneur.R usr/pkg/craneur.R
COPY pkg usr/pkg
COPY index.html usr/ran/index.html
RUN Rscript usr/pkg/craneur.R
EXPOSE 8000
CMD Rscript -e 'servr::httd("usr/ran/", host = "0.0.0.0", port = 8000)'
