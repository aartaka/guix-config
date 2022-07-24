(use-modules (gnu packages)
             (gnu packages audio)
             (gnu packages music)
             (gnu packages emacs-xyz))

(packages->manifest
 (list
  ;; SuperCollider (broken)
  jack-1 supercollider emacs-scel
  ;; PureData
  pd libpd))
