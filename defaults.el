(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4.20110207/dict")
(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
(setq ac-auto-start nil)
(setq ac-dwim t)
(global-auto-complete-mode t)

(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue")

(add-to-list 'linum-disabled-modes-list '(speedbar-mode))


(provide 'defaults)
