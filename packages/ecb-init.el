(add-to-list 'load-path "~/.emacs.d/packages/cedit")
(add-to-list 'load-path "~/.emacs.d/packages/ecb")
(load-file "~/.emacs.d/packages/cedit/common/cedet.el")
(load-file "~/.emacs.d/packages/ecb/ecb.el")
(require 'ecb)

;; Show the source file under the directories
;;(setq ecb-show-sources-in-directories-buffer '("left7" "left13" "left14" "left15"))

(custom-set-variables
 '(ecb-layout-window-sizes (quote (("left3" (0.1935483870967742 . 0.43137254901960786) (0.1935483870967742 . 0.3333333333333333) (0.1935483870967742 . 0.21568627450980393)))))
 '(ecb-options-version "2.33beta2")
 '(ecb-source-path my-global-projects-dirs)
 '(ecb-tip-of-the-day nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(case-fold-search nil)
 '(cua-mode nil nil (cua-base))
 '(transient-mark-mode t)
 '(show-paren-mode t))

(ecb-layout-switch "left3")
(ecb-activate)

(ecb-activate)
(ecb-toggle-ecb-windows)