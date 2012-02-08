;; Irfan Shah 
;;; Code
(deftheme zen-mod "A mod of Zenburn color theme")

(let ((class '((class color) (min-colors 89)))
      ;; Zen-Mod mod palette
      ;; colors with +x are lighter, colors with -x are darker
      (zen-mod-fg "#CCCCCC")
      (zen-mod-fg-1 "#999999")
      (zen-mod-bg-1 "#2b2b2b")
      (zen-mod-bg-05 "#383838")
      (zen-mod-bg "#2D2D2D")
      (zen-mod-bg+1 "#4f4f4f")
      (zen-mod-bg+2 "#5f5f5f")
      (zen-mod-red+1 "#dca3a3")
      (zen-mod-red "#BB695E")
      (zen-mod-red-1 "#F2777A")
      (zen-mod-red-2 "#ac7373")
      (zen-mod-red-3 "#9c6363")
      (zen-mod-red-4 "#8c5353")
      (zen-mod-orange "#F99157")
      (zen-mod-yellow "#F0C674")
      (zen-mod-yellow-1 "#e0cf9f")
      (zen-mod-yellow-2 "#d0bf8f")
      (zen-mod-green-1 "#B5BD68")
      (zen-mod-green "#99CC99")
      (zen-mod-green+1 "#A6AD5F")
      (zen-mod-green+2 "#859333")
      (zen-mod-green+3 "#8A9A34")
      (zen-mod-green+4 "#9CA259")
      (zen-mod-cyan "#53BEC7")
      (zen-mod-blue+1 "#94bff3")
      (zen-mod-blue "#6699CC")
      (zen-mod-blue-1 "#7cb8bb")
      (zen-mod-blue-2 "#6ca0a3")
      (zen-mod-blue-3 "#5c888b")
      (zen-mod-blue-4 "#4c7073")
      (zen-mod-blue-5 "#366060")
      (zen-mod-magenta "#dc8cc3"))
  (custom-theme-set-faces
   'zen-mod
   '(button ((t (:underline t))))
   `(link ((,class (:foreground ,zen-mod-yellow :underline t :weight bold))))
   `(link-visited ((,class (:foreground ,zen-mod-yellow-2 :underline t :weight normal))))

   ;;; basic coloring
   `(default ((,class (:foreground ,zen-mod-fg :background ,zen-mod-bg))))
   `(cursor ((,class (:foreground ,zen-mod-fg))))
   `(escape-glyph-face ((,class (:foreground ,zen-mod-red))))
   `(fringe ((,class (:foreground ,zen-mod-fg :background ,zen-mod-bg+1))))
   `(header-line ((,class (:foreground ,zen-mod-yellow
                                       :background ,zen-mod-bg-1
                                       :box (:line-width -1 :style released-button)))))
   `(highlight ((,class (:background ,zen-mod-bg-05))))

   ;;; compilation
   `(compilation-column-face ((,class (:foreground ,zen-mod-yellow))))
   `(compilation-enter-directory-face ((,class (:foreground ,zen-mod-green))))
   `(compilation-error-face ((,class (:foreground ,zen-mod-red-1 :weight bold :underline t))))
   `(compilation-face ((,class (:foreground ,zen-mod-fg))))
   `(compilation-info-face ((,class (:foreground ,zen-mod-blue))))
   `(compilation-info ((,class (:foreground ,zen-mod-green+4 :underline t))))
   `(compilation-leave-directory-face ((,class (:foreground ,zen-mod-green))))
   `(compilation-line-face ((,class (:foreground ,zen-mod-yellow))))
   `(compilation-line-number ((,class (:foreground ,zen-mod-yellow))))
   `(compilation-message-face ((,class (:foreground ,zen-mod-blue))))
   `(compilation-warning-face ((,class (:foreground ,zen-mod-yellow-1 :weight bold :underline t))))

   ;;; grep
   `(grep-context-face ((,class (:foreground ,zen-mod-fg))))
   `(grep-error-face ((,class (:foreground ,zen-mod-red-1 :weight bold :underline t))))
   `(grep-hit-face ((,class (:foreground ,zen-mod-blue))))
   `(grep-match-face ((,class (:foreground ,zen-mod-orange :weight bold))))
   `(match ((,class (:background ,zen-mod-bg-1 :foreground ,zen-mod-orange :weight bold))))

   ;; faces used by isearch
   `(isearch ((,class (:foreground ,zen-mod-yellow :background ,zen-mod-bg-1))))
   `(isearch-fail ((,class (:foreground ,zen-mod-fg :background ,zen-mod-red-4))))
   `(lazy-highlight ((,class (:foreground ,zen-mod-yellow :background ,zen-mod-bg+2))))

   `(menu ((,class (:foreground ,zen-mod-fg :background ,zen-mod-bg))))
   `(minibuffer-prompt ((,class (:foreground ,zen-mod-yellow))))
   `(mode-line
     ((,class (:foreground ,zen-mod-green+1
                           :background ,zen-mod-bg-1
                           :box (:line-width -1 :style released-button)))))
   `(mode-line-buffer-id ((,class (:foreground ,zen-mod-yellow :weight bold))))
   `(mode-line-inactive
     ((,class (:foreground ,zen-mod-green-1
                           :background ,zen-mod-bg-05
                           :box (:line-width -1 :style released-button)))))
   `(region ((,class (:background ,zen-mod-bg-1))))
   `(secondary-selection ((,class (:background ,zen-mod-bg+2))))
   `(trailing-whitespace ((,class (:background ,zen-mod-red))))
   `(vertical-border ((,class (:foreground ,zen-mod-fg))))

   ;;; font lock
   `(font-lock-builtin-face ((,class (:foreground ,zen-mod-blue))))
   `(font-lock-comment-face ((,class (:foreground ,zen-mod-green))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,zen-mod-green))))
   `(font-lock-constant-face ((,class (:foreground ,zen-mod-green+4))))
   `(font-lock-doc-face ((,class (:foreground ,zen-mod-green+1))))
   `(font-lock-doc-string-face ((,class (:foreground ,zen-mod-blue+1))))
   `(font-lock-function-name-face ((,class (:foreground ,zen-mod-blue))))
   `(font-lock-keyword-face ((,class (:foreground ,zen-mod-yellow :weight bold))))
   `(font-lock-negation-char-face ((,class (:foreground ,zen-mod-fg))))
   `(font-lock-preprocessor-face ((,class (:foreground ,zen-mod-blue))))
   `(font-lock-string-face ((,class (:foreground ,zen-mod-red))))
   `(font-lock-type-face ((,class (:foreground ,zen-mod-blue))))
   `(font-lock-variable-name-face ((,class (:foreground ,zen-mod-orange))))
   `(font-lock-warning-face ((,class (:foreground ,zen-mod-yellow-1 :weight bold :underline t))))

   `(c-annotation-face ((,class (:inherit font-lock-constant-face))))

   ;;; external

   ;; diff
   `(diff-added ((,class (:foreground ,zen-mod-green+4))))
   `(diff-changed ((,class (:foreground ,zen-mod-yellow))))
   `(diff-removed ((,class (:foreground ,zen-mod-red))))
   `(diff-header ((,class (:background ,zen-mod-bg+1))))
   `(diff-file-header
     ((,class (:background ,zen-mod-bg+2 :foreground ,zen-mod-fg :bold t))))

   ;; eshell
   `(eshell-prompt ((,class (:foreground ,zen-mod-yellow :weight bold))))
   `(eshell-ls-archive ((,class (:foreground ,zen-mod-red-1 :weight bold))))
   `(eshell-ls-backup ((,class (:inherit font-lock-comment))))
   `(eshell-ls-clutter ((,class (:inherit font-lock-comment))))
   `(eshell-ls-directory ((,class (:foreground ,zen-mod-blue+1 :weight bold))))
   `(eshell-ls-executable ((,class (:foreground ,zen-mod-red+1 :weight bold))))
   `(eshell-ls-unreadable ((,class (:foreground ,zen-mod-fg))))
   `(eshell-ls-missing ((,class (:inherit font-lock-warning))))
   `(eshell-ls-product ((,class (:inherit font-lock-doc))))
   `(eshell-ls-special ((,class (:foreground ,zen-mod-yellow :weight bold))))
   `(eshell-ls-symlink ((,class (:foreground ,zen-mod-cyan :weight bold))))

   ;; flymake
   `(flymake-errline ((,class (:foreground ,zen-mod-red-1 :weight bold :underline t))))
   `(flymake-warnline ((,class (:foreground ,zen-mod-yellow-1 :weight bold :underline t))))

   ;; flyspell
   `(flyspell-duplicate ((,class (:foreground ,zen-mod-yellow-1 :weight bold :underline t))))
   `(flyspell-incorrect ((,class (:foreground ,zen-mod-red-1 :weight bold :underline t))))

   ;; erc
   `(erc-action-face ((,class (:inherit erc-default-face))))
   `(erc-bold-face ((,class (:weight bold))))
   `(erc-current-nick-face ((,class (:foreground ,zen-mod-blue :weight bold))))
   `(erc-dangerous-host-face ((,class (:inherit font-lock-warning))))
   `(erc-default-face ((,class (:foreground ,zen-mod-fg))))
   `(erc-direct-msg-face ((,class (:inherit erc-default))))
   `(erc-error-face ((,class (:inherit font-lock-warning))))
   `(erc-fool-face ((,class (:inherit erc-default))))
   `(erc-highlight-face ((,class (:inherit hover-highlight))))
   `(erc-input-face ((,class (:foreground ,zen-mod-yellow))))
   `(erc-keyword-face ((,class (:foreground ,zen-mod-blue :weight bold))))
   `(erc-nick-default-face ((,class (:foreground ,zen-mod-yellow :weight bold))))
   `(erc-my-nick-face ((,class (:foreground ,zen-mod-red :weigth bold))))
   `(erc-nick-msg-face ((,class (:inherit erc-default))))
   `(erc-notice-face ((,class (:foreground ,zen-mod-green))))
   `(erc-pal-face ((,class (:foreground ,zen-mod-orange :weight bold))))
   `(erc-prompt-face ((,class (:foreground ,zen-mod-orange :background ,zen-mod-bg :weight bold))))
   `(erc-timestamp-face ((,class (:foreground ,zen-mod-green+1))))
   `(erc-underline-face ((t (:underline t))))

   ;; gnus
   `(gnus-group-mail-1-face ((,class (:bold t :inherit gnus-group-mail-1-empty))))
   `(gnus-group-mail-1-empty-face ((,class (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2-face ((,class (:bold t :inherit gnus-group-mail-2-empty))))
   `(gnus-group-mail-2-empty-face ((,class (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3-face ((,class (:bold t :inherit gnus-group-mail-3-empty))))
   `(gnus-group-mail-3-empty-face ((,class (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-4-face ((,class (:bold t :inherit gnus-group-mail-4-empty))))
   `(gnus-group-mail-4-empty-face ((,class (:inherit gnus-group-news-4-empty))))
   `(gnus-group-mail-5-face ((,class (:bold t :inherit gnus-group-mail-5-empty))))
   `(gnus-group-mail-5-empty-face ((,class (:inherit gnus-group-news-5-empty))))
   `(gnus-group-mail-6-face ((,class (:bold t :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty-face ((,class (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low-face ((,class (:bold t :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty-face ((,class (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news-1-face ((,class (:bold t :inherit gnus-group-news-1-empty))))
   `(gnus-group-news-2-face ((,class (:bold t :inherit gnus-group-news-2-empty))))
   `(gnus-group-news-3-face ((,class (:bold t :inherit gnus-group-news-3-empty))))
   `(gnus-group-news-4-face ((,class (:bold t :inherit gnus-group-news-4-empty))))
   `(gnus-group-news-5-face ((,class (:bold t :inherit gnus-group-news-5-empty))))
   `(gnus-group-news-6-face ((,class (:bold t :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low-face ((,class (:bold t :inherit gnus-group-news-low-empty))))
   `(gnus-header-content-face ((,class (:inherit message-header-other))))
   `(gnus-header-from-face ((,class (:inherit message-header-from))))
   `(gnus-header-name-face ((,class (:inherit message-header-name))))
   `(gnus-header-newsgroups-face ((,class (:inherit message-header-other))))
   `(gnus-header-subject-face ((,class (:inherit message-header-subject))))
   `(gnus-summary-cancelled-face ((,class (:foreground ,zen-mod-orange))))
   `(gnus-summary-high-ancient-face ((,class (:foreground ,zen-mod-blue))))
   `(gnus-summary-high-read-face ((,class (:foreground ,zen-mod-green :weight bold))))
   `(gnus-summary-high-ticked-face ((,class (:foreground ,zen-mod-orange :weight bold))))
   `(gnus-summary-high-unread-face ((,class (:foreground ,zen-mod-fg :weight bold))))
   `(gnus-summary-low-ancient-face ((,class (:foreground ,zen-mod-blue))))
   `(gnus-summary-low-read-face ((t (:foreground ,zen-mod-green))))
   `(gnus-summary-low-ticked-face ((,class (:foreground ,zen-mod-orange :weight bold))))
   `(gnus-summary-low-unread-face ((,class (:foreground ,zen-mod-fg))))
   `(gnus-summary-normal-ancient-face ((,class (:foreground ,zen-mod-blue))))
   `(gnus-summary-normal-read-face ((,class (:foreground ,zen-mod-green))))
   `(gnus-summary-normal-ticked-face ((,class (:foreground ,zen-mod-orange :weight bold))))
   `(gnus-summary-normal-unread-face ((,class (:foreground ,zen-mod-fg))))
   `(gnus-summary-selected-face ((,class (:foreground ,zen-mod-yellow :weight bold))))
   `(gnus-cite-1-face ((,class (:foreground ,zen-mod-blue))))
   `(gnus-cite-10-face ((,class (:foreground ,zen-mod-yellow-1))))
   `(gnus-cite-11-face ((,class (:foreground ,zen-mod-yellow))))
   `(gnus-cite-2-face ((,class (:foreground ,zen-mod-blue-1))))
   `(gnus-cite-3-face ((,class (:foreground ,zen-mod-blue-2))))
   `(gnus-cite-4-face ((,class (:foreground ,zen-mod-green+2))))
   `(gnus-cite-5-face ((,class (:foreground ,zen-mod-green+1))))
   `(gnus-cite-6-face ((,class (:foreground ,zen-mod-green))))
   `(gnus-cite-7-face ((,class (:foreground ,zen-mod-red))))
   `(gnus-cite-8-face ((,class (:foreground ,zen-mod-red-1))))
   `(gnus-cite-9-face ((,class (:foreground ,zen-mod-red-2))))
   `(gnus-group-news-1-empty-face ((,class (:foreground ,zen-mod-yellow))))
   `(gnus-group-news-2-empty-face ((,class (:foreground ,zen-mod-green+3))))
   `(gnus-group-news-3-empty-face ((,class (:foreground ,zen-mod-green+1))))
   `(gnus-group-news-4-empty-face ((,class (:foreground ,zen-mod-blue-2))))
   `(gnus-group-news-5-empty-face ((,class (:foreground ,zen-mod-blue-3))))
   `(gnus-group-news-6-empty-face ((,class (:foreground ,zen-mod-bg+2))))
   `(gnus-group-news-low-empty-face ((,class (:foreground ,zen-mod-bg+2))))
   `(gnus-signature-face ((,class (:foreground ,zen-mod-yellow))))
   `(gnus-x-face ((,class (:background ,zen-mod-fg :foreground ,zen-mod-bg))))

   ;; hl-line-mode
   `(hl-line-face ((,class (:background ,zen-mod-bg-1))))

   ;; ido-mode
   `(ido-first-match ((,class (:foreground ,zen-mod-yellow :weight bold))))
   `(ido-only-match ((,class (:foreground ,zen-mod-orange :weight bold))))
   `(ido-subdir ((,class (:foreground ,zen-mod-yellow))))

   ;; linum-mode
   `(linum ((,class (:foreground ,zen-mod-fg-1 :background ,zen-mod-bg-1))))

   ;; magit
   `(magit-section-title ((,class (:foreground ,zen-mod-yellow :weight bold))))
   `(magit-branch ((,class (:foreground ,zen-mod-orange :weight bold))))

   ;; message-mode
   `(message-cited-text-face ((,class (:inherit font-lock-comment))))
   `(message-header-name-face ((,class (:foreground ,zen-mod-green+1))))
   `(message-header-other-face ((,class (:foreground ,zen-mod-green))))
   `(message-header-to-face ((,class (:foreground ,zen-mod-yellow :weight bold))))
   `(message-header-from-face ((,class (:foreground ,zen-mod-yellow :weight bold))))
   `(message-header-cc-face ((,class (:foreground ,zen-mod-yellow :weight bold))))
   `(message-header-newsgroups-face ((,class (:foreground ,zen-mod-yellow :weight bold))))
   `(message-header-subject-face ((,class (:foreground ,zen-mod-orange :weight bold))))
   `(message-header-xheader-face ((,class (:foreground ,zen-mod-green))))
   `(message-mml-face ((,class (:foreground ,zen-mod-yellow :weight bold))))
   `(message-separator-face ((,class (:inherit font-lock-comment))))

   ;; mew
   `(mew-face-header-subject ((,class (:foreground ,zen-mod-orange))))
   `(mew-face-header-from ((,class (:foreground ,zen-mod-yellow))))
   `(mew-face-header-date ((,class (:foreground ,zen-mod-green))))
   `(mew-face-header-to ((,class (:foreground ,zen-mod-red))))
   `(mew-face-header-key ((,class (:foreground ,zen-mod-green))))
   `(mew-face-header-private ((,class (:foreground ,zen-mod-green))))
   `(mew-face-header-important ((,class (:foreground ,zen-mod-blue))))
   `(mew-face-header-marginal ((,class (:foreground ,zen-mod-fg :weight bold))))
   `(mew-face-header-warning ((,class (:foreground ,zen-mod-red))))
   `(mew-face-header-xmew ((,class (:foreground ,zen-mod-green))))
   `(mew-face-header-xmew-bad ((,class (:foreground ,zen-mod-red))))
   `(mew-face-body-url ((,class (:foreground ,zen-mod-orange))))
   `(mew-face-body-comment ((,class (:foreground ,zen-mod-fg :slant italic))))
   `(mew-face-body-cite1 ((,class (:foreground ,zen-mod-green))))
   `(mew-face-body-cite2 ((,class (:foreground ,zen-mod-blue))))
   `(mew-face-body-cite3 ((,class (:foreground ,zen-mod-orange))))
   `(mew-face-body-cite4 ((,class (:foreground ,zen-mod-yellow))))
   `(mew-face-body-cite5 ((,class (:foreground ,zen-mod-red))))
   `(mew-face-mark-review ((,class (:foreground ,zen-mod-blue))))
   `(mew-face-mark-escape ((,class (:foreground ,zen-mod-green))))
   `(mew-face-mark-delete ((,class (:foreground ,zen-mod-red))))
   `(mew-face-mark-unlink ((,class (:foreground ,zen-mod-yellow))))
   `(mew-face-mark-refile ((,class (:foreground ,zen-mod-green))))
   `(mew-face-mark-unread ((,class (:foreground ,zen-mod-red-2))))
   `(mew-face-eof-message ((,class (:foreground ,zen-mod-green))))
   `(mew-face-eof-part ((,class (:foreground ,zen-mod-yellow))))

   ;; nav
   `(nav-face-heading ((,class (:foreground ,zen-mod-yellow))))
   `(nav-face-button-num ((,class (:foreground ,zen-mod-cyan))))
   `(nav-face-dir ((,class (:foreground ,zen-mod-green))))
   `(nav-face-hdir ((,class (:foreground ,zen-mod-red))))
   `(nav-face-file ((,class (:foreground ,zen-mod-fg))))
   `(nav-face-hfile ((,class (:foreground ,zen-mod-red-4))))

   ;; org-mode
   `(org-agenda-date-today
     ((,class (:foreground "white" :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((,class (:inherit font-lock-comment-face))))
   `(org-archived ((,class (:foreground ,zen-mod-fg :weight bold))))
   `(org-checkbox ((,class (:background ,zen-mod-bg+2 :foreground "white"
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((,class (:foreground ,zen-mod-blue :underline t))))
   `(org-deadline-announce ((,class (:foreground ,zen-mod-red-1))))
   `(org-done ((,class (:bold t :weight bold :foreground ,zen-mod-green+3))))
   `(org-formula ((,class (:foreground ,zen-mod-yellow-2))))
   `(org-headline-done ((,class (:foreground ,zen-mod-green+3))))
   `(org-hide ((,class (:foreground ,zen-mod-bg-1))))
   `(org-level-1 ((,class (:foreground ,zen-mod-orange))))
   `(org-level-2 ((,class (:foreground ,zen-mod-green+1))))
   `(org-level-3 ((,class (:foreground ,zen-mod-blue-1))))
   `(org-level-4 ((,class (:foreground ,zen-mod-yellow-2))))
   `(org-level-5 ((,class (:foreground ,zen-mod-cyan))))
   `(org-level-6 ((,class (:foreground ,zen-mod-green-1))))
   `(org-level-7 ((,class (:foreground ,zen-mod-red-4))))
   `(org-level-8 ((,class (:foreground ,zen-mod-blue-4))))
   `(org-link ((,class (:foreground ,zen-mod-yellow-2 :underline t))))
   `(org-scheduled ((,class (:foreground ,zen-mod-green+4))))
   `(org-scheduled-previously ((,class (:foreground ,zen-mod-red-4))))
   `(org-scheduled-today ((,class (:foreground ,zen-mod-blue+1))))
   `(org-special-keyword ((,class (:foreground ,zen-mod-yellow-1))))
   `(org-table ((,class (:foreground ,zen-mod-green+2))))
   `(org-tag ((,class (:bold t :weight bold))))
   `(org-time-grid ((,class (:foreground ,zen-mod-orange))))
   `(org-todo ((,class (:bold t :foreground ,zen-mod-red :weight bold))))
   `(org-upcoming-deadline ((,class (:inherit font-lock-keyword-face))))
   `(org-warning ((,class (:bold t :foreground ,zen-mod-red :weight bold))))

   ;; outline
   `(outline-8 ((,class (:inherit default))))
   `(outline-7 ((,class (:inherit outline-8 :height 1.0))))
   `(outline-6 ((,class (:inherit outline-7 :height 1.0))))
   `(outline-5 ((,class (:inherit outline-6 :height 1.0))))
   `(outline-4 ((,class (:inherit outline-5 :height 1.0))))
   `(outline-3 ((,class (:inherit outline-4 :height 1.0))))
   `(outline-2 ((,class (:inherit outline-3 :height 1.0))))
   `(outline-1 ((,class (:inherit outline-2 :height 1.0))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((,class (:foreground ,zen-mod-cyan))))
   `(rainbow-delimiters-depth-2-face ((,class (:foreground ,zen-mod-yellow))))
   `(rainbow-delimiters-depth-3-face ((,class (:foreground ,zen-mod-blue+1))))
   `(rainbow-delimiters-depth-4-face ((,class (:foreground ,zen-mod-red+1))))
   `(rainbow-delimiters-depth-5-face ((,class (:foreground ,zen-mod-orange))))
   `(rainbow-delimiters-depth-6-face ((,class (:foreground ,zen-mod-blue-1))))
   `(rainbow-delimiters-depth-7-face ((,class (:foreground ,zen-mod-green+4))))
   `(rainbow-delimiters-depth-8-face ((,class (:foreground ,zen-mod-red-3))))
   `(rainbow-delimiters-depth-9-face ((,class (:foreground ,zen-mod-yellow-2))))
   `(rainbow-delimiters-depth-10-face ((,class (:foreground ,zen-mod-green+2))))
   `(rainbow-delimiters-depth-11-face ((,class (:foreground ,zen-mod-blue+1))))
   `(rainbow-delimiters-depth-12-face ((,class (:foreground ,zen-mod-red-4))))

   ;; rpm-mode
   `(rpm-spec-dir-face ((,class (:foreground ,zen-mod-green))))
   `(rpm-spec-doc-face ((,class (:foreground ,zen-mod-green))))
   `(rpm-spec-ghost-face ((,class (:foreground ,zen-mod-red))))
   `(rpm-spec-macro-face ((,class (:foreground ,zen-mod-yellow))))
   `(rpm-spec-obsolete-tag-face ((,class (:foreground ,zen-mod-red))))
   `(rpm-spec-package-face ((,class (:foreground ,zen-mod-red))))
   `(rpm-spec-section-face ((,class (:foreground ,zen-mod-yellow))))
   `(rpm-spec-tag-face ((,class (:foreground ,zen-mod-blue))))
   `(rpm-spec-var-face ((,class (:foreground ,zen-mod-red))))

   ;; show-paren
   `(show-paren-mismatch ((,class (:foreground ,zen-mod-red-3 :background ,zen-mod-bg :weight bold))))
   `(show-paren-match ((,class (:foreground ,zen-mod-blue-1 :background ,zen-mod-bg :weight bold))))

   ;; SLIME
   `(slime-repl-inputed-output-face ((,class (:foreground ,zen-mod-red))))

   ;; whitespace-mode
   `(whitespace-space ((,class (:background ,zen-mod-bg :foreground ,zen-mod-bg+1))))
   `(whitespace-hspace ((,class (:background ,zen-mod-bg :foreground ,zen-mod-bg+1))))
   `(whitespace-tab ((,class (:background ,zen-mod-bg :foreground ,zen-mod-red))))
   `(whitespace-newline ((,class (:foreground ,zen-mod-bg+1))))
   `(whitespace-trailing ((,class (:foreground ,zen-mod-red :background ,zen-mod-bg))))
   `(whitespace-line ((,class (:background ,zen-mod-bg-05 :foreground ,zen-mod-magenta))))
   `(whitespace-space-before-tab ((,class (:background ,zen-mod-orange :foreground ,zen-mod-orange))))
   `(whitespace-indentation ((,class (:background ,zen-mod-yellow, :foreground ,zen-mod-red))))
   `(whitespace-empty ((,class (:background ,zen-mod-yellow :foreground ,zen-mod-red))))
   `(whitespace-space-after-tab ((,class (:background ,zen-mod-yellow :foreground ,zen-mod-red))))

   ;; wanderlust
   `(wl-highlight-folder-few-face ((,class (:foreground ,zen-mod-red-2))))
   `(wl-highlight-folder-many-face ((,class (:foreground ,zen-mod-red-1))))
   `(wl-highlight-folder-path-face ((,class (:foreground ,zen-mod-orange))))
   `(wl-highlight-folder-unread-face ((,class (:foreground ,zen-mod-blue))))
   `(wl-highlight-folder-zero-face ((,class (:foreground ,zen-mod-fg))))
   `(wl-highlight-folder-unknown-face ((,class (:foreground ,zen-mod-blue))))
   `(wl-highlight-message-citation-header ((,class (:foreground ,zen-mod-red-1))))
   `(wl-highlight-message-cited-text-1 ((,class (:foreground ,zen-mod-red))))
   `(wl-highlight-message-cited-text-2 ((,class (:foreground ,zen-mod-green+2))))
   `(wl-highlight-message-cited-text-3 ((,class (:foreground ,zen-mod-blue))))
   `(wl-highlight-message-cited-text-4 ((,class (:foreground ,zen-mod-blue+1))))
   `(wl-highlight-message-header-contents-face ((,class (:foreground ,zen-mod-green))))
   `(wl-highlight-message-headers-face ((,class (:foreground ,zen-mod-red+1))))
   `(wl-highlight-message-important-header-contents ((,class (:foreground ,zen-mod-green+2))))
   `(wl-highlight-message-header-contents ((,class (:foreground ,zen-mod-green+1))))
   `(wl-highlight-message-important-header-contents2 ((,class (:foreground ,zen-mod-green+2))))
   `(wl-highlight-message-signature ((,class (:foreground ,zen-mod-green))))
   `(wl-highlight-message-unimportant-header-contents ((,class (:foreground ,zen-mod-fg))))
   `(wl-highlight-summary-answered-face ((,class (:foreground ,zen-mod-blue))))
   `(wl-highlight-summary-disposed-face ((,class (:foreground ,zen-mod-fg
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((,class (:foreground ,zen-mod-blue))))
   `(wl-highlight-summary-normal-face ((,class (:foreground ,zen-mod-fg))))
   `(wl-highlight-summary-thread-top-face ((,class (:foreground ,zen-mod-yellow))))
   `(wl-highlight-thread-indent-face ((,class (:foreground ,zen-mod-magenta))))
   `(wl-highlight-summary-refiled-face ((,class (:foreground ,zen-mod-fg))))
   `(wl-highlight-summary-displaying-face ((,class (:underline t :weight bold))))

   ;; which-func-mode
   `(which-func ((,class (:foreground ,zen-mod-green+1))))))

(custom-theme-set-variables
 'zen-mod
 '(ansi-color-names-vector [zen-mod-bg zen-mod-red zen-mod-green zen-mod-yellow
                                       zen-mod-blue zen-mod-magenta zen-mod-cyan zen-mod-fg]))

(provide-theme 'zen-mod)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; zen-mod-theme.el ends here.
