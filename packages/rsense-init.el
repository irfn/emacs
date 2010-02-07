
(defun load-rsense()
	(add-to-list 'load-path (concat (getenv "RSENSE_HOME") "etc"))
	(require 'rsense))


(if (getenv "RSENSE_HOME") 
		(load-rsense))

(provide 'rsense-init)
