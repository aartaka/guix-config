(use-modules (gnu)
             (gnu packages bash)
             (gnu packages certs)
             (gnu packages emacs)
	         (gnu packages emacs-xyz)
	         (gnu packages fonts)
             (gnu packages version-control)
             (gnu packages xorg)

             (gnu services dbus)
             (gnu services desktop)
             (gnu services networking)
             (gnu services web)
             (gnu services xorg)
             (gnu system nss)

             (guix gexp)
             (guix packages)

             (nongnu packages linux)        ; NON-FREE
             (nongnu system linux-initrd)   ; NON-FREE
             (srfi srfi-1))

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
               (comment "Artyom Bologov")
               (group "users")
               (supplementary-groups '("wheel" "netdev" "audio" "video" "input")))
              %base-user-accounts))

 (packages
  (cons*
   nss-certs xinit xorg-server emacs emacs-exwm font-hack git %base-packages))

 (services (cons* (service tor-service-type)
                  (service openntpd-service-type)
                  (service connman-service-type)
                  (service tailon-service-type
                           (tailon-configuration
                            (config-file
                             (tailon-configuration-file
                              ;; 8080 is used for everything
                              (bind "localhost:8081")))))
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
                  (remove (lambda (s) (or
                                       (eq? (service-kind s) ntp-service-type)
                                       (eq? (service-kind s) network-manager-service-type)))
                          %desktop-services)))

 ;; Allow resolution of '.local' host names with mDNS.
 (name-service-switch %mdns-host-lookup-nss))
