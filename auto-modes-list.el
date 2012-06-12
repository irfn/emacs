(defun auto-mode-for (mode list)
       "auto mode a list for a mode"
       (loop for e in list do
             (add-to-list 'auto-mode-alist (quote (e . mode)))))



(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("config.ru" . ruby-mode))

(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
(add-to-list 'auto-mode-alist '("\\.brs$" . brightscript-mode))

(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
(autoload 'gtags-mode "gtags" "" t)

(provide 'auto-modes-list)
