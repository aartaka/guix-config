(use-modules (guix packages)
             (srfi srfi-1))

(specifications->manifest
 (append
  (map (compose package-name second)
       (package-inputs
        (load (string-append (getenv "HOME") "/git/nyxt/build-scripts/nyxt.scm"))))
  (map (compose package-name second)
       (package-native-inputs
        (load (string-append (getenv "HOME") "/git/nyxt/build-scripts/nyxt.scm"))))
  (list "cl-osicat" "cl-markup")))
