(require 'f)

(defvar sql-indent-support-path
  (f-dirname load-file-name))

(defvar sql-indent-features-path
  (f-parent sql-indent-support-path))

(defvar sql-indent-root-path
  (f-parent sql-indent-features-path))

(add-to-list 'load-path sql-indent-root-path)

;; Ensure that we don't load old byte-compiled versions
(let ((load-prefer-newer t))
  (require 'sql-indent)
  (require 'espuds)
  (require 'ert))

(Setup
 ;; Before anything has run
 )

(Before
 ;; Before each scenario is run
 )

(After
 ;; After each scenario is run
 )

(Teardown
 ;; After when everything has been run
 )

;; This fixes an issue in emacs 25.1 where the debugger would be invoked
;; incorrectly, breaking ert.
(when (and (= emacs-major-version 25) (< emacs-minor-version 2))
  (require 'cl-preloaded)
  (setf (symbol-function 'cl--assertion-failed)
        (lambda (form &optional string sargs args)
          "This function has been modified by ecukes to remove an incorrect manual call
to the debugger in emacs 25.1. The modified version should only be used for
running tests."
          (if string
              (apply #'error string (append sargs args))
            (signal 'cl-assertion-failed `(,form ,@sargs))))))
