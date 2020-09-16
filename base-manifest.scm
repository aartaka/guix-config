(use-modules (gnu packages))

(specifications->manifest
 '("emacs"
   ;; Lisp dependencies of my stumpwm. Somewhat awkward way to load deps. Meh.
   "sbcl-alexandria" "sbcl-cl-ppcre" "sbcl-clx-truetype" "sbcl-zpng"
   "sbcl-dexador" "sbcl-slynk" "sbcl-bordeaux-threads"
   "stumpwm:lib" "sbcl-stumpwm-ttf-fonts"
   ;; Fonts
   "font-hack" "font-google-noto" "font-dejavu" "font-liberation"
   ;; Xorg utilities for stumpwm
   "xrdb" "xev" "xfontsel" "xmodmap" "xset" "xsetroot" "xinit" "xinput"
   ;; Scripting and everyday programming.
   "python" "sbcl"
   ;; CLI utils.
   "p7zip" "dosfstools" "file" "tree" "zip" "unzip" "git" "sysfsutils" "gnupg" "pinentry"
   "unrar" ; NON-FREE
   ;; Useful everyday programs.
   "icecat" "libreoffice" "keepassxc" "rxvt-unicode" "vlc" "pavucontrol"))
