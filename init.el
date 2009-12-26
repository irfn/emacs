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
