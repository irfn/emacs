(add-to-list 'load-path "~/.emacs.d/packages/yaml-mode")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(provide 'yaml-init)