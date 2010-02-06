(setq load-path (cons  "/opt/local/lib/erlang/lib/tools-2.6.4/emacs"
      load-path))
(add-to-list 'load-path "~/.emacs.d/packages/distel/elisp")
(require 'distel)
(distel-setup)
(add-to-list 'auto-mode-alist '("\\.erl$" . erlang-mode))
(provide 'distel-init)