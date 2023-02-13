(use-modules (gnu)
             (gnu packages bash)
             (gnu packages certs)
             (gnu packages databases)
             (gnu packages emacs)
	         (gnu packages fonts)
             (gnu packages lisp)
             (gnu packages lisp-xyz)
             (gnu packages version-control)
             (gnu packages package-management)
             (gnu packages suckless)
             (gnu packages xdisorg)
             (gnu packages xorg)
             (gnu packages wm)

             (gnu services databases)
             (gnu services dbus)
             (gnu services desktop)
             (gnu services docker)
             (gnu services networking)
             (gnu services nix)
             (gnu services web)
             (gnu services xorg)
             (gnu system nss)

             (guix gexp)
             (guix packages)
             (guix utils)

             (nongnu packages linux)        ; NON-FREE
             (nongnu system linux-initrd)   ; NON-FREE

             (srfi srfi-1)

             (ice-9 match))

(define %additional-xorg-configuration
  "Section \"InputClass\"
   Identifier \"Touchpads\"
   Driver \"libinput\"
   MatchDevicePath \"/dev/input/event*\"
   MatchIsTouchpad \"on\"

   Option \"DisableWhileTyping\" \"on\"
   Option \"MiddleEmulation\" \"on\"
   Option \"ClickMethod\" \"clickfinger\"
   Option \"Tapping\" \"on\"
   Option \"TappingButtonMap\" \"lrm\"
   Option \"TappingDrag\" \"on\"
   Option \"ScrollMethod\" \"twofinger\"
   Option \"NaturalScrolling\" \"true\"
  EndSection")

(define custom-sbcl
  (package
   (inherit sbcl)
   (arguments
    `(#:phases
      (modify-phases %standard-phases
                     ,@(map (lambda (phase)
                              (match phase
                                (('replace ''build ((or 'lambda 'lambda*) args . body))
                                 `(replace 'build
                                           (lambda* ,args
                                             ,@(map (lambda (form)
                                                      (match form
                                                        (('invoke "sh" "make.sh" . args)
                                                         `(invoke "sh" "make.sh"
                                                                  ,@(append (remove (lambda (a)
                                                                                      (and (string? a)
                                                                                           (string-prefix? "--with" a)))
                                                                                    args)
                                                                            (list "--fancy" "--with-sb-simd"))))
                                                        (_ form)))
                                                    body))))
                                (_ phase)))
                            (cddadr (find-tail (lambda (arg) (eq? #:phases arg))
                                               (package-arguments sbcl)))))
      ,@(cddr (find-tail (lambda (arg) (eq? #:phases arg))
                         (package-arguments sbcl)))))))

(operating-system
 (host-name "paranoidal")
 (timezone "Asia/Yerevan")

 (kernel linux)                        ; NON-FREE
 (kernel-arguments
  (cons* "i915.i915_enable_fbc=1"
         "i915.i915_enable_fbc=1"
         "i915.lvds_downclock=1"
         %default-kernel-arguments))
 (initrd microcode-initrd)             ; NON-FREE
 (firmware (cons* iwlwifi-firmware     ; NON-FREE
                  sof-firmware
                  %base-firmware))

 (bootloader (bootloader-configuration
              (bootloader grub-efi-bootloader)
              (targets '("/boot/efi"))
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
   nss-certs xinit xorg-server custom-sbcl cl-slynk stumpwm `(,stumpwm "lib") font-hack git nix
   %base-packages))

 (services (cons* (service tor-service-type)
                  (service docker-service-type)
                  (service postgresql-service-type
                           (postgresql-configuration
                            (postgresql postgresql)
                            (config-file
                             (postgresql-config-file
                              (log-destination "stderr")
                              (hba-file
                               (plain-file "pg_hba.conf"
                                           "
local	all	all			trust
host	all	all	127.0.0.1/32 	md5
host	all	all	::1/128 	md5"))))))
                 (service postgresql-role-service-type
                           (postgresql-role-configuration
                            (roles (list (postgresql-role
                                          (name "aartaka")
                                          (create-database? #t))
                                         (postgresql-role
                                          (name "postgres")
                                          (permissions
                                           '(bypassrls createdb createrole login replication superuser))
                                          (create-database? #t))))))
                  (service openntpd-service-type)
                  (service connman-service-type)
                  (service bluetooth-service-type)
                  (service tailon-service-type
                           (tailon-configuration
                            (config-file
                             (tailon-configuration-file
                              ;; 8080 is used for everything
                              (bind "localhost:8081")))))
                  (service nix-service-type)
                  (pam-limits-service
                   (list
                    (pam-limits-entry "@realtime" 'both 'rtprio 99)
                    (pam-limits-entry "@realtime" 'both 'memlock 'unlimited)))
                  (set-xorg-configuration
                   (xorg-configuration
                    (modules
                     (cons xf86-input-wacom
                           (remove (lambda (m) (eq? m xf86-input-synaptics))
                                   %default-xorg-modules)))
                    (keyboard-layout
                     (keyboard-layout
                      "us,ru"
                      #:options '("ctrl:nocaps"
                                  "terminate:ctrl_alt_bksp"
                                  "grp:rctrl_toggle")))
                    (extra-config (list %additional-xorg-configuration)))
                   gdm-service-type)
                  (screen-locker-service slock)
                  (extra-special-file "/bin/bash" (file-append bash "/bin/bash"))
                  (modify-services %desktop-services
                    (delete network-manager-service-type)
                    (delete ntp-service-type)
                    (guix-service-type
                     config => (guix-configuration
                                (inherit config)
                                (substitute-urls
                                 (append (list "https://substitutes.nonguix.org")
                                         %default-substitute-urls))
                                (authorized-keys
                                 (append (list (local-file "./nonguix-signing-key.pub"))
                                         %default-authorized-guix-keys)))))))

 ;; Allow resolution of '.local' host names with mDNS.
 (name-service-switch %mdns-host-lookup-nss))
