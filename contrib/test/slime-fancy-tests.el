(require 'slime-fancy)

;; TODO: extract these dynamically from the slime-dependencies of
;; slime-fancy
;; 
(require 'slime-repl-tests nil t)
(require 'slime-autodoc-tests nil t)
(require 'slime-c-p-c-tests nil t)
(require 'slime-editing-commands-tests nil t)
(require 'slime-fancy-inspector-tests nil t)
(require 'slime-fancy-trace-tests nil t)
(require 'slime-fuzzy-tests nil t)
(require 'slime-presentations-tests nil t)
(require 'slime-scratch-tests nil t)
(require 'slime-references-tests nil t)
(require 'slime-package-fu-tests nil t)
(require 'slime-fontifying-fu-tests nil t)
(require 'slime-trace-dialog-tests nil t)

(provide 'slime-fancy-tests)



