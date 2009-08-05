;; This is not needed if emacs is launched from command prompt
(dolist (dir (mapcar 'expand-file-name '(
;; Add Paths(quoted) on each line 
"/opt/subversion/bin"
"/usr/local/bin" 
"/opt/local/bin" 
"/usr/local/mysql/bin/"
)))
 
(setenv "PATH" (concat dir ":" (getenv "PATH")))
 (setq exec-path (append (list dir) exec-path)))