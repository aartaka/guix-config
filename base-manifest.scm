(use-modules (gnu packages))

(specifications->manifest
 '("sbcl-alexandria" "sbcl-cl-ppcre" "sbcl-slynk" "sbcl-bordeaux-threads"
   ;; Fonts
   "font-hack" "font-google-noto" "font-dejavu" "font-liberation" "font-abattis-cantarell"
   ;; Xorg utilities
   "xrdb" "xev" "xfontsel" "xmodmap" "xset" "xsetroot" "xinit" "xinput" "xcape"
   ;; Scripting and everyday programming.
   "python" "sbcl"
   ;; CLI utils.
   "p7zip" "dosfstools" "file" "tree" "zip" "unzip" "git" "sysfsutils" "gnupg"
   "unrar" ; NON-FREE
   ;; Useful everyday programs.
   "ungoogled-chromium" "icecat" "libreoffice" "keepassxc" "rxvt-unicode" "vlc" "pavucontrol"))
