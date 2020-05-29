(cons*
  (channel
   (name 'nonguix)
   (url "https://gitlab.com/nonguix/nonguix"))
  (channel
   (name 'guix-pkgs)
   (url "https://notabug.org/jlicht/guix-pkgs.git"))
  (channel
   (name 'guix-gaming-games)
   (url "https://gitlab.com/guix-gaming-channels/games.git"))

;; ;; Need to write something like this to use GUIX-GAMING-GAMES channel properly
;;   (define humble-bundle-key "ABCD1234")

;; (make-gaming-config
;;  `((gog ((email "my-gog-email@example.com")
;;          (password "password")))
;;    (factorio ((username "me")
;;               (token "abcdefg123456ABC")))
;;    ;; Humble Bundle order key:
;;    (ftl-faster-than-light ((key ,humble-bundle-key)))
;;    ("quake-3-arena" "/path/to/file")))
  (channel
   (name 'guix-gaming-quake-3)
   (url "https://gitlab.com/guix-gaming-channels/quake-3"))
  (channel
   (name 'guix-gaming-duke-nukem)
   (url "https://gitlab.com/guix-gaming-channels/duke-nukem-3d"))
  ;; (channel
  ;;  (name 'tarsnap)
  ;;  (url "https://github.com/aterweele/tarsnap-guix-channel/tarsnap"))
 %default-channels)
