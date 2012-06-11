;; 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 2)
 '(campfire-domain "thoughtworks3.campfirenow.com")
 '(campfire-ssl t)
 '(custom-enabled-themes (quote (solarized-normal)))
 '(custom-file "~/.emacs.d/custom.el")
 '(custom-safe-themes (quote ("1ac7f97606ab70f34fded03556b4e44f4ffdc854b1a982a7330a0d4c45d15d66" "3da5c3f3a80fe7f9a20d79b5f5a1283b71a42b1c5f70e7073c4c9b2efcb4733e" "12c7ae4275e8f0078532d666a4d1c0f4bf49b362da790fd4d0d05da1e32d407f" "7a6eb30633bd088ddf67d24b399aa880d89a6ba3ded7885cc81421d21d4c0499" "632c4c517f8d0948a1a97dfce95d4a94bf5201bc9f5057ec31c9120d7f5c8b07" "c8083f549009467c5468751246e5e0c2ce6189b147de3fc6d87d0c9f625d5dd9" "4edc268815e385a3820f62aa1af907924c03dacac16494590f700de7507e8343" "78d54f55ec2cbbd2a84ea985680c3faa8ae65e5ee95ca8958d947d676e4b092c" "d617491fbcb1d6d060ffe3cb546c8bd891ed6af00230d0af1616488c4f035836" "3713232cf7dba35daa69b5032b8cf92506eb729a54a86e0f3c431fcfffd9e032" "da7d2cfd7406fd927efc98d9056886845109b8238a39a173ed6f1948721768f2" "e7014c729747de1945af351ca9177cd94c3640c893ed2482415b017dc0375fce" "3bbb7ed049d404274a1a6ecb2ae516dff65837de140bfadfbbfb72b8760a1273" "f11adb48959bb1221182bf2c9bab03738fbb9e7be0f965a735c4cb5f71e9313e" "da5920275fcf0ffb4f57ad8b6ecb9c080f5ec4cd105a44877e70605f8fc7f8ef" "7acc0466fce1bc967ce1561c8c4fdcbf4358b4ae692577562a3ed747c109f9d7" "faefe5fe6ffdd66bf452a0922f143532409bd5a2b187af8764cc38e7d8993e79" "baed08a10ff9393ce578c3ea3e8fd4f8c86e595463a882c55f3bd617df7e5a45" "22b46f4c61321f7ff393eb35617bd77852c1ab22cf62bf8bafc366ea4b91b7df" "374e79a81930979e673b8e0869e135fb2450b18c6474ca145f104e0c6f003267" "54d1bcf3fcf758af4812f98eb53b5d767f897442753e1aa468cfeb221f8734f9" "d90f6a39ef514f1029460fa86ed621d0a5328c697e3aebfa4618b6a99da2372e" "a52081eacf3615157904c53fbc5a1610acc94fcf" "9bcca0afb74d49c4a3f01d81942c7eb9ed68f07d" "e042bdae7a5bb5972c8e5d37850af39ed3c1fde9" "5b454ceae8b32bbfab307109f8ee26dc1633b05d" "de78bc39bed5aaf12cfaa19b8a4cce4b3ef20518" "cf4dda59b259ca9c6214a8e9acf84bf5909c6e59" "e254937cba0f82c2d9eb3189a60748df9e486522" "f36c3d85ad1cd2120163c0bb0a82b8d062a6fec5" "1440d751f5ef51f9245f8910113daee99848e2c0" "485737acc3bedc0318a567f1c0f5e7ed2dfde3fb" "35bbc02a67f685bf35db3c3bf156f95687fff729" "858c7e46cb5fc78dd1f034924a50555182e508bc" "c8f1f8a5c04b9489af67bd63159b81791c1e1070" default)))
 '(custom-theme-directory "~/.emacs.d/themes/")
 '(exec-path (quote ("/usr/local/bin" "/usr/local/sbin" "/usr/bin" "/usr/sbin" "/Applications/Emacs.app/Contents/MacOS/bin" "/bin" "/sbin")))
 '(fancy-splash-image nil)
 '(fringe-mode (quote (4 . 4)) nil (fringe))
 '(global-linum-mode t)
 '(gnus-completing-read-function (quote gnus-ido-completing-read))
 '(ido-default-file-method (quote raise-frame))
 '(ido-ignore-buffers (quote ("\\` " "*GTAGS")))
 '(ido-rotate-file-list-default t)
 '(ido-use-filename-at-point nil)
 '(linum-format "%3d")
 '(make-backup-files nil)
 '(rspec-rake-command "rake")
 '(rspec-spec-command "rspec")
 '(rspec-use-rvm t)
 '(safe-local-variable-values (quote ((ruby-compilation-executable . "ruby") (ruby-compilation-executable . "ruby1.8") (ruby-compilation-executable . "ruby1.9") (ruby-compilation-executable . "rbx") (ruby-compilation-executable . "jruby") (whitespace-line-column . 80) (lexical-binding . t) (encoding . utf-8))))
 '(save-place-file "~/.emacs.d/places")
 '(shell-file-name "/bin/zsh")
 '(smex-save-file "~/.emacs.d/.smex-items")
 '(speedbar-show-unknown-files t)
 '(sr-speedbar-max-width 80)
 '(standard-indent 2)
 '(tab-width 2)
 '(wg-prefix-key (kbd "C-c w"))
 '(yas/global-mode t nil (yasnippet))
 '(yas/root-directory "~/.snippets/" nil (yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "#4D4C4C")))))

(c-mode)
(c-toggle-hungry-state)
(setq default-tab-width 2)

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(setq inhibit-splash-screen t)
(setq make-backup-files nil)
(setq highlight-current-line-globally t)
(setq campfire-room-name "446076")
