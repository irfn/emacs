(add-hook 'find-file-hook 'project-switch)

(defun current-file-in-buffer ()
  (car (last (split-string (buffer-file-name) "/"))))

;;(add-to-list '*textmate-project-roots* "Gemfile")
;;(add-to-list '*textmate-project-roots* "Readme.md")


(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("config.ru" . ruby-mode))

(setq *textmate-gf-exclude*
      "/\\.|vendor|fixtures|tmp|log|build|\\.xcodeproj|\\.nib|\\.framework|\\.app|\\.pbproj|\\.pbxproj|\\.xcode|\\.xcodeproj|\\.bundle|\\.pyc|\\.elc|\\.jar|\\.class")
(setq rinari-tags-file-name "TAGS")

(defun rails-project ()
  (when (textmate-project-root)
    (file-exists-p (expand-file-name "config/environment.rb" (textmate-project-root)))))

(defun bundler-project ()
  (if (file-exists-p (expand-file-name "Gemfile" (textmate-project-root))) t))

(defun spec-path ()
  (if (file-existes-p (expand-file-name "spec" (textmate-project-root))) "spec"))

(defun project-switch ()
  (if (car (member (current-file-in-buffer) '("Rakefile" "Gemfile" "Makefile" "Vagrantfile" "config.ru" "init.el")))
      (textmate-mode)
    (rvm-activate-corresponding-ruby)
    (if (rails-project)
        (rinari-minor-mode))))

(provide 'project-mode)

