(eval-and-compile
  (require 'slime))

(define-slime-contrib slime-fancy
  "Make SLIME fancy."
  (:authors "Matthias Koeppe  <mkoeppe@mail.math.uni-magdeburg.de>"
            "Tobias C Rittweiler <tcr@freebits.de>")
  (:license "GPL")
  (:slime-dependencies slime-repl
                       slime-autodoc
                       slime-c-p-c
                       slime-editing-commands
                       slime-fancy-inspector
                       slime-fancy-trace
                       slime-fuzzy
                       slime-presentations
                       slime-scratch
                       slime-references
                       slime-package-fu
                       slime-fontifying-fu
                       slime-trace-dialog))

(provide 'slime-fancy)
