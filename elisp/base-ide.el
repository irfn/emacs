(use-package exec-path-from-shell
  :ensure t
  :init
  (when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize)))

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
         ("M-<f5>" . helm-find-files)
         ([f10] . helm-buffers-list)
         ([S-f10] . helm-recentf)))

;; Project management
(use-package projectile
  :ensure t
  :init
  :delight '(:eval (concat " " (projectile-project-name)))
  (setq projectile-completion-system 'helm)
  :config
  (projectile-mode))

(use-package helm-projectile
  :ensure t
  :bind (("s-p" . helm-projectile-switch-project)
	 ("s-t" . helm-projectile-find-file)
	 ))

(use-package rg
  :ensure t)

(use-package helm-rg
  :ensure t
  :bind (("M-RET /" . helm-projectile-rg)
	 ))

(use-package magit
  :ensure t)

(use-package winner
  :ensure t
  )
(use-package yasnippet
  :ensure t
  :defer t
  :init (yas-global-mode t))

(use-package doom-snippets
  :load-path "~/dev/etc/doom-snippets"
  :after yasnippet)

(use-package company
  :ensure t
  :config (progn
            (setq company-idle-delay 0)
            (setq company-minimum-prefix-length 1)
            (setq company-tooltip-align-annotations t)
            ))

(use-package lsp-mode
  :ensure t
  ;; :custom (lsp-gopls-server-args '("-debug" "127.0.0.1:0"))
  :commands (lsp lsp-deferred))


(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config (progn
            ;; disable inline documentation
            (setq lsp-ui-sideline-enable nil)
            ;; disable showing docs on hover at the top of the window
            (setq lsp-ui-doc-enable nil)))

(use-package company-lsp
  :ensure t
  :commands company-lsp)

(use-package flycheck
  :ensure t)

(use-package hi-lock
  :bind (("M-RET h l" . highlight-lines-matching-regexp)
         ("M-RET h r" . highlight-regexp)
         ("M-RET h w" . highlight-phrase)
	 ("M-RET h 0" . hi-lock-unface-buffer)))

(provide 'base-ide)
