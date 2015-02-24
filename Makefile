PKG  = xcolor-tango

dist : $(PKG).tar.gz

$(PKG).pdf : $(PKG).sty $(PKG).dtx
	latexmk -pdf $(PKG).dtx

$(PKG).sty : $(PKG).ins $(PKG).dtx
	latex $(PKG).ins

$(PKG).tar.gz : $(PKG).sty $(PKG).pdf
	ctanify $(PKG).ins $(PKG).pdf README

clean :
	-rm *.aux *.fdb_latexmk *.fls *.glo *.log *.out *.toc
	-rm $(PKG).pdf $(PKG).tar.gz $(PKG).sty

.PHONY: dist clean
