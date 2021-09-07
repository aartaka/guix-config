(use-modules (gnu packages)
             (gnu packages compression)
             (gnu packages fonts)
             (gnu packages tex)

             (guix packages))

(packages->manifest
 (list texlive
       biber texlive-biblatex texlive-bibtex texlive-beamer
       texlive-latex-natbib texlive-latex-fontspec texlive-latex-polyglossia
       texlive-latex-cyrillic
       font-tex-gyre
       zziplib))
