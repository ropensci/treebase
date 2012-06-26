all: 

github:
	./knit github
	pandoc --biblio treebase.bib treebase.md -o treebase_github.html
	pandoc --biblio treebase.bib appendix.md -o appendix_github.html
	mv treebase_github.html treebase_github.md
	mv appendix_github.html appendix_github.md


md:
	pandoc -s -S --biblio treebase.bib treebase.md -o treebase.md

odt:
	./knit docx
	pandoc -s -S --biblio treebase.bib treebase.md --reference-odt=reference.odt -o treebase.odt
	pandoc -s -S --biblio treebase.bib appendix.md --reference-odt=reference.odt -o appendix.odt


docx:
	./knit docx
	pandoc -s -S --biblio treebase.bib treebase.md --reference-docx=reference.docx -o treebase.docx
	pandoc -s -S --biblio treebase.bib appendix.md --reference-docx=reference.docx -o appendix.docx


pdf:
	./knit pdf
	pandoc -s -S --biblio treebase.bib treebase.md --template=elsarticle.latex --latex-engine=xelatex -o treebase.tex
	xelatex treebase.tex
	xelatex treebase.tex
	xelatex treebase.tex
	pandoc -s -S --biblio treebase.bib appendix.md --template=elsarticle.latex --latex-engine=xelatex -o appendix.tex
	xelatex appendix.tex
	xelatex appendix.tex
	xelatex appendix.tex

epub:
	./knit epub
	pandoc -s -S --biblio treebase.bib treebase.md -o treebase.epub

bib:
	bibtool -s -d -x citation.aux ~/Documents/Mendeley/bib/*.bib > treebase.bib

bibtest:
	bibtool -s -d --preserve.key.case=on -x citation.aux ~/Documents/Mendeley/bib/*.bib > test.bib

clean:
	rm -rf *.log *.bbl *.blg *.out *.spl
