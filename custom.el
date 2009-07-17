(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))


(setq make-backup-files nil)
(custom-set-variables
 '(show-paren-mode t)
 '(transient-mark-mode t))
(c-mode)

(c-toggle-hungry-state)

(global-set-key "\177" 'c-hungry-delete-backwards)
(global-set-key "\C-d" 'c-hungry-delete-forward)
(fset 'yes-or-no-p 'y-or-n-p)
(setq default-tab-width 2)


(require 'linum)
(custom-set-variables
 '(linum-format "%4d "))
(line-number-mode)
(setq rinari-tags-file-name "eTAGS")