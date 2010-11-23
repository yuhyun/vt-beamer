#
# Makefile for VT Beamer example presentation.
#
# make      - will produce just the slides
# make all  - will produce all output
#

.SUFFIXES:	.tex .pdf

.tex.pdf:
	pdflatex "\def\MyTheme{$(MY_THEME)} \input{$*}"
	pdflatex "\def\MyTheme{$(MY_THEME)} \input{$*}"

TITLE=vt-beamer
# You can set your theme here or just add
# MY_THEME=Whatever to the make command line.
MY_THEME=Antibes

# The default target is slides since that's what is used
# most while creating the presentation.
slides: $(TITLE)-slides.pdf

notes: $(TITLE)-notes.pdf

article: $(TITLE)-article.pdf

handout: $(TITLE)-handout.pdf

all: $(TITLE)

$(TITLE): notes slides handout article

$(TITLE)-notes.pdf: $(TITLE)-notes.tex $(TITLE).tex $(TITLE)-common.tex

$(TITLE)-slides.pdf: $(TITLE)-slides.tex $(TITLE).tex $(TITLE)-common.tex beamercolorthemevt.sty

$(TITLE)-handout.pdf: $(TITLE)-handout.tex $(TITLE).tex $(TITLE)-common.tex

$(TITLE)-article.pdf: $(TITLE)-handout.tex $(TITLE).tex $(TITLE)-common.tex

clean:
	@-rm *.aux *.log *.tmp *.out *.snm *.nav *.toc *.vrb 2>>/dev/null

realclean: clean
	-rm *.dvi *.ps *.pdf *-screenshot-*.* 2>>/dev/null
