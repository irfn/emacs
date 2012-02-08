;; -*- eval: (rainbow-mode); -*-
;;; Deviant-theme.el --- Custom face theme for Emacs

;; Copyright (C) 2010 Darksair.

;; This file is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(defconst dv-macp (eq system-type 'darwin) "Are we running in Mac OS?")

(defun color-sRGB (color-tuple)
  (car color-tuple))

(defun color-genRGB (color-tuple)
  (car (cdr color-tuple)))

(defun dv-color (color-tuple)
  (if dv-macp
      (color-genRGB color-tuple)
    (color-sRGB color-tuple)))

(deftheme Deviant
  "Inspired by the color scheme of deviantart.com (v2)")

;; Colors, in (sRGB GenericRGB)
(defvar dv-default-bg '("#2e3735" "#232a28"))
(defvar dv-default-fg '("#b6beb4" "#a8b1a4"))
(defvar dv-cursor-bg '("#c73a7c" "#b0256c"))
(defvar dv-cursor-fg dv-default-bg)
(defvar dv-region-bg '("#afc81c" "#a0c116"))
(defvar dv-region-fg dv-default-bg)
(defvar dv-modeline-bg '("#3e4745" "#303735"))
(defvar dv-modeline-fg dv-default-fg)
(defvar dv-modeline-inact-bg dv-default-bg)
(defvar dv-modeline-inact-fg '("#666e64" "#545b50"))
(defvar dv-fringe-bg dv-modeline-bg)
(defvar dv-mb-prompt-fg dv-region-bg)
(defvar dv-builtin-fg '("#33afbd" "#3c9fb1"))
(defvar dv-comment-fg '("#676b65" "#555852"))
(defvar dv-constant-fg '("#bebeb4" "#b1b1a4"))
(defvar dv-function-fg '("#99a839" "#8a9b0f"))
(defvar dv-keyword-fg '("#2697c8" "#2e82c1"))
(defvar dv-string-fg '("#cca029" "#bd9200"))
(defvar dv-type-fg '("#54ba6c" "#54af4e"))
(defvar dv-var-fg dv-default-fg)
(defvar dv-warn-fg '("#c73a7c" "#b0256c"))
(defvar dv-search-bg '("#5db4d9" "#56a3d4"))
(defvar dv-search-fg dv-default-bg)
(defvar dv-lazy-hl-bg '("#465451" "#37433f"))
(defvar dv-link-fg '("#599bb0" "#4f89a3"))
(defvar dv-link-old-fg '("#818780" "#6f746c"))
(defvar dv-button-bg '("#242b2a" "#1c201f"))
(defvar dv-header-bg '("#3e4745" "#303735"))
(defvar dv-header-fg '("#868e84" "#747c70"))

(custom-theme-set-faces
 'Deviant
 `(default ((t (:background ,(dv-color dv-default-bg)
                :foreground ,(dv-color dv-default-fg)))))
 `(cursor ((t (:background ,(dv-color dv-cursor-bg)
               :foreground ,(dv-color dv-cursor-fg)))))
 `(region ((t (:background ,(dv-color dv-region-bg)
               :foreground ,(dv-color dv-region-fg)))))
 `(mode-line ((t (:background ,(dv-color dv-modeline-bg)
                  :foreground ,(dv-color dv-modeline-fg)))))
 `(mode-line-inactive ((t (:background ,(dv-color dv-modeline-inact-bg)
                           :foreground ,(dv-color dv-modeline-inact-fg)))))
 `(fringe ((t (:background ,(dv-color dv-fringe-bg)))))
 `(minibuffer-prompt ((t (:slant italic :foreground ,(dv-color dv-mb-prompt-fg)))))
 `(font-lock-builtin-face ((t (:foreground ,(dv-color dv-builtin-fg)))))
 `(font-lock-comment-face ((t (:slant italic :foreground ,(dv-color dv-comment-fg)))))
 `(font-lock-constant-face ((t (:slant italic :foreground ,(dv-color dv-constant-fg)))))
 `(font-lock-function-name-face ((t (:foreground ,(dv-color dv-function-fg)))))
 `(font-lock-keyword-face ((t (:foreground ,(dv-color dv-keyword-fg)))))
 `(font-lock-string-face ((t (:foreground ,(dv-color dv-string-fg)))))
 `(font-lock-type-face ((t (:foreground ,(dv-color dv-type-fg)))))
 `(font-lock-variable-name-face ((t (:foreground ,(dv-color dv-var-fg)))))
 `(font-lock-warning-face ((t (:foreground ,(dv-color dv-warn-fg)))))
 `(isearch ((t (:background ,(dv-color dv-search-bg)
                :foreground ,(dv-color dv-search-fg)))))
 `(lazy-highlight ((t (:background ,(dv-color dv-lazy-hl-bg)))))
 `(link ((t (:foreground ,(dv-color dv-link-fg) :underline t))))
 `(link-visited ((t (:foreground ,(dv-color dv-link-old-fg) :underline t))))
 `(button ((t (:background ,(dv-color dv-button-bg) :underline t))))
 `(header-line ((t (:background ,(dv-color dv-header-bg)
                    :foreground ,(dv-color dv-header-fg))))))

(provide-theme 'Deviant)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; Deviant-theme.el  ends here
