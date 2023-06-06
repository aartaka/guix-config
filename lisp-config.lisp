;;; The following lines added by ql:add-to-init-file:
#-quicklisp
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

(require "asdf")
#-ecl
(progn
  (require "cffi")
  (push #p"~/.guix-extra-profiles/nyxt-profile/nyxt-profile/lib/" cffi:*foreign-library-directories*)
  (push #p"~/.guix-profile/lib/" cffi:*foreign-library-directories*))
#+ecl
(require "package-locks")
#+sbcl
(require "sb-introspect")

;; (declaim (optimize (safety 3) (debug 3)))
;; (declaim (optimize speed))
