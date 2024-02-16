treebase
========

_An R package for discovery, access and manipulation of online phylogenies_

- [Publication in Methods in Ecology and Evolution doi:10.1111/j.2041-210X.2012.00247.x



Installation
------------

`treebase` is available from CRAN.  You can install the latest version from the development website on github using the `devtools` package from within R.  Make sure you have the latest version for the best experience.

```r
library(devtools)
install_github("ropensci/treebase")
```

Getting Started
---------------

Use of the `treebase` package should be relatively straight forward:

```r
library(treebase)
Phylogenies_from_Huelsenbeck <- search_treebase("Huelsenbeck", "author")
```

More interesting examples will take advantage of `R` to loop over large amounts of treebase data that would be to tiresome to search for, download and analyze by hand. Welcome to the era of big data phylogenetics.  


- treebase is part of the [rOpenSci Project](https://ropensci.org/)

References
----------

* Carl Boettiger, Duncan Temple Lang (2012). Treebase: An R package for discovery, access and manipulation of online phylogenies, Methods in Ecology and Evolution. doi:10.1111/j.2041-210X.2012.00247.x
