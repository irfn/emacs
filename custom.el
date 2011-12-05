;; 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes (quote ("858c7e46cb5fc78dd1f034924a50555182e508bc" "c8f1f8a5c04b9489af67bd63159b81791c1e1070" default)))
 '(custom-theme-directory "~/.emacs.d/themes/")
 '(exec-path (quote ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin" "/usr/local/bin" "/usr/local/sbin")))
 '(fancy-splash-image nil)
 '(yas/global-mode t nil (yasnippet))
 '(yas/root-directory "~/.snippets" nil (yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(c-mode)
(c-toggle-hungry-state)
(setq default-tab-width 2)

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(setq inhibit-splash-screen t)
(setq make-backup-files nil)
(setq highlight-current-line-globally t)
