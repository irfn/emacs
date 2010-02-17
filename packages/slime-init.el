(eval-after-load "slime"
  '(progn (slime-setup '(slime-repl))))

(add-to-list 'load-path "~/.emacs.d/packages/slime")
(setq inferior-lisp-program "/opt/local/bin/sbcl")
(require 'slime)
(slime-setup)
;;(provide 'slime-init)
