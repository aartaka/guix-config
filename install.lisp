;;;; Guix instrumentation script. Run is as:
;;;;
;;;; LISP --load install.lisp -- profile1 profile2
;;;;
;;;; Where:
;;;; - LISP is one of sbcl, ccl, ecl (tested to work on these at least)
;;;; - profile1 etc. are names of manifests and profiles, so that
;;;;   - The profile declaration is taken from NAME-manifest.scm file (should be present).
;;;;   - The profile path is created at "$HOME/.guix-extra-profiles/NAME-profile/"

(in-package :cl-user)

(require 'asdf)

(let* ((args uiop:*command-line-arguments*)
       ;; Strip down unnecessary hyphens (CCL and ECL require them)
       (args (if (equal "--" (first uiop:*command-line-arguments*))
                 (rest uiop:*command-line-arguments*)
                 args))
       (base-p (find "base" args :test #'equal))
       (profiles (if base-p
                     (remove "base" args :test #'equal)
                     (or args
                         '("emacs" "sec" "dev" "gimp" "sc"
                           "nyxt" "icecat" "chromium" "firefox" "texlive"))))
       (extra-profiles-path (uiop:merge-pathnames* ".guix-extra-profiles" (user-homedir-pathname))))
  (ensure-directories-exist extra-profiles-path :verbose t)
  (setf (uiop:getenv "GUIX_EXTRA_PROFILES")
        (native-namestring extra-profiles-path))
  (format t "Setting up bashrc and xinitrs...~%")
  (flet ((copy-force (from to)
           (uiop:delete-file-if-exists (uiop:parse-native-namestring to))
           (uiop:copy-file (uiop:parse-native-namestring from) to)))
    (copy-force "bash-profile" "~/.bash_profile")
    (copy-force "xinitrc" "~/.xinitrc"))
  (format t "Installing profiles: ~a~%" profiles)
  (dolist (profile profiles)
    (let ((profile-path
            (uiop:merge-pathnames*
             (uiop:strcat ".guix-extra-profiles/"
                          profile "-profile/" profile "-profile")
             (user-homedir-pathname))))
      (ensure-directories-exist profile-path :verbose t)
      (format t "Installing ~a profile...~%" profile)
      (uiop:run-program `("guix" "package"
                                 "-m" ,(uiop:strcat profile "-manifest.scm")
                                 "-p" ,(uiop:native-namestring profile-path))
                        :force-shell t
                        :output :interactive)))
  (when base-p
    (format t "Installing base profile...~%")
    (uiop:run-program `("guix" "package" "-m" "base-manifest.scm")
                      :force-shell t
                      :output :interactive)))

(quit)
