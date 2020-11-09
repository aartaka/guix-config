(use-modules (gnu packages)
             (gnu packages aspell)
             (gnu packages emacs)
             (gnu packages emacs-xyz)
             (gnu packages gnupg)
             (gnu packages ghostscript)
             (gnu packages imagemagick)
             (gnu packages libreoffice)
             (gnu packages lisp-xyz)
             (gnu packages pdf)
             (gnu packages python-xyz)
             (gnu packages rust-apps)
             (gnu packages speech)
             (gnu packages tex)

             (guix packages)

             (nongnu packages emacs))

(packages->manifest
 (list emacs
       emacspeak espeak-ng
       emacs-telega emacs-pinentry emacs-pdf-tools emacs-sly cl-slynk
       ghostscript unoconv poppler imagemagick mupdf ripgrep pinentry
       aspell aspell-dict-ru aspell-dict-en

       ;; Non-free
       clhs))
