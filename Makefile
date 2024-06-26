filename=cv-David-Pal

.PHONY: all clean

all:
	pdflatex ${filename}
	bibtex ${filename} || true
	pdflatex ${filename}
	pdflatex ${filename}

read:
	evince ${filename}.pdf || open ${filename}.pdf &

spell:
	find . -name "*.tex" -exec aspell --lang=en --mode=tex check "{}" \;

clean:
	rm -f *.aux *.dvi *.bak *.bbl *.blg *.brf *.log *.nav *.out *.toc ${filename}.pdf
