## Makefile to use knitr in the vignette

all: knit

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
	rm -f *.tex *.bbl *.blg *.aux *.out *.log *.spl *tikzDictionary

# Custom command for my local compile
knit:
	$(RSCRIPT) --vanilla -e ".libPaths(c('~/R', .libPaths())); require(knitr); knit( 'knit_treebase.Rnw', 'treebase.Rnw');"
	$(RPROG) CMD Sweave treebase.Rnw
	pdflatex treebase
	bibtool -s -d -x treebase.aux ~/Documents/Mendeley/bib/library.bib > treebase.bib
	bibtex treebase # make the bibliography 
	pdflatex treebase
	pdflatex treebase
	rm -f *.bbl *blg *.aux *.out *.log *.spl
	cp -f treebase.Rnw treebase.tex treebase.bib *.pdf ../../../vignettes/

## Traditional compile 
treebase.pdf: treebase.Rnw
	$(RPROG) CMD Sweave treebase.Rnw
	$(RSCRIPT) -e "tools::texi2dvi( 'treebase.tex', pdf = TRUE, clean = FALSE )"
	bibtex treebase # make the bibliography 
	$(RSCRIPT) -e "tools::texi2dvi( 'treebase.tex', pdf = TRUE, clean = TRUE )" # compile and cleanup


