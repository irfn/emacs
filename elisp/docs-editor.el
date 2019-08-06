(defun my-inhibit-global-linum-mode ()
  "Counter-act `global-linum-mode'."
  (add-hook 'after-change-major-mode-hook
	    (lambda () (linum-mode 0))
	    :append :local))

(use-package org
  :ensure t
  :config (progn
	    (setq org-todo-keywords (quote ((sequence "DISCUSS" "TODO" "IN-PROGRESS" "REVIEW" "DELEGATED" "DEFERED" "DONE")))))
  :init (progn
		  (add-hook 'org-mode-hook 'my-inhibit-global-linum-mode)
		  (add-hook 'org-mode-hook 'flyspell-mode)))

(use-package org-present
  :ensure t
  :bind (("<f8>" . org-present)))

(defun ob-fix-inline-images ()
  (when org-inline-image-overlays
    (org-redisplay-inline-images)))

(defun ob-do-load-langs ()
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((ruby . t)
     (ditaa . t)
     (plantuml . t))))

(defun ob-confirm-babel-evaluate (lang body)
  (not (member lang '("python" "go" "ruby" "clojure" "sh" "ditaa" "plantuml"))))

(use-package ob
  :defer t
  :config (setq org-confirm-babel-evaluate 'ob-confirm-babel-evaluate)
  :init
  (progn
    (add-hook 'org-mode-hook 'ob-do-load-langs)
    ;; Fix redisplay of inline images after a code block evaluation.
    (add-hook 'org-babel-after-execute-hook 'ob-fix-inline-images)))

(use-package company-emoji
  :ensure t
  :init (add-to-list 'company-backends 'company-emoji))

(use-package emoji-cheat-sheet-plus
  :ensure t
  :defer t
  :init
  (progn
    ;; enabled emoji in buffer
    (add-hook 'org-mode-hook 'emoji-cheat-sheet-plus-display-mode)
    (add-hook 'markdown-mode-hook 'emoji-cheat-sheet-plus-display-mode)))

(use-package org-bullets
  :ensure t
  :config (setq org-bullets-bullet-list '("◉" "⌘" "○" "⌗"))
  :init (add-hook 'org-mode-hook 'org-bullets-mode))

(use-package plantuml-mode
  :ensure t
  :init (setq org-plantuml-jar-path
	      (expand-file-name "/usr/local/Cellar/plantuml/1.2019.8/libexec/plantuml.jar"))
)

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(provide 'docs-editor)
