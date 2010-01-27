(add-to-list 'load-path "~/.emacs.d/packages/cedet")
(add-to-list 'load-path "~/.emacs.d/packages/ecb")
(load-file "~/.emacs.d/packages/cedet/common/cedet.el")
(load-file "~/.emacs.d/packages/ecb/ecb.el")
(require 'ecb)

(ecb-activate)
