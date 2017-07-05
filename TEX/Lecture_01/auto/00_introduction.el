(TeX-add-style-hook
 "00_introduction"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8")))
   (add-to-list 'LaTeX-verbatim-environments-local "semiverbatim")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "beamer"
    "beamer10"
    "inputenc"
    "hyperref"
    "pgfpages"
    "dirtree"
    "tikz"
    "graphicx"
    "array"
    "tcolorbox")
   (TeX-add-symbols
    '("rowfont" 1)
    '("notedir" 1)
    "rowfonttype")
   (LaTeX-add-xcolor-definecolors
    "links")
   (LaTeX-add-array-newcolumntypes
    "L"))
 :latex)

