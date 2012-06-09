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

(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-js starter-kit-ruby undo-tree yaml-mode yasnippet rinari full-ack workgroups)
  "A list of packages to ensure are installed at launch.")

;;(dolist (p my-packages)
;;  (when (not (package-installed p))
;;    (package-install p)))

(require 'marmalade)
(require 'nginx-mode)
(require 'project-mode)
(require 'campfire)
(require 'rvm)
(require 'rspec-mode)
(require 'slim-mode)
(require 'yaml-mode)
(require 'auto-complete-config)
(require 'workgroups)
(require 'sr-speedbar)
(require 'key-bindings)
(require 'duplicate-line)
(require 'brightscript-mode)


(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4.20110207/dict")

(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
(global-auto-complete-mode t)
(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue")
(setq ac-auto-start nil)
(setq ac-dwim t)
(auto-complete-mode)

(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
(add-to-list 'auto-mode-alist '("\\.brs$" . brightscript-mode))
(autoload 'gtags-mode "gtags" "" t)

(add-hook 'ruby-mode-hook (lambda () 
  (gtags-mode 1)))

(defun gtags-root-dir ()
  "Returns GTAGS root directory or nil if doesn't exist."
  (with-temp-buffer
    (if (zerop (call-process "global" nil t nil "-pr"))
        (buffer-substring (point-min) (1- (point-max)))
      nil)))
(defun gtags-update ()
  "Make GTAGS incremental update"
  (call-process "global" nil nil nil "-u"))
(defun gtags-update-hook ()
  (when (gtags-root-dir)
    (gtags-update)))

(load custom-file 'noerror)
(line-number-mode)
(linum-mode)
(highline-mode)
(cua-mode t)
(yas/global-mode 1) 
(set-face-background 'highline-face "#08252F")
(menu-bar-mode t)
(load-theme 'zen-mod)
(windmove-default-keybindings)

