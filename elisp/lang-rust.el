;;rust-mode

(use-package rust-mode
  :ensure t)

(use-package flymake-rust
  :ensure t)

(use-package cargo
  :ensure t)

(use-package racer
  :ensure t)

(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'rust-mode-hook 'racer-mode)

(provide 'lang-rust)
