(use-modules (gnu packages))

(specifications->manifest
 '("cl-alexandria" "cl-ppcre" "cl-slynk" "cl-bordeaux-threads"
   ;; Fonts
   "font-hack" "font-dejavu" "font-liberation"
   "font-abattis-cantarell" "font-wqy-microhei"
   ;; GuixSD essentials and other mandatory packages
   "glibc-utf8-locales" "libfixposix"
   ;; Xorg utilities
   "xrdb" "xev" "xfontsel" "xmodmap" "xset" "xsetroot" "xinit" "xinput" "xcape" "xclip"
   ;; Bluetooth
   "bluez" "blueman"
   ;; Scripting and everyday programming.
   "python" "sbcl" "ccl"
   ;; CLI utils and other necessary things.
   "p7zip" "dosfstools" "file" "tree" "zip" "unzip" "git" "sysfsutils"
   "gnupg" "pinentry" "emacs-pinentry" "perl"
   "unrar" ; NON-FREE
   ;; Useful everyday programs.
   "ungoogled-chromium" "icecat" "libreoffice" "keepassxc" "rxvt-unicode"
   "vlc" "pavucontrol" "protonvpn-cli"))
