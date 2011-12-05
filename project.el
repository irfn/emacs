(add-hook 'find-file-hook 'project-switch)

(defun current-file-in-buffer ()
  (car (last (split-string (buffer-file-name) "/"))))


(defun project-switch ()
  (if (member (current-file-in-buffer) '(Rakefile Gemfile Makefile project.el))
      (textmate-mode)))
(project-switch) 
(provide 'project)

