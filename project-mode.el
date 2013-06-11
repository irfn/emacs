(add-hook 'find-file-hook 'project-switch)

(defun project-root ()
 (condition-case nil
  (textmate-project-root)
  (error nil)))


(defun current-file-in-buffer ()
  (car (last (split-string (buffer-file-name) "/"))))

;;(add-to-list '*textmate-project-roots* "Gemfile")
;;(add-to-list '*textmate-project-roots* "Readme.md")



(setq *textmate-gf-exclude*
      "/\\.|vendor|fixtures|tmp|log|cassettes|build|\\.xcodeproj|\\.nib|\\.framework|\\.app|\\.pbproj|\\.pbxproj|\\.xcode|\\.xcodeproj|\\.bundle|\\.pyc|\\.elc|\\.jar|\\.class")
(setq rinari-tags-file-name "TAGS")

(defun rails-project ()
  (when (project-root)
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

