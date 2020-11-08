(specifications->manifest
  '("gcc-toolchain"                    ; Needed to compile some Common Lisp FFI.
    "glib-networking"                  ; For Nyxt local dev.
    "gobject-introspection"            ; For Nyxt with GI.
    "gsettings-desktop-schemas"        ; For Nyxt local dev.
    "make"
    "sbcl"
    "webkitgtk"                         ; TODO: Remove when cl-webkit is updated.

    "cl-slynk"                          ; To hack Nyxt from the SLY REPL.

    ;; Direct dependencies:
    "cl-alexandria"
    "cl-bordeaux-threads"
    "cl-chanl"
    "cl-css"
    "cl-json"
    "cl-markup"
    "cl-ppcre"
    "cl-prevalence"
    "cl-closer-mop"
    "cl-containers"
    "cl-cluffer"
    "cl-dexador"
    "cl-enchant"
    "cl-fset"
    "cl-hu.dwim.defclass-star"
    "cl-iolib"
    "cl-local-time"
    "cl-log4cl"
    "cl-mk-string-metrics"
    "cl-moptilities"
    "cl-osicat" ; Only Guix package of Nyxt needs SBCL version needed for libosicat.so.
    "cl-parenscript"
    "cl-plump"
    "cl-quri"
    "cl-serapeum"
    "cl-str"
    "cl-slime-swank"
    "cl-trivia"
    "cl-trivial-clipboard"
    "cl-trivial-features"
    "cl-trivial-package-local-nicknames"
    "cl-trivial-types"
    "cl-unix-opts"
    ;; WebKitGTK deps
    "cl-cffi-gtk" ; TODO: Does it have info doc?
    "cl-webkit"))
