# Makefile
#
# Converts Markdown to other formats (HTML, PDF, DOCX, RTF, ODT, EPUB) using Pandoc
# <http://johnmacfarlane.net/pandoc/>
#
# Run "make" (or "make all") to convert to all other formats
#
# Run "make clean" to delete converted files

# Convert all files in this directory that have a .md suffix
SOURCE_DOCS := $(wildcard *.md)

EXPORTED_DOCS=\
 $(SOURCE_DOCS:.md=.html) \
 #$(SOURCE_DOCS:.md=.pdf) \
 #$(SOURCE_DOCS:.md=.epub) \
 #$(SOURCE_DOCS:.md=.rtf) \
 $(SOURCE_DOCS:.md=.docx) \
 $(SOURCE_DOCS:.md=.rtf) \
 $(SOURCE_DOCS:.md=.odt) \


RM=/bin/rm

PANDOC=/usr/local/bin/pandoc

PANDOC_OPTIONS=--toc --toc-depth=2 --number-sections --filter pandoc-crossref --filter pandoc-citeproc

PANDOC_HTML_OPTIONS=--to html5 --katex --template ./templates/standalone.html
PANDOC_PDF_OPTIONS=--pdf-engine=xelatex -V papersize:a4
PANDOC_TXT_OPTIONS=--to plain
PANDOC_DOCX_OPTIONS=
PANDOC_RTF_OPTIONS=
PANDOC_ODT_OPTIONS=
PANDOC_EPUB_OPTIONS=--to epub3

OUTFOLDER=./docs/

# Pattern-matching Rules

%.html : %.md
	cp -r imgs/ docs/imgs/
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_HTML_OPTIONS) -o $(OUTFOLDER)$@ $<

%.pdf : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) -o $(OUTFOLDER)$@ $<

%.docx : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_DOCX_OPTIONS) -o $(OUTFOLDER)$@ $<

%.rtf : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_RTF_OPTIONS) -o $(OUTFOLDER)$@ $<

%.odt : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_ODT_OPTIONS) -o $(OUTFOLDER)$@ $<

%.epub : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_EPUB_OPTIONS) -o $(OUTFOLDER)$@ $<

%.txt : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_TXT_OPTIONS) -o $(OUTFOLDER)$@ $<


# Targets and dependencies

.PHONY: all clean

all : $(EXPORTED_DOCS)

clean:
	- $(RM) $(EXPORTED_DOCS)
