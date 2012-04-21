all: 

github:
	./knit github
	pandoc -s -S --biblio treebase.bib treebase.md -o treebase_github.md

md:
	pandoc -s -S --biblio treebase.bib treebase.md -o treebase.md

odt:
	./knit docx
	pandoc -s -S --biblio treebase.bib treebase.md --reference-odt=reference.odt -o treebase.odt


docx:
	./knit docx
	pandoc -s -S --biblio treebase.bib treebase.md --reference-docx=reference.docx -o treebase.docx


pdf:
	./knit pdf
	pandoc -s -S --biblio treebase.bib treebase.md --template=elsarticle.latex --latex-engine=xelatex -o treebase.tex
	xelatex treebase.tex
	xelatex treebase.tex
	xelatex treebase.tex

epub:
	./knit epub
	pandoc -s -S --biblio treebase.bib treebase.md -o treebase.epub

bib:
	bibtool -s -d -x citations.aux ~/Documents/Mendeley/bib/*.bib > treebase.bib


clean:
	rm -rf *.log *.bbl *.blg *.out *.spl
