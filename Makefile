#!/usr/bin/make

# Use TeXmacs instead!
# Then:
# pandoc -f html -t epub3 -o limit.epub limit.html

default: volume-1.pdf

.PRECIOUS: tmp/%/index.html
tmp/%/index.html: %.tex
	mkdir -p tmp/$*
	texmacs -c $< $@ -q

%.epub: tmp/%/index.html
	cd tmp/$* && pandoc -f html -t epub -o ../../$@ ../../$<

%_polished.epub: %.epub
	ebook-polish -i -u $< $@

# Resulting file does not diplay in Kindle preview properly
%.docx: %_polished.epub
	pandoc -f epub -t docx -o $@ $<

# %.docx: tmp/%/index.html
# 	cd tmp/$* && pandoc -f html -t docx -o ../../$@ ../../$<

FORCE::

volume-1.pdf: FORCE
	pdflatex volume-1.tex
	bibtex volume-1.aux
	pdflatex volume-1.tex
	pdflatex volume-1.tex
	makeindex volume-1
	pdflatex volume-1.tex

volume-3.pdf: FORCE
	pdflatex volume-3.tex
	bibtex volume-3.aux
	pdflatex volume-3.tex
	pdflatex volume-3.tex
#	makeindex volume-1
#	pdflatex volume-3.tex

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
	rm -f *.pdf *.aux *.bbl *.blg *.dvi *.idx *.log *.out *.toc *.ilg *.ind *.synctex *.epub *.docx
	rm -rf tmp
