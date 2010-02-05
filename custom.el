(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1)) Need this on osx
(setq inhibit-splash-screen t)

(setq make-backup-files nil)
(custom-set-variables
 '(show-paren-mode t)
 '(transient-mark-mode t))
(c-mode)

(c-toggle-hungry-state)

(global-set-key "\177" 'c-hungry-delete-backwards)
(global-set-key "\C-d" 'c-hungry-delete-forward)
(fset 'yes-or-no-p 'y-or-n-p)
(setq default-tab-width 2)


(setq rinari-tags-file-name "TAGS")

(defun my-global-projects-dirs()
	(split-string 
	(shell-command-to-string "cat ~/.work_dirs") 
	"\n" t))

 (setq ecb-source-path (my-global-projects-dirs))

(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

(autoload 'mode-compile "mode-compile"
   "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cc" 'mode-compile)
 
(autoload 'mode-compile-kill "mode-compile"
 "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)

(defun ruby-outline-mode ()
  (interactive)
  (setq outline-regexp " *\\(def\\|if\\|when\\|do\\)"))

(setq *textmate-gf-exclude*
  "/\\.|vendor|fixtures|tmp|log|build|\\.xcodeproj|\\.nib|\\.framework|\\.app|\\.pbproj|\\.pbxproj|\\.xcode|\\.xcodeproj|\\.bundle|\\.pyc|\\.elc|\\.jar|\\.class")
(setq auto-mode-alist (cons '("Rakefile$" . ruby-mode) auto-mode-alist))

(global-set-key (kbd "A-d") "\C-a\C- \C-n\M-w\C-y")
(global-set-key (kbd "A-D") "\M-w\C-y")
(setq highlight-current-line-globally t)
(setq initial-scratch-message nil)

(set-frame-width (selected-frame) 200)
(set-frame-height (selected-frame) 100)
