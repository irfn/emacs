(add-to-list 'load-path "~/.emacs.d/")
(setq custom-file "~/.emacs.d/custom.el")
(require 'cl)
(defun concatString (list)
  "A non-recursive function that concatenates a list of strings."
  (if (listp list)
      (let ((result ""))
        (dolist (item list)
          (if (stringp item)
              (setq result (concatenate 'string result item ":"))))
        result)))

;;(add-hook 'compilation-finish-functions 'reset-path)
;;(defun reset-path (buffer &optional stat)
;;  "change tmp to nfs"
;;  (setenv "PATH" (concatString exec-path)))

(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin")))

(require 'marmalade)
(require 'nginx-mode)
(require 'project-mode)
(require 'campfire)
(require 'rvm)
(require 'rspec-mode)
(require 'gtags)
(require 'slim-mode)
(require 'yaml-mode)

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

(load custom-file 'noerror)
(line-number-mode)
(linum-mode)
(highline-mode)
(cua-mode t)
(yas/global-mode 1) 
(set-face-background 'highline-face "#08252F")
(menu-bar-mode t)
