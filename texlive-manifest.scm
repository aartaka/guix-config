(use-modules (gnu packages)
             (gnu packages tex)

             (guix packages))

(packages->manifest
 (list texlive
       biber texlive-biblatex texlive-bibtex
       texlive-latex-natbib texlive-latex-fontspec texlive-latex-polyglossia))
