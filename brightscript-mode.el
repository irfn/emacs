
(defvar brightscript-keywords 
  '("If" "Then" "Else If" "Else" "End If" "And" "Or" "Not"
    "For" "To" "Step" "Exit For" "For Each" "In" 
    "While" "End While" "Exit While"
    "Function" "End Function" "As" "Return"
    "Sub" "End Sub"
    "Print" "Goto" "Dim" "End" "Stop" "Rem")
  "BrightScript keywords")
(defvar brightscript-keywords-regexp (regexp-opt brightscript-keywords 'words))

(defvar brightscript-types
  '("Boolean" "Integer" "Float" "Double" "String" "Object" "Void")
  "BrightScript built in types")
(defvar brightscript-types-regexp (regexp-opt brightscript-types 'words))

(defvar brightscript-contstants
  '("ERR_NORMAL_END" "ERR_VALUE_RETURN" "ERR_USE_OF_UNINIT_VAR" "ERR_DIV_ZERO" 
    "ERR_TM" "ERR_USE_OF_UNINIT_VAR" "ERR_RO2" "ERR_RO4" "ERR_SYNTAX" "ERR_WRONG_NUM_PARAM"
    )
  "BrightScript constants")
(defvar brightscript-contstants-regexp (regexp-opt brightscript-contstants 'words))

(defvar brightscript-builtins
  '("Type" "Rnd" "Box" "Run" "Eval" "GetLastRunCompileError" "GetLastRunRuntimeError")
  "BrightScript built-ins")
(defvar brightscript-builtins-regexp (regexp-opt brightscript-builtins 'words))

(defvar brightscript-functions
  '(   
    ;;Global Utility
    "Sleep" "Wait" "CreateObject" "GetInterface" "UpTime" "RebootSystem" "ListDir" "ReadAsciiFile" "WriteAsciiFile" "CopyFile" "MatchFiles" "DeleteFile" "DeleteDirectory" "CreateDirectory" "FormatDrive"

    ;;Strings
    "UCase" "LCase" "Asc" "Chr" "Instr" "Left" "Len" "Mid" "Right" "Str" "Val" 
    ;;"String" - Conflichts with type of the same name

    ;;Math
    "Abs" "Atn" "Cos" "Csng" "Cdbl" "Exp" "Fix" "Int" "Log" "Sgn" "Sin" "Sqr" "Tan"
    )
  "BrightScript functions")
(defvar brightscript-functions-regexp (regexp-opt brightscript-functions 'words))





;;clear memory
;; (setq brightscript-keywords nil)
;; (setq brightscript-types nil)
;; (setq brightscript-contstants nil)
;; (setq brightscript-builtins nil)
;; (setq brightscript-functions nil)


(setq brightscript-fontlock-kwds
      `(
        (,brightscript-contstants-regexp . font-lock-constant-face)
        (,brightscript-keywords-regexp . font-lock-keyword-face)
        (,brightscript-functions-regexp . font-lock-function-name-face)
        (,brightscript-builtins-regexp . font-lock-builtin-face)
        (,brightscript-types-regexp . font-lock-type-face)
        ))

;;clear memory
;; (setq brightscript-keywords-regexp nil)
;; (setq brightscript-types-regexp nil)
;; (setq brightscript-contstants-regexp nil)
;; (setq brightscript-builtins-regexp nil)
;; (setq brightscript-functions-regexp nil)

(defun brightscript-comment-dwim (arg)
"Comment or uncomment current line or region in a smart way.
For detail, see `comment-dwim'."
   (interactive "*P")
   (require 'newcomment)
   (let ((deactivate-mark nil) (comment-start "'") (comment-end ""))
     (comment-dwim arg)))


(define-derived-mode brightscript-mode fundamental-mode
  (setq font-lock-defaults '(brightscript-fontlock-kwds nil  t))
  (setq mode-name "brightscript-mode")
  ;; modify the keymap
  (define-key brightscript-mode-map [remap comment-dwim] 'brightscript-comment-dwim)

  (modify-syntax-entry ?' "< b" brightscript-mode-syntax-table)
  (modify-syntax-entry ?\n "> b" brightscript-mode-syntax-table)

)


(provide 'brightscript-mode)


