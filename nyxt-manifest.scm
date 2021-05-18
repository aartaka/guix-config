(use-modules (guix packages)
             (srfi srfi-1))

(specifications->manifest
 (append
  (map (compose package-full-name second)
       (package-inputs
        (load "/home/aartaka/git/nyxt/build-scripts/guix.scm")))
  (map (compose package-full-name second)
       (package-native-inputs
        (load "/home/aartaka/git/nyxt/build-scripts/guix.scm")))))
