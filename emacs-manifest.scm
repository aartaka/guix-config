(use-modules (gnu packages))

(specifications->manifest
 '("emacs" "emacs-telega" "emacs-pdf-tools" "emacs-guix"
   "ghostscript" "unoconv" "poppler" "imagemagick" "mupdf" "ripgrep"
   "aspell" "aspell-dict-ru" "aspell-dict-en"
   ;; Non-free
   "clhs"))
