(use-modules (gnu packages))

(specifications->manifest
 '("emacs" "emacs-telega" "emacs-pdf-tools"
   "ghostscript" "unoconv" "poppler" "imagemagick" "mupdf" "texlive" "ripgrep"
   "aspell" "aspell-dict-ru" "aspell-dict-en"
   ;; Non-free
   "clhs"))
