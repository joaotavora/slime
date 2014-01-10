;;; slime-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "hyperspec" "hyperspec.el" (21199 51078 504543
;;;;;;  77000))
;;; Generated autoloads from hyperspec.el

(autoload 'common-lisp-hyperspec "hyperspec" "\
View the documentation on SYMBOL-NAME from the Common Lisp HyperSpec.
If SYMBOL-NAME has more than one definition, all of them are displayed with
your favorite browser in sequence.  The browser should have a \"back\"
function to view the separate definitions.

The Common Lisp HyperSpec is the full ANSI Standard Common Lisp, provided
by Kent Pitman and Xanalys Inc.  By default, the Xanalys Web site is
visited to retrieve the information.  Xanalys Inc. allows you to transfer
the entire Common Lisp HyperSpec to your own site under certain conditions.
Visit http://www.lispworks.com/reference/HyperSpec/ for more information.
If you copy the HyperSpec to another location, customize the variable
`common-lisp-hyperspec-root' to point to that location.

\(fn SYMBOL-NAME)" t nil)

;;;***

;;;### (autoloads nil "slime" "slime.el" (21199 51078 508543 118000))
;;; Generated autoloads from slime.el

(defvar slime-contribs nil "\
A list of contrib packages to load with slime.")

(define-obsolete-variable-alias 'slime-setup-contribs 'slime-contribs "2.3.2")

(autoload 'slime-lisp-mode-hook "slime" "\


\(fn)" nil nil)

(autoload 'slime-mode "slime" "\
\\<slime-mode-map>SLIME: The Superior Lisp Interaction Mode for Emacs (minor-mode).

Commands to compile the current buffer's source file and visually
highlight any resulting compiler notes and warnings:
\\[slime-compile-and-load-file]	- Compile and load the current buffer's file.
\\[slime-compile-file]	- Compile (but not load) the current buffer's file.
\\[slime-compile-defun]	- Compile the top-level form at point.

Commands for visiting compiler notes:
\\[slime-next-note]	- Goto the next form with a compiler note.
\\[slime-previous-note]	- Goto the previous form with a compiler note.
\\[slime-remove-notes]	- Remove compiler-note annotations in buffer.

Finding definitions:
\\[slime-edit-definition]	- Edit the definition of the function called at point.
\\[slime-pop-find-definition-stack]	- Pop the definition stack to go back from a definition.

Documentation commands:
\\[slime-describe-symbol]	- Describe symbol.
\\[slime-apropos]	- Apropos search.
\\[slime-disassemble-symbol]	- Disassemble a function.

Evaluation commands:
\\[slime-eval-defun]	- Evaluate top-level from containing point.
\\[slime-eval-last-expression]	- Evaluate sexp before point.
\\[slime-pprint-eval-last-expression]	- Evaluate sexp before point, pretty-print result.

Full set of commands:
\\{slime-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'slime "slime" "\
Start an inferior^_superior Lisp and connect to its Swank server.

\(fn &optional COMMAND CODING-SYSTEM)" t nil)

(autoload 'slime-connect "slime" "\
Connect to a running Swank server. Return the connection.

\(fn HOST PORT &optional CODING-SYSTEM INTERACTIVE-P)" t nil)

;;;***

;;;### (autoloads nil nil ("slime-tests.el") (21199 51160 57417 25000))

;;;***

(provide 'slime-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; slime-autoloads.el ends here
