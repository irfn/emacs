(eval-after-load "slime"
  '(progn (slime-setup '(slime-repl))))

(defun lisp-path()
	(shell-command-to-string "which sbcl | grep -e '/sbcl$'"))

(defun load-slime()
	(add-to-list 'load-path "~/.emacs.d/packages/slime")
	(setq inferior-lisp-program (lisp-path))
	(require 'slime)
	(slime-setup))


(if (< 0 (length (lisp-path)))
		(load-slime))
(provide 'slime-init)
