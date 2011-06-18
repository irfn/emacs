(add-to-list 'load-path "~/.emacs.d/packages/cucumber.el/")
;; ;; default language if .feature doesn't have "# language: fi"
;; ;(setq feature-default-language "fi")
;; ;; point to cucumber languages.yml or gherkin i18n.yml to use
;; ;; exactly the same localization your cucumber uses
;; ;(setq feature-default-i18n-file "/path/to/gherkin/gem/i18n.yml")
;; ;; and load it
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
;; 
;; Language used in feature file is automatically detected from
;; "language: [2-letter ISO-code]" tag in feature file.  You can
;; choose the language feature-mode should use in case autodetection
;; fails.  Just add
(setq feature-default-language "en")
;; to your .emacs
;;
;; Translations are loaded from ~/.emacs.d/elisp/feature-mode/i18n.yml
;; by default.  You can configure feature-mode to load translations
;; directly from cucumber languages.yml or gherkin i18n.yml.  Just add
;; (setq feature-default-i18n-file 
;;  "/usr/lib/ruby/gems/1.8/gems/cucumber-0.4.4/lib/cucumber/languages.yml")
;; to your .emacs before
(provide 'cucumber-init)
