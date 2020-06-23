(use-modules (gnu packages))

(specifications->manifest
 '("emacs" "emacs-guix" "poppler" "emacs-pdf-tools" "ghostscript"
   "clhs" ; NON-FREE
   ;; Lisp dependencies of my stumpwm. Somewhat awkward way to load deps. Meh.
   "sbcl-cl-ppcre" "sbcl-clx-truetype" "sbcl-zpng" "sbcl-dexador" "sbcl-slynk"
   "stumpwm:lib" "sbcl-stumpwm-ttf-fonts"
   ;; Xorg utilities for stumpwm
   "xrdb" "xev" "xfontsel" "xmodmap" "xset" "xsetroot" "xinit" "xinput"
   ;; Scripting and everyday programming.
   "python" "sbcl"
   ;; CLI utils.
   "p7zip" "dosfstools" "file" "tree" "zip" "unzip" "git" "sysfsutils" "gnupg" "pinentry"
   "unrar" ; NON-FREE
   ;; Useful everyday programs.
   "icecat" "libreoffice" "keepassxc" "rxvt-unicode" "vlc" "pavucontrol"))
