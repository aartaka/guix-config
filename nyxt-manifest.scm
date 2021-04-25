(use-modules (guix packages)
             (srfi srfi-1))

(specifications->manifest
 (map (compose package-full-name second)
      (package-inputs (load "/home/aartaka/git/nyxt/build-scripts/guix.scm"))))
