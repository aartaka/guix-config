(defmacro defmethod-with-better-print (name arglist)
  `(defmethod ,name :around (,@arglist)
     (declare (ignore ,@(loop for a in arglist
                              unless (member a lambda-list-keywords)
                                collect a)))
     (let ((*print-case* :downcase)
           (*print-level* 2)
           (*print-length* 7))
       (call-next-method))))

(defmethod-with-better-print
    gimage:apropos* (string &optional package external-only docs-too))
(defmethod-with-better-print
    gimage:describe* (object &optional stream ignore-methods))
(defmethod-with-better-print gimage:inspect* (object))

(defmethod gimage:apropos-list* :around (string &optional packages external-only docs-too)
  "Sort symbols by the relation of subSTRING count to the length of symbol."
  (declare (ignorable packages external-only docs-too))
  (let ((result (call-next-method)))
    (flet ((count-appearances (sub string)
             (let ((match-count 0))
               (uiop:frob-substrings
                string (list sub)
                (lambda (sub frob)
                  (incf match-count)
                  (funcall frob sub)))
               (/ match-count (length string)))))
      (sort
       (remove-duplicates result)
       #'> :key (lambda (sym)
                  (+ (count-appearances (string string) (string sym))
                     (count-appearances (string string) (documenation sym t))))))))
