(setq load-path (cons "~/.emacs.d" load-path))
(setq load-path (cons "~/.emacs.d/packages" load-path))
(load-file "~/.emacs.d/custom.el")
(if (eq system-type 'darwin)
    (setq system-name (car (split-string system-name "\\."))))
(load-file "~/.emacs.d/paths.el")

;; Enable/ Disable by commenting out lines
(load-file "~/.emacs.d/packages/distel-init.el")
(load-file "~/.emacs.d/packages/ecb-init.el")
(load-file "~/.emacs.d/packages/magit-init.el")
(load-file "~/.emacs.d/packages/yas-init.el")
(load-file "~/.emacs.d/packages/rinari-init.el")
(load-file "~/.emacs.d/packages/rspec-init.el")
(load-file "~/.emacs.d/packages/textmate-init.el")
;;(load-file "~/.emacs.d/packages/haml-init.el")
(load-file "~/.emacs.d/packages/yaml-init.el")
(load-file "~/.emacs.d/packages/twit-el-init.el")
(load-file "~/.emacs.d/packages/clojure-init.el")
(load-file "~/.emacs.d/packages/haskell-init.el")
(load-file "~/.emacs.d/packages/php-mode.el")
(load-file "~/.emacs.d/packages/linum-init.el")
(load-file "~/.emacs.d/packages/markdown-init.el")
(load-file "~/.emacs.d/packages/js2-init.el")
(load-file "~/.emacs.d/packages/color-theme-init.el")
(load-file "~/.emacs.d/packages/inkpot-init.el")
(load-file "~/.emacs.d/packages/zen-init.el")
(load-file "~/.emacs.d/packages/highlight-current-line.el")
(load "~/.emacs.d/packages/nxhtml/autostart.el")
;;(load-file "~/.emacs.d/packages/twilight-init.el")
;;(load-file "~/.emacs.d/packages/zenburn-init")


;; Default Loads (These come pre-packaged with Aquamacs)
(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'ido)
(org-mode)
(color-theme-zen-and-art)
(put 'dired-find-alternate-file 'disabled nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(case-fold-search nil)
 '(cua-mode nil nil (cua-base))
 '(ecb-layout-name "left3")
 '(ecb-layout-window-sizes (quote (("left3" (0.1935483870967742 . 0.43137254901960786) (0.1935483870967742 . 0.3333333333333333) (0.1935483870967742 . 0.21568627450980393)))))
 '(ecb-options-version "2.33beta2")
 '(ecb-source-path my-global-projects-dirs)
 '(ecb-tip-of-the-day nil)
 '(linum-format "%4d ")
 '(mumamo-chunk-coloring 0)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) (:background "#2A2828"))))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) (:background "#373436")))))

(ecb-toggle-ecb-windows)