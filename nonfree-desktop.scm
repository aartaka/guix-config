(use-modules (gnu)
             (gnu packages bash)
             (gnu packages certs)
             (gnu packages emacs)
	         (gnu packages emacs-xyz)
	         (gnu packages fonts)
             (gnu packages version-control)
             (gnu packages xdisorg)
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

(define %additional-xorg-configuration
   "Section \"InputClass\"
    Identifier \"touchpad\"
    Driver \"synaptics\"
    MatchIsTouchpad \"on\"
        Option \"TapButton1\" \"1\"
        Option \"TapButton2\" \"3\"
        Option \"TapButton3\" \"2\"
        Option \"VertTwoFingerScroll\" \"on\"
        Option \"HorizTwoFingerScroll\" \"on\"
        Option \"FingerLow\" \"25\"
        Option \"FingerHigh\" \"50\"
        Option \"MaxTapTime\" \"125\"
        Option \"VertScrollDelta\" \"-48\"
        Option \"HorizScrollDelta\" \"-48\"
EndSection")

(operating-system
 (host-name "paranoidal")
 (timezone "Asia/Yekaterinburg")

 (kernel linux)                       ; NON-FREE
 (initrd microcode-initrd)            ; NON-FREE
 (firmware (cons* iwlwifi-firmware     ; NON-FREE
                  sof-firmware
                  %base-firmware))

 (bootloader (bootloader-configuration
              (bootloader grub-efi-bootloader)
              (target "/boot/efi")
              (keyboard-layout #f)))

 (mapped-devices
  (list (mapped-device
         (source "/dev/nvme0n1p2")
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
		               (type "vfat")))
                %base-file-systems))

 (users (cons (user-account
	           (name "aartaka")
	           (comment "Artyom Bologov")
	           (group "users")
	           (supplementary-groups '("wheel" "netdev" "audio" "video" "input" "lp")))
              %base-user-accounts))

 (packages
  (cons*
   nss-certs xinit xorg-server emacs emacs-exwm font-hack git %base-packages))

 (services (cons* (service tor-service-type)
                  (service openntpd-service-type)
                  (service connman-service-type)
                  (service bluetooth-service-type)
                  (service tailon-service-type
                           (tailon-configuration
                            (config-file
                             (tailon-configuration-file
                              ;; 8080 is used for everything
                              (bind "localhost:8081")))))
                  (pam-limits-service
                   (list
                    (pam-limits-entry "@realtime" 'both 'rtprio 99)
                    (pam-limits-entry "@realtime" 'both 'memlock 'unlimited)))
                  (set-xorg-configuration
                   (xorg-configuration
                    (keyboard-layout
                     (keyboard-layout
                      "us,ru"
                      #:options '("ctrl:nocaps"
                                  "terminate:ctrl_alt_bksp"
                                  "grp:rctrl_toggle")))
                    (extra-config (list %additional-xorg-configuration)))
                   gdm-service-type)
                  (screen-locker-service xlockmore "xlock")
                  (extra-special-file "/bin/bash" (file-append bash "/bin/bash"))
                  (remove (lambda (s) (or
				                       (eq? (service-kind s) ntp-service-type)
				                       (eq? (service-kind s) network-manager-service-type)))
                          %desktop-services)))

 ;; Allow resolution of '.local' host names with mDNS.
 (name-service-switch %mdns-host-lookup-nss))
