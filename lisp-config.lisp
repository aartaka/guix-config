;;; The following lines added by ql:add-to-init-file:
#-quicklisp
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

(require "asdf")
#-(or ecl abcl)
(ignore-errors (ql:quickload "cffi"))
#-(or ecl abcl)
(when (find-package "CFFI")
  (push #p"~/.guix-extra-profiles/nyxt-profile/nyxt-profile/lib/"
        (symbol-value (find-symbol "*FOREIGN-LIBRARY-DIRECTORIES*" :CFFI)))
  (push #p"~/.guix-profile/lib/"
        (symbol-value (find-symbol "*FOREIGN-LIBRARY-DIRECTORIES*" :CFFI))))
#+ecl
(require "package-locks")
#+sbcl
(require "sb-introspect")

;; (declaim (optimize speed))
(declaim (optimize (safety 3) (debug 3)))

;; (progn
;;   (push #p"~/git/trivial-gray-streams/" asdf:*central-registry*)
;;   (push #p"~/git/closer-mop/" asdf:*central-registry*)
;;   (push #p"~/git/graven-image/" asdf:*central-registry*))
;; (asdf:load-system :graven-image)
;; (use-package :graven-image)

;;; FIXME: *print-case* :downcase breaks some symbol-generation.
(setf ;; *print-case* :downcase
      *print-circle* nil)
