(use-modules (gnu packages)
             (gnu packages audio)
             (gnu packages linux)
             (gnu packages music)
             (gnu packages emacs-xyz))

(packages->manifest
 (list
  ;; Audio infrastructure
  jack-1 alsa-lib
  ;; SuperCollider (broken)
  supercollider emacs-scel
  ;; PureData
  pd libpd))
