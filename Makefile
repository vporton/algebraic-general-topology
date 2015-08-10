#!/usr/bin/make

default: book.pdf

all: book.pdf addons.pdf

FORCE::

book.pdf: FORCE
	pdflatex book.tex
	bibtex book.aux
	pdflatex book.tex
	pdflatex book.tex
	makeindex book
	pdflatex book.tex

addons.pdf: FORCE
	pdflatex addons.tex
	bibtex addons.aux
	pdflatex addons.tex
	pdflatex addons.tex

clean: FORCE
	rm -f *.pdf *.aux *.bbl *.blg *.dvi *.idx *.log *.out *.toc *.ilg *.ind *.synctex
