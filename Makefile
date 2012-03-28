#
# Makefile for VT Beamer example presentation.
#
# make      - will produce just the slides
# make all  - will produce all output
#
#

# These are the LaTeX files required to use this theme.
# You can put them in the directory with your presentation
# or you can install them somewhere LaTeX will find them.
FILES=beamercolorthemevt.sty vt-color-palette.sty vt_shield_tag_vtbrownA230.jpg

# The install base directory.
# Most people will want /usr/local
INSTALL_BASE=/usr/local/depot/vt-beamer

# The directory under the base where the files will actually
# be put.
INSTALL_DIR=$(INSTALL_BASE)/share/texmf/tex/latex/vt-beamer

INSTALL_FILES=$(addprefix $(INSTALL_DIR)/,$(FILES))

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

install: $(INSTALL_FILES)

$(INSTALL_FILES): $(INSTALL_DIR)/%: %
	cp -p $* $@

clean:
	@-rm *.aux *.log *.tmp *.out *.snm *.nav *.toc *.vrb 2>>/dev/null

realclean: clean
	@-rm *.dvi *.ps *.pdf *-screenshot-*.* 2>>/dev/null
