(use-modules (gnu packages)
             (gnu packages gimp)

             (guix packages)
             (guix download))

(packages->manifest
 (lisp gimp)) ; TODO: add the necessary fonts'n'stuff later
