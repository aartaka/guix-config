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
       emacs-use-package emacs-diminish
       emacs-all-the-icons
       emacs-all-the-icons-dired emacs-all-the-icons-completion
       emacs-miniedit
       ;; Completion and snippets
       emacs-company emacs-helm-company emacs-auto-complete
       emacs-yasnippet emacs-yasnippet-snippets emacs-helm-c-yasnippet
       emacs-eldoc
       ;; Whatever
       emacs-helm-emms
       emacs-nov-el emacs-pdf-tools
       emacs-erc-image
       emacs-magit
       ;; Helm
       emacs-helm-projectile emacs-helm-ag emacs-helm-swoop
       ;; Org Mode
       emacs-ox-gemini emacs-ox-pandoc emacs-org-ref
       emacs-markdown-mode emacs-edit-indirect
       ;; emacspeak espeak-ng
       ;; emacs-telega
       emacs-pinentry
       ;; Lisps
       emacs-sly cl-slynk
       emacs-sly-stepper emacs-sly-quicklisp
       emacs-sly-named-readtables emacs-sly-macrostep emacs-sly-asdf
       emacs-helm-sly emacs-helm-xref
       emacs-geiser emacs-geiser-racket emacs-geiser-guile emacs-racket-mode
       emacs-paredit emacs-tagedit
       emacs-parseclj emacs-parseedn emacs-cider
       ;; C/C++
       emacs-nhexl-mode emacs-go-mode
       ;; Python
       emacs-elpy emacs-flycheck emacs-helm-flycheck
       ;; Web (HTML/CSS/JS)
       emacs-web-mode emacs-js2-mode emacs-rjsx-mode emacs-skewer-mode emacs-rainbow-mode
       emacs-smart-mode-line
       mu offlineimap3
       curl ghostscript unoconv poppler imagemagick mupdf ripgrep pinentry
       aspell aspell-dict-ru aspell-dict-en
       wordnet

       ;; Non-free
       clhs))
