#!/usr/bin/make

all:

FORCE::

all: FORCE
	pdflatex book.tex
	bibtex book.aux
	pdflatex book.tex
	pdflatex book.tex
	makeindex book
	pdflatex book.tex

clean: FORCE
	rm -f *.pdf *.aux *.bbl *.blg *.dvi *.idx *.log *.out *.toc *.ilg *.ind *.synctex
