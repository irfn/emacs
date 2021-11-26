;; -*- coding: utf-8; lexical-binding: t; -*-
(setq emacs-load-start-time (current-time))
;; Package Management
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
			 ("gnu"       . "http://elpa.gnu.org/packages/")
			 ("melpa"     . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

(defun my-inhibit-global-linum-mode ()
  "Counter-act `global-linum-mode'."
  (add-hook 'after-change-major-mode-hook
	    (lambda () (linum-mode 0))
	    :append :local))

(use-package org
  :ensure org-plus-contrib
  :config (progn
            (setq org-todo-keywords (quote ((sequence "DISCUSS" "SPIKE" "ESTIMATE" "TODO" "IN-PROGRESS" "REVIEW" "DEFERED" "REDO" "|" "CANCELLED" "PUNTED" "DELEGATED" "DONE")
                                            (sequence "IDEA" "RESEARCHING" "|" "DONE"))))
            (add-hook 'org-shiftup-final-hook 'windmove-up)
            (add-hook 'org-shiftleft-final-hook 'windmove-left)
            (add-hook 'org-shiftdown-final-hook 'windmove-down)
            (add-hook 'org-shiftright-final-hook 'windmove-right)
            )
  :init (progn
		  (add-hook 'org-mode-hook 'my-inhibit-global-linum-mode)
		  (add-hook 'org-mode-hook 'flyspell-mode)
		  ;;(add-hook 'org-mode-hook 'auto-org-md-mode)
      (add-hook 'org-mode-hook 'org-bullets-mode))
  :custom
  (org-archive-location "::* Completed")
  (org-startup-with-inline-images t)
  (org-modules '(org-crypt
                 org-habit
                 org-mouse
                 org-protocol
                 org-tempo))
  (org-tag-alist '(("@yak" . ?y)
                   ("@research" . ?s)
                   ("@reading" . ?r)
                   ("@spike" . ?k)
                   ("@home" . ?h)
                   ("@errands" . ?e)
                   ("@meeting" . ?m)
                   ("@notes" . ?n)
                   ("@writing" . ?w)
                   ("todo" . ?0)
                   ("@post" . ?p)))
  )

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
(tangle-file "erl.org")
(tangle-file "elixir.org")
(tangle-file "haskell.org")
(tangle-file "sml.org")
(tangle-file "ruby.org")
(tangle-file "ts.org")
(tangle-file "email.org")

(push (expand-file-name "~/.emacs.d/elisp") load-path)
(push (expand-file-name "~/.emacs.d/lib") load-path)
(require 'config)
(require 'ide)
(require 'editor)
(load custom-file t)
(require 'docs)
(require 'tools)

(require 'go)
(require 'clojure)
(require 'rust)
(require 'erl)
(require 'elixir)
(require 'haskell)
(require 'sml)
(require 'ruby)
(require 'email)
(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds."
           (time-to-seconds (time-since emacs-load-start-time))))
