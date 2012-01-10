## Makefile to use knitr in the vignette

all: treebase.pdf


setvars:
ifeq (${R_HOME},)
R_HOME= $(shell R RHOME)
endif
RPROG=  $(R_HOME)/bin/R
RSCRIPT=$(R_HOME)/bin/Rscript




pdfclean:
	rm -f *.pdf

clean:
	rm -f index.html
	rm -f *.tex *.bbl *.blg *.aux *.out *.log *.spl

treebase.pdf: treebase/treebase.Rnw
	$(RPROG) CMD Sweave treebase.Rnw
	$(RSCRIPT) -e "tools::texi2dvi( 'treebase.tex', pdf = TRUE, clean = FALSE )"
	bibtex treebase # make the bibliography 
	$(RSCRIPT) -e "tools::texi2dvi( 'treebase.tex', pdf = TRUE, clean = TRUE )" # compile and cleanup

knit:
	cd treebase
	$(RSCRIPT) --vanilla -e ".libPaths(c('~/R', .libPaths())); require(knitr); knit( 'treebase.Rnw', '../treebase.Rnw');"
	cd ..
	$(RPROG) CMD Sweave treebase.Rnw
	$(RSCRIPT) -e "tools::texi2dvi( 'treebase.tex', pdf = TRUE, clean = FALSE )"
	bibtool -s -d -x treebase.aux ~/Documents/Mendeley/bib/library.bib treebase.bib
	bibtex treebase # make the bibliography 
	$(RSCRIPT) -e "tools::texi2dvi( 'treebase.tex', pdf = TRUE, clean = TRUE )" # compile and cleanup


