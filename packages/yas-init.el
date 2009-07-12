(add-to-list 'load-path "~/.emacs.d/packages/yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.snippets")