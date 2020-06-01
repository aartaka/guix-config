(use-modules (gnu)
             (gnu packages admin)
             (gnu packages bash)
             (gnu packages certs)
             (gnu packages chromium)
             (gnu packages compression)
             (gnu packages disk)
             (gnu packages emacs)
             (gnu packages emacs-xyz)
             (gnu packages file)
             (gnu packages fonts)
             (gnu packages fontutils)
             (gnu packages gcc)
             (gnu packages ghostscript)
             (gnu packages gnuzilla)
             (gnu packages javascript)
             (gnu packages libreoffice)
             (gnu packages linux)
             (gnu packages lisp)
             (gnu packages lisp-xyz)
             (gnu packages llvm)
             (gnu packages messaging)
             (gnu packages networking)
             (gnu packages password-utils)
             (gnu packages pdf)
             (gnu packages pulseaudio)
             (gnu packages python)
             (gnu packages tls)
             (gnu packages version-control)
             (gnu packages video)
             (gnu packages web-browsers)
             (gnu packages wm)
             (gnu packages xdisorg)
             (gnu packages xorg)
             (gnu system nss)

             (guix gexp)
             (guix packages)

             (nongnu packages compression)  ; NON-FREE
             (nongnu packages emacs)        ; NON-FREE
             (nongnu packages linux)        ; NON-FREE
             (nongnu system linux-initrd)   ; NON-FREE
             (srfi srfi-1))

(use-service-modules desktop
                     dbus
                     xorg
                     networking)


(operating-system
 (host-name "paranoidal")
 (timezone "Asia/Yekaterinburg")

 (kernel linux)                       ; NON-FREE
 (initrd microcode-initrd)            ; NON-FREE
 (firmware (cons* atheros-firmware    ; NON-FREE
                  %base-firmware))

 (bootloader (bootloader-configuration
              (bootloader grub-efi-bootloader)
              (target "/boot/efi")
              (keyboard-layout #f)))

 (mapped-devices
  (list (mapped-device
         (source "/dev/sdb3")
         (target "cryptroot")
         (type luks-device-mapping))))

 (file-systems (append
                (list (file-system
                       (device (file-system-label "CRYPTROOT"))
                       (mount-point "/")
                       (type "btrfs")
                       (dependencies mapped-devices))
                      (file-system
                       (device (file-system-label "ESP"))
                       (mount-point "/boot/efi")
                       (type "vfat"))
                      (file-system
                       (device (file-system-label "STORAGE"))
                       (mount-point "/storage")
                       (type "btrfs")))
                %base-file-systems))

 (swap-devices `("dev/sdb2"))

 (users (cons (user-account
               (name "aartaka")
               (comment "The master of the paranoidal machine")
               (group "users")
               (supplementary-groups '("wheel" "netdev" "audio" "video" "input")))
              %base-user-accounts))

 (skeletons `((".xsession" ,(plain-file "xsession" "#!/bin/sh
sh export SBCL_HOME=\"$(dirname -- $(dirname -- $(readlink -f $(which sbcl))))/lib/sbcl/\"
xrdb ~/.Xresources
sh export GDK_CORE_DEVICE_EVENTS=1
eval `guix package --search-paths`

exec stumpwm"))))


 (packages
  (cons*
   nss-certs ghostscript
   ;; Because "Emacs is the best operating system..."
   emacs emacs-sly-quicklisp emacs-guix emacs-sly poppler emacs-pdf-tools
   clhs ; NON-FREE
   ;; Lisp dependencies of my stumpwm. Somewhat awkward way to load deps. Meh.
   sbcl sbcl-cl-ppcre sbcl-clx-truetype sbcl-stumpwm-ttf-fonts sbcl-dexador sbcl-slynk
   ;; Xorg/linux utilities for stumpwm and stumpwm itself.
   xrdb xev xfontsel xmodmap xset xsetroot xinit xinput xorg-server stumpwm
   ;; Scripting and utility-programming stuff
   python
   ;; CLI utils
   p7zip dosfstools file tree unzip git sysfsutils
   unrar ; NON-FREE
   ;; Useful everyday programs.
   icecat next ungoogled-chromium ; Yep, I need all of them
   libreoffice keepassxc rxvt-unicode pidgin vlc pavucontrol
   %base-packages))

 (services (cons* (service tor-service-type)
                  (service openntpd-service-type)
                  (set-xorg-configuration
                   (xorg-configuration
                    (keyboard-layout
                     (keyboard-layout
                      "us,ru"
                      #:options '("ctrl:nocaps"
                                  "terminate:ctrl_alt_bksp"
                                  "grp:rctrl_toggle"))))
                   gdm-service-type)
                  (extra-special-file "/bin/bash" (file-append bash "/bin/bash"))
                  (remove (lambda (s) (eq? (service-kind s) ntp-service-type))
                          %desktop-services)))

 ;; Allow resolution of '.local' host names with mDNS.
 (name-service-switch %mdns-host-lookup-nss))
