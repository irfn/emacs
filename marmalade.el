(require 'package)
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
         '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(provide 'marmalade)
