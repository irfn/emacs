(add-to-list 'load-path "~/.emacs.d/")
(setq custom-file "~/.emacs.d/custom.el")


(require 'marmalade)
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("config.ru" . ruby-mode))

(setq *textmate-gf-exclude*
  "/\\.|vendor|fixtures|tmp|log|build|\\.xcodeproj|\\.nib|\\.framework|\\.app|\\.pbproj|\\.pbxproj|\\.xcode|\\.xcodeproj|\\.bundle|\\.pyc|\\.elc|\\.jar|\\.class")
(setq rinari-tags-file-name "TAGS")

(load custom-file 'noerror)
(linum-mode)
(highline-mode)
(set-face-background 'highline-face "#08252F")
