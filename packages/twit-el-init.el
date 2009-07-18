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

(require 'twit)
