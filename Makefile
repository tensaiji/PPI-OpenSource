DIST=dist
SRC=src
WEBPACK=npx webpack
PANDOC=pandoc
PDF_SRC=$(SRC)/textes/*.md
PDF_DIST=$(DIST)/ppi.pdf

target_default: all

all: clean dist

pdf: dist.pre
	@-$(PANDOC) -o $(PDF_DIST) $(PDF_SRC)

dev:
	@-$(WEBPACK) -w

dist.pre:
	@-mkdir -p $(DIST)

dist.webpack:
	@-$(WEBPACK)

dist: dist.webpack pdf

clean:
	@-rm -rf $(DIST) $(SRC)/*.d.ts

clear: clean
	@-rm -rf node_modules package-lock.json