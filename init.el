(add-to-list 'load-path "~/.emacs.d/")
(setq custom-file "~/.emacs.d/custom.el")
(require 'cl)

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
(require 'ruby-tools)
(require 'slim-mode)
(require 'yaml-mode)
(require 'auto-complete-config)
(require 'workgroups)
(require 'sr-speedbar)
(require 'key-bindings)
(require 'duplicate-line)
(require 'brightscript-mode)
(require 'linum-off)
(require 'auto-modes-list)
(require 'hooks)
(require 'defaults)
(require 'global-modes)

(load custom-file 'noerror)
(load-theme 'zen-mod)


