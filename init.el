;; -*- coding: utf-8; lexical-binding: t; -*-
(setq emacs-load-start-time (current-time))
;; Package Management
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
			 ("gnu"       . "http://elpa.gnu.org/packages/")
			 ("melpa"     . "https://melpa.org/packages/")))
(package-initialize)
(require 'use-package)

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
		  (add-hook 'org-mode-hook 'flyspell-mode)
          (add-hook 'org-mode-hook 'org-bullets-mode)))

(use-package org-bullets
  :ensure t
  :config (setq org-bullets-bullet-list '("◉" "⌘" "○" "⌗")))

(require 'ob)
(require 'ob-tangle)

(defun tangle-file (file)
  "Given an 'org-mode' FILE, tangle the source code."
  (org-babel-tangle-file (concat "~/.emacs.d/" file) (concat "~/.emacs.d/elisp/" (substring file 0 -4) ".el") "emacs-lisp"))

(tangle-file "config.org")
(tangle-file "ide.org")
(tangle-file "editor.org")
(tangle-file "docs.org")
(tangle-file "tools.org")
(tangle-file "go.org")
(tangle-file "clojure.org")
(tangle-file "rust.org")
(tangle-file "elixir.org")

(push (expand-file-name "~/.emacs.d/elisp") load-path)
(require 'config)
(require 'ide)
(require 'editor)
(load custom-file t)
(require 'docs)
(require 'tools)

(require 'go)
(require 'clojure)
(require 'rust)
(require 'elixir)

(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds."
           (time-to-seconds (time-since emacs-load-start-time))))
