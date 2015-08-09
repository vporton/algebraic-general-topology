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
