(load-file 
 (concat
	(car 
			(split-string
			 (shell-command-to-string "gem which haml")
			 "/lib/haml.rb\n" t)
			)
	"/extra/haml-mode.el")
 )
