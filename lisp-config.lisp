;;; The following lines added by ql:add-to-init-file:
#-quicklisp
(let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp"
                                       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

(require "asdf")
#-(or ecl abcl)
(require "cffi")
#-(or ecl abcl)
(progn
  (push #p"~/.guix-extra-profiles/nyxt-profile/nyxt-profile/lib/" cffi:*foreign-library-directories*)
  (push #p"~/.guix-profile/lib/" cffi:*foreign-library-directories*))
#+ecl
(require "package-locks")
#+sbcl
(require "sb-introspect")

(declaim (optimize (safety 3) (debug 3)))
;; (declaim (optimize speed))

;;; *print-case* :downcase breaks some symbol-generation. Any way to
;;; fix it?
(setf ;; *print-case* :downcase
      *print-circle* nil)
