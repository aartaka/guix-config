(use-modules (gnu packages))

(specifications->manifest
 '("cl-alexandria" "cl-ppcre" "cl-slynk" "cl-bordeaux-threads" "cl-cffi"
   ;; Fonts
   "font-ibm-plex" "font-dejavu" "font-liberation"
   "font-abattis-cantarell" "font-wqy-microhei"
   ;; GuixSD essentials and other mandatory packages
   "libfixposix"
   ;; Xorg utilities
   "xrdb" "xev" "xfontsel" "xmodmap" "xset" "xsetroot" "xinit" "xinput" "xcape"
   "xclip" "xdg-utils" "xrandr" "xgamma" "feh" "pulseaudio" "pamixer"
   ;; Bluetooth
   "bluez" "blueman"
   ;; Scripting and everyday programming.
   "python" "sbcl" "ccl"
   ;; CLI utils and other necessary things.
   "p7zip" "dosfstools" "file" "tree" "zip" "unzip" "git" "sysfsutils"
   "gnupg" "pinentry" "emacs-pinentry" "perl" "stapler"
   "unrar" ; NON-FREE
   ;; Nyxt media dependencies.
   "gstreamer" "gst-libav" "gst-plugins-base" "gst-plugins-good"
   "gst-plugins-bad" "gst-plugins-ugly"
   ;; Dwarf Fortress
   "dwarf-fortress"
   ;; Useful everyday programs.
   "libreoffice" "keepassxc" "rxvt-unicode" "st" "vlc" "pavucontrol" "pamixer" "openvpn"
   "nyxt" "ungoogled-chromium" "icecat"))
