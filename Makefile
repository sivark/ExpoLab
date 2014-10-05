.SUFFIXES: .md .html .pdf .pandoc
.PRECIOUS: %.pdf %.html
.PRECIOUS:

.md.html:
	pandoc --toc -s --mathjax -t html5\
          -f markdown --section-divs -V footertext="A sample footer" -o $@ $<

.md.pdf:
	pandoc --listings \
		-V geometry:margin=1in -V fontsize:11pt \
		-s -t latex -f markdown -o $@ $<
