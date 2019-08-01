;; set a default font
(when (member "FuraCode Nerd Font" (font-family-list))
  (set-face-attribute 'default nil :font "FuraCode Nerd Font-14"))

(use-package suscolors-theme
  :ensure t)

(use-package gruvbox-theme
  :ensure t)

(use-package inkpot-theme
  :ensure t)

(load-theme 'gruvbox-dark-soft t)

(provide 'base-editor)
