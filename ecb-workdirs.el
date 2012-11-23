(defun zsh-marks()
	(split-string 
	(shell-command-to-string "cat ~/.zshmarks | cut -d '=' -f2- | sed -e 's/\"//g'") 
	"\n" t))

(setq ecb-source-path (zsh-marks))

(provide 'ecb-workdirs)
