(use-modules (gnu packages))

(specifications->manifest
 '("cl-alexandria" "cl-ppcre" "cl-slynk" "cl-bordeaux-threads"
   ;; Fonts
   "font-ibm-plex" "font-dejavu" "font-liberation"
   "font-abattis-cantarell" "font-wqy-microhei"
   ;; GuixSD essentials and other mandatory packages
   "glibc-utf8-locales" "libfixposix"
   ;; Xorg utilities
   "xrdb" "xev" "xfontsel" "xmodmap" "xset" "xsetroot" "xinit" "xinput" "xcape"
   "xclip" "xdg-utils"
   ;; Bluetooth
   "bluez" "blueman"
   ;; Scripting and everyday programming.
   "python" "sbcl" "ccl"
   ;; CLI utils and other necessary things.
   "p7zip" "dosfstools" "file" "tree" "zip" "unzip" "git" "sysfsutils"
   "gnupg" "pinentry" "emacs-pinentry" "perl"
   "unrar" ; NON-FREE
   ;; Nyxt media dependencies.
   "gstreamer" "gst-libav" "gst-plugins-base" "gst-plugins-good"
   "gst-plugins-bad" "gst-plugins-ugly"
   ;; Useful everyday programs.
   "ungoogled-chromium" "icecat" "libreoffice" "keepassxc" "rxvt-unicode"
   "st" "vlc" "pavucontrol" "protonvpn-cli"))
