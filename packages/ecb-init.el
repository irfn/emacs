(add-to-list 'load-path "~/.emacs.d/packages/cedet")
(add-to-list 'load-path "~/.emacs.d/packages/ecb")
(load-file "~/.emacs.d/packages/cedet/common/cedet.el")

(global-ede-mode 1)                    
(semantic-load-enable-code-helpers)    
(global-srecode-minor-mode 1) 

(require 'ecb)

(setq ecb-auto-compatibility-check nil)
(setq ecb-auto-activate t)
(setq ecb-fix-window-size (quote width))
(setq ecb-compile-window-width (quote edit-window))
