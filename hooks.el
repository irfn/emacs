(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))


(add-hook 'ruby-mode-hook (lambda () 
  (gtags-mode 1)))

(provide 'hooks)