(global-set-key (kbd "A-d") "\C-a\C- \C-n\M-w\C-y")
(global-set-key (kbd "A-D") "\M-w\C-y")

(global-set-key "\C-cc" 'mode-compile)
(global-set-key "\C-ck" 'mode-compile-kill)

(global-set-key (kbd "\C-cd") 'duplicate-line)

(define-key ac-completing-map "\M-n" 'ac-next)
(define-key ac-completing-map "\M-p" 'ac-previous)
(define-key ac-mode-map (kbd "\M-/") 'auto-complete) 
(define-key ac-mode-map (kbd "ESC M-/") 'ac-complete-dictionary)
(define-key ac-mode-map (kbd "ESC M-o") 'dired)
(define-key ac-mode-map (kbd "ESC M-j") 'ac-complete-yasnippet)
(global-set-key "\M-/" 'auto-complete)
(global-set-key "\M-?" 'dabbrev-expand)
(global-set-key (kbd "\C-co") 'open-buffer-path)

(global-set-key "\C-cy" 'browse-kill-ring)

(global-set-key (kbd "ESC M-a") 'ack)

(global-set-key (kbd "M-.") 'gtags-find-tag)   ; find a tag, also M-.
(global-set-key (kbd "M-,") 'gtags-find-rtag)  ; reverse tag
(global-set-key (kbd "M-:") 'gtags-find-symbol)  
(global-set-key (kbd "M-?") 'gtags-find-with-grep) 

(provide 'key-bindings)
