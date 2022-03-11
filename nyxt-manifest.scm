(use-modules (guix packages)
             (srfi srfi-1))

(specifications->manifest
 (append
  (map (compose package-name second)
       (package-inputs
        (load "/home/aartaka/git/nyxt/build-scripts/nyxt.scm")))
  (map (compose package-name second)
       (package-native-inputs
        (load "/home/aartaka/git/nyxt/build-scripts/nyxt.scm")))
  (list "cl-osicat" "cl-markup")))
