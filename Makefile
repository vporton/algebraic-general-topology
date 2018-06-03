#!/usr/bin/make

default: volume-1.pdf

all: volume-1.pdf addons.pdf volume-2.pdf ideas.pdf

FORCE::

volume-1.pdf: FORCE
	pdflatex volume-1.tex
	bibtex volume-1.aux
	pdflatex volume-1.tex
	pdflatex volume-1.tex
	makeindex volume-1
	pdflatex volume-1.tex

addons.pdf: FORCE
	pdflatex addons.tex
	bibtex addons.aux
	pdflatex addons.tex
	pdflatex addons.tex

volume-2.pdf: FORCE
	pdflatex volume-2.tex
	bibtex volume-2.aux
	pdflatex volume-2.tex
	pdflatex volume-2.tex

ideas.pdf: FORCE
	pdflatex ideas.tex
# 	bibtex addons.aux
	pdflatex ideas.tex
	pdflatex ideas.tex

clean: FORCE
	rm -f *.pdf *.aux *.bbl *.blg *.dvi *.idx *.log *.out *.toc *.ilg *.ind *.synctex
