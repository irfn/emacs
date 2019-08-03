(defun my-inhibit-global-linum-mode ()
  "Counter-act `global-linum-mode'."
  (add-hook 'after-change-major-mode-hook
	    (lambda () (linum-mode 0))
	    :append :local))

(use-package org
  :ensure t
  :config (progn
	    (setq org-todo-keywords (quote ((sequence "DISCUSS" "TODO" "IN-PROGRESS" "DONE"))))
	    (setq org-bullets-bullet-list '("◉" "○" "⌗" "◆")))
  :init (add-hook 'org-mode-hook 'my-inhibit-global-linum-mode))

(use-package org-present
  :ensure t
  :bind (("<f8>" . org-present)))

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(provide 'docs-editor)
