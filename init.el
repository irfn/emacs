(add-to-list 'load-path "~/.emacs.d/")
(setq custom-file "~/.emacs.d/custom.el")


(require 'marmalade)
(require 'nginx-mode)
(require 'project-mode)
(require 'campfire)
(require 'rvm)
(require 'rspec-mode)
(require 'gtags)

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
