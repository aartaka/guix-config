(specifications->manifest
 '("emacs" "emacs-guix" "emacs-slime" "poppler" "emacs-pdf-tools"
   "clhs" ; NON-FREE
   ;; Lisp dependencies of my stumpwm. Somewhat awkward way to load deps. Meh.
   "sbcl-cl-ppcre" "sbcl-clx-truetype" "sbcl-ttf-fonts" "sbcl-zpng" "sbcl-dexador" "cl-slime-swank"
   ;; Xorg/linux utilities for stumpwm
   "xrdb" "xev" "xfontsel" "xmodmap" "xset" "xsetroot" "xinit" "xinput"
   ;; Scripting and everyday programming.
   "python" "sbcl"
   ;; CLI utils.
   "p7zip" "dosfstools" "file" "tree" "unzip" "git" "sysfsutils"
   "unrar" ; NON-FREE
   ;; Useful everyday programs.
   "icecat" "ungoogled-chromium" "libreoffice" "keepassxc" "rxvt-unicode" "pidgin" "vlc" "pavucontrol"))
