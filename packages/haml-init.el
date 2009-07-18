(load-file 
 (concat
 (car 
	(split-string 
	 (car (cdr (split-string	 
							(shell-command-to-string  
							 "gem which haml") "\n" t)))
	 "/lib/haml.rb*" t))
 "/extra/haml-mode.el"))