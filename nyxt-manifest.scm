(specifications->manifest
  '("gcc-toolchain"                    ; Needed to compile some Common Lisp FFI.
    "glib-networking"                  ; For Nyxt local dev.
    "gobject-introspection"            ; For Nyxt with GI.
    "gsettings-desktop-schemas"        ; For Nyxt local dev.
    "make"
    "sbcl"
    "webkitgtk"                         ; TODO: Remove when cl-webkit is updated.
    ;; Qt
    "qtbase"
    "qtwebengine"
    "qtwebchannel"
    "qtdeclarative"))
