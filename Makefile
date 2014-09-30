.SUFFIXES: .md .html .pdf .pandoc
.PRECIOUS: %.pdf %.html
.PRECIOUS:

.md.html:
	pandoc --toc --mathjax="http://cdn.mathjax.org/mathjax/latest/MathJax.js"\
          --template=template.html\
           -s -t html5\
          -f markdown --section-divs -V footertext="A sample footer" -o $@ $<

.pandoc.html:
	pandoc --toc --mathjax="http://cdn.mathjax.org/mathjax/latest/MathJax.js"\
          --template=template.html\
           -s -t html5\
          -f markdown --section-divs -V footertext="A sample footer" -o $@ $<

.md.pdf:
	pandoc --listings \
		-V geometry:margin=1in -V fontsize:11pt \
		-s -t latex -f markdown -o $@ $<
