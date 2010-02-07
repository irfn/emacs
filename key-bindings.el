(global-set-key "\177" 'c-hungry-delete-backwards)
(global-set-key "\C-d" 'c-hungry-delete-forward)

(global-set-key (kbd "A-d") "\C-a\C- \C-n\M-w\C-y")
(global-set-key (kbd "A-D") "\M-w\C-y")

(global-set-key "\C-cc" 'mode-compile)
(global-set-key "\C-ck" 'mode-compile-kill)

(global-set-key (kbd "\C-cd") 'duplicate-line)
(global-set-key (kbd "ESC M-d") 'ecb-toggle-ecb-windows)

(define-key ac-completing-map "\M-n" 'ac-next)
(define-key ac-completing-map "\M-p" 'ac-previous)
(define-key ac-mode-map (kbd "\M-/") 'auto-complete) 
(global-set-key "\M-/" 'auto-complete)
(global-set-key "\M-?" 'dabbrev-expand)
