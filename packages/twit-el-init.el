(add-to-list 'load-path "~/.emacs.d/packages/twit-el")
(defface twit-zebra-1-face
  '((((class color) (background light))
	 (:background "gray89"))
	(((class color) (background dark))
	 (:background "3F3B3B"))
	(t (:inverse)))
  "Color one of zebra-striping of recent tweets and followers list."
  :group 'twit)

(defface twit-zebra-2-face
  '((((class color) (background light))
	 (:background "AliceBlue" :inverse))
	(((class color) (background dark))
	 (:background "#252323")))
  "Color two of zebra-striping of recent tweets and followers list."
  :group 'twit)

(defface twit-author-face
  '((t
	  (:height 0.7
	   :weight bold
	   :family "monaco")))
  "The font face to use for the authors name"
  :group 'twit)

(defface twit-message-face
  '((default
	  :family "monaco"
	  :height 0.9))
  "The font face to use for a twitter message."
  :group 'twit)

(defface twit-info-face
  '((t (:height 0.7 :slant italic)))
  "Face for displaying where, how and when someone tweeted."
  :group 'twit)


(require 'twit)
(twit-minor-mode)
(setq twit-show-user-images t)
