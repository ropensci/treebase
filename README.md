treebase
========

_An R package for discovery, access and manipulation of online phylogenies_


- [Development version source code on github](https://github.com/ropensci/treebase)
- [HTML package documentation](http://ropensci.github.com/treeBASE/)
- [Report issues, bugs or feature requests](https://github.com/ropensci/treebase/issues)


Installation
------------

`treebase` is available from CRAN.  You can install the latest version from the development website on github using the `devtools` package from within R.  Make sure you have the latest version for the best experience. 

```r
library(devtools)
install_github("treebase", "ropensci")
```

Getting Started 
---------------

Use of the `treebase` package should be relatively straight forward: 

```r
library(treebase)
Phylogenies_from_Huelsenbeck <- search_treebase("Huelsenbeck", "author")
```

More interesting examples will take advantage of `R` to loop over large amounts of treebase data that would be to tiresome to search for, download and analyze by hand. Welcome to the era of big data phylogenetics.  

- Browse the examples in the [documentation](http://ropensci.github.com/treeBASE/)
- We are preparing a short manuscript to introduce the motivation, functions, and use-cases for the `treebase` package.  Meanwhile, a [preprint is available](https://github.com/ropensci/treeBASE/blob/master/inst/doc/treebase/treebase_github.md) as a dynamic document, where all of the examples shown are produced by the code shown using `knitr`. [See source code](https://github.com/ropensci/treeBASE/blob/master/inst/doc/treebase/treebase.Rmd).  


- treebase is part of the [rOpenSci Project](http://ropensci.github.com)
