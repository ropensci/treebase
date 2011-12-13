## Makefile to use knitr in the vignette
RSCRIPT = Rscript

all: treebase.pdf

pdfclean:
	rm -f *.pdf

clean:
	rm -f index.html
	rm -f *.tex *.bbl *.blg *.aux *.out *.log *.spl


treebase.pdf: treebase/treebase.Rnw
	cp -f treebase/treebase.Rnw .
	$(RSCRIPT) --vanilla -e "require(knitr); knit( 'treebase.Rnw');"
	#Compile in latex, but keep aux file till we make bibliography
	$(RSCRIPT) -e "tools::texi2dvi( 'treebase.tex', pdf = TRUE, clean = FALSE )" 
	bibtex treebase # make the bibliography 
	$(RSCRIPT) -e "tools::texi2dvi( 'treebase.tex', pdf = TRUE, clean = TRUE )" # compile and cleanup
#	cp treebase/treebase-fake.Rnw treebase.Rnw
	
