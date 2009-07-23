(setq load-path (cons  "~/.emacs.d/packages/clojure-mode" load-path))
(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(setq load-path (cons  "~/.emacs.d/packages/swank-clojure" load-path))
(require 'swank-clojure-autoload)
(setq swank-clojure-jar-path "/opt/local/share/java/clojure/lib/clojure.jar")

(eval-after-load 'swank-clojure
  '(progn
     (add-to-list 'swank-clojure-init-files
                  (expand-file-name "~/.clojure/user.clj"))))