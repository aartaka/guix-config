(use-modules (gnu packages)
             (gnu packages audio)
             (gnu packages linux)
             (gnu packages music)
             (gnu packages emacs-xyz)
             (gnu packages sdl))

(packages->manifest
 (list
  ;; Audio infrastructure
  jack-1 alsa-lib sdl2
  ;; SuperCollider (broken)
  supercollider emacs-scel
  ;; PureData
  pd libpd))
