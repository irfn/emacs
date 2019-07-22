;; -*- coding: utf-8; lexical-binding: t; -*-

(push (expand-file-name "~/.emacs.d/elisp") load-path)

(defvar best-gc-cons-threshold
  4000000
  "Best default gc threshold value.  Should NOT be too big!")

;; don't GC during startup to save time
(setq gc-cons-threshold most-positive-fixnum)

(setq emacs-load-start-time (current-time))

;; Restore back
(add-hook 'after-init-hook #'(lambda ()
                               (setq gc-cons-threshold best-gc-cons-threshold)))

(tool-bar-mode -1)


;; Skip the default splash screen.
(setq inhibit-startup-screen t)

(setq delete-old-versions -1 )
(setq ring-bell-function 'ignore )
(setq coding-system-for-read 'utf-8 )
(setq coding-system-for-write 'utf-8 )
(setq initial-scratch-message "")
(setq browse-url-browser-function 'browse-url-firefox)
(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
;; Figure out the current hostname.
(setq hostname (replace-regexp-in-string "\\(^[[:space:]\n]*\\|[[:space:]\n]*$\\)" "" (with-output-to-string (call-process "hostname" nil standard-output))))

;; Figure out the path to our .emacs.d by getting the path part of the
;; current file (`init.el`).
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) (file-chase-links load-file-name))))


;; Package Management
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
			 ("gnu"       . "http://elpa.gnu.org/packages/")
			 ("melpa"     . "https://melpa.org/packages/")))
(package-initialize)
(require 'cl)

;; (setq package-list '(use-package))
;; ; install the missing packages
;; (package-refresh-contents)
;; (dolist (package package-list)
;;   (unless (package-installed-p package)
;;     (package-install package)))

(require 'use-package)

;; (use-package auto-package-update
;;   :config
;;   (setq auto-package-update-delete-old-versions t)
;;   (setq auto-package-update-hide-results t)
;;   (auto-package-update-maybe))

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
  :bind (("s-p" . helm-projectile)
	 ("s-t" . projectile-find-file)
	 ))

(use-package magit
  :ensure t)

(use-package org
  :ensure t)

(use-package suscolors-theme
  :ensure t)

(use-package winner
  :defer t)

(use-package rg
  :ensure t)

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))



(load-theme 'suscolors t)

(set-register ?i (cons 'file "~/.emacs.d/init.el"))
(load custom-file t)

;;(require 'lang-python)
(require 'lang-go)
(require 'lang-clojure)
(require 'lang-rust)
(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds."
           (time-to-seconds (time-since emacs-load-start-time))))
