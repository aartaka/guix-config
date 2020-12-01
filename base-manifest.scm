(use-modules (gnu packages))

(specifications->manifest
 '("cl-alexandria" "cl-ppcre" "cl-slynk" "cl-bordeaux-threads"
   ;; Fonts
   "font-hack" "font-google-noto" "font-dejavu" "font-liberation"
   "font-abattis-cantarell" "font-wqy-microhei"
   ;; Xorg utilities
   "xrdb" "xev" "xfontsel" "xmodmap" "xset" "xsetroot" "xinit" "xinput" "xcape"
   ;; Scripting and everyday programming.
   "python" "sbcl" "ccl"
   ;; CLI utils.
   "p7zip" "dosfstools" "file" "tree" "zip" "unzip" "git" "sysfsutils" "gnupg"
   "unrar" ; NON-FREE
   ;; Useful everyday programs.
   "ungoogled-chromium" "icecat" "libreoffice" "keepassxc" "rxvt-unicode" "vlc" "pavucontrol"))
