(use-modules (gnu packages)
             (gnu packages aspell)
             (gnu packages curl)
             (gnu packages emacs)
             (gnu packages emacs-xyz)
             (gnu packages gnupg)
             (gnu packages ghostscript)
             (gnu packages imagemagick)
             (gnu packages libreoffice)
             (gnu packages lisp-xyz)
             (gnu packages mail)
             (gnu packages pdf)
             (gnu packages python-xyz)
             (gnu packages rust-apps)
             (gnu packages speech)
             (gnu packages tex)
             (gnu packages wordnet)

             (guix packages)

             (nongnu packages emacs))

(packages->manifest
 (list emacs
       ;; emacspeak espeak-ng
       ;; emacs-telega
       emacs-pinentry emacs-pdf-tools emacs-sly cl-slynk
       mu offlineimap3
       curl ghostscript unoconv poppler imagemagick mupdf ripgrep pinentry
       aspell aspell-dict-ru aspell-dict-en
       wordnet

       ;; Non-free
       clhs))
