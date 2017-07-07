# Compile les fichiers .tex dans le dossier TEX vers le dossier PDF selon la même architecture.
# Non optimal. Si il y a un modification dans un .tex, il les recompile tous...
TEX := $(shell  find . -name '*.tex')
PDF_SANS_NOTES := $(patsubst ./TEX/%.tex, ./PDF/sans_notes/%.pdf,$(TEX))
PDF_AVEC_NOTES := $(patsubst ./TEX/%.tex, ./PDF/avec_notes/%.pdf,$(TEX))

all: $(PDF_SANS_NOTES)  $(PDF_AVEC_NOTES)

./PDF/sans_notes/%.pdf : ./TEX/%.tex
	sed -i -e '/\\setbeameroption{show notes on second screen =left}/d' $<
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make $< -outdir='$(patsubst %/,%,$(dir $@))'

./PDF/avec_notes/%.pdf : ./TEX/%.tex
	sed -i -e '/\\setbeameroption{show notes on second screen =left}/d' $<
	sed -i '/\\setbeamertemplate{note[ ]page}\[plain\]/a \\\setbeameroption{show notes on second screen =left}' $?
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make $< -outdir='$(patsubst %/,%,$(dir $@))'




clean :
	find PDF -type f \( -name "*.aux" -o -name "*.fls" -o -name "*.log" -o -name "*.nav" -o -name "*.out" -o -name "*.snm" -o -name "*.fdb_latexmk" -o -name "*.toc"   \) -delete



