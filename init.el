(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/themes/emacs-color-theme-solarized/")
(setq custom-file "~/.emacs.d/custom.el")


(require 'marmalade)
(require 'solarized-dark)
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("config.ru" . ruby-mode))
(setq *textmate-gf-exclude*
  "/\\.|vendor|fixtures|tmp|log|build|\\.xcodeproj|\\.nib|\\.framework|\\.app|\\.pbproj|\\.pbxproj|\\.xcode|\\.xcodeproj|\\.bundle|\\.pyc|\\.elc|\\.jar|\\.class")
(setq rinari-tags-file-name "TAGS")

(load-file "~/.emacs.d/custom.el")
(linum-mode)
(highline-mode)
(set-face-background 'highline-face "#222")
