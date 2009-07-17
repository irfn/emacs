(add-to-list 'load-path "~/.emacs.d/packages/cedit")
(add-to-list 'load-path "~/.emacs.d/packages/ecb")
(load-file "~/.emacs.d/packages/cedit/common/cedet.el")
(load-file "~/.emacs.d/packages/ecb/ecb.el")
(require 'ecb)

(setq ecb-layout-name "left14")
(setq ecb-layout-window-sizes (quote (("left14" (0.2564102564102564 . 0.6949152542372882) (0.2564102564102564 . 0.23728813559322035)))))