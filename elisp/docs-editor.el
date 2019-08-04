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

(defun ob-fix-inline-images ()
  (when org-inline-image-overlays
    (org-redisplay-inline-images)))

(defun ob-do-load-langs ()
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((ruby . t))))

(defun ob-confirm-babel-evaluate (lang body)
  (not (member lang '("python" "go" "ruby" "clojure" "sh"))))



(use-package ob
  :defer t
  :config (setq org-confirm-babel-evaluate 'ob-confirm-babel-evaluate)
  :init
  (progn
    (add-hook 'org-mode-hook 'ob-do-load-langs)
    ;; Fix redisplay of inline images after a code block evaluation.
    (add-hook 'org-babel-after-execute-hook 'ob-fix-inline-images)))

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(provide 'docs-editor)
