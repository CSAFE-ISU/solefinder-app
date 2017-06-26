# solefinder-app
Shiny app designed to analyze shoesoles.

## Steps:

1. Install R package with useful functions: `devtools::install_github("gbasulto/solefinder")`.
2. Make sure you have all the packages: ggplot2, Cairo, shiny, EBImage, solefinder. *Note*: EBImage is a package from Bioconductor (thus it is not available on CRAN). Install it with:
`source("http://bioconductor.org/biocLite.R"); biocLite("EBImage")`
3. Clone this repository with and open the project with R-Studio. Click "Run App" within R-Studio.