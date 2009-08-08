(setq load-path (cons  "~/.emacs.d/packages/markdown.el" load-path))
(autoload 'markdown-mode "markdown-mode.el"
	"Major mode for editing Markdown files" t)
(setq auto-mode-alist
			(cons '("\\.markdown" . markdown-mode) auto-mode-alist))
;;
;; There is no consensus on an official file extension so change `.text` to
;; `.mdwn`, `.md`, `.mdt`, or whatever you call your markdown files.
