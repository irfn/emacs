;; This is not needed if emacs is launched from command prompt
(dolist (dir (mapcar 'expand-file-name '(
;; Add Paths(quoted) on each line 
"/usr/local/bin" 
"/opt/local/bin" 
"/opt/subversion/bin"
"/usr/local/mysql/bin/"
)))
 
(setenv "PATH" (concat dir ":" (getenv "PATH")))
 (setq exec-path (append (list dir) exec-path)))