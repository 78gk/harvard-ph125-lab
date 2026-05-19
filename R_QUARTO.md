# R + Quarto Guide

1) Install R (>=4.2) and RTools (Windows).
2) Install Quarto from https://quarto.org.
3) Initialize `renv` in an R session:

```r
install.packages("renv")
renv::init()
```

4) Use `scripts/install_R_packages.R` to install course packages reproducibly.
