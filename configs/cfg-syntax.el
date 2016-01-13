;;; package --- Summary

;;; Commentary:

;;; Code:
(unless (package-installed-p 'json-mode)
  (package-install 'json-mode))

(unless (package-installed-p 'web-mode)
  (package-install 'web-mode))

; common lisp interpreter
; (load (expand-file-name "~/quicklisp/slime-helper.el"))
; (setq inferior-lisp-program "/usr/local/bin/sbcl")

; jScript
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(setq js-indent-level 2)

(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(json-jsonlist)))

; (require 'node-resolver)
; (add-hook 'js3-mode-hook 'ac-js2-mode)
; (add-hook 'js3-mode-hook 'node-resolver-start)
; (add-hook 'js3-mode-hook (lambda () (tern-mode t)))

; function => lambda
(defun js-lambda ()
  "Renders anonymous functions as a lambda."
  (interactive) (insert "function () {
  };")
  (backward-char 6))

  (defun js-pretty-lambdas ()
  (font-lock-add-keywords
  nil `(("\\(function *\\)("
  (0 (progn (compose-region (match-beginning 1) (match-end 1)
  , (make-char 'greek-iso8859-7 107))
  nil))))))

(add-hook 'js-mode-hook 'js-pretty-lambdas)
(eval-after-load 'js-mode
  '(define-key js-mode-map (kbd "C-c l") 'js-lambda))

; set up prettier json files
(require 'json-mode)
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

; CSS defaults
(setq css-indent-offset 4)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.hb\\.html\\ " . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\ " . web-mode))

;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
  "Hooks for Web mode.  Adjust indent."
  ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)

; JAVASCRIPT MODE
; use js3 with all the js2 nice stuff.
; autocomplete for browser stuff.
; tern mode working fully
; tern-working with require and nodejs
; yassnippets
; skewer mode working.
; a good repl with zilla, nodejs, and webkit.
; jshint flymake, as well as flyspell prog mode
; open all of these minibuffers in helm mode

(provide 'cfg-syntax)
;;; cfg-syntax.el ends here
