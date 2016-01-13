;;; package --- Summary

;;; Commentary:

;;; Code:
(global-auto-revert-mode)

; GROUP: Convenience -> Hippe Expand
;; hippie-expand is a better version of dabbrev-expand.
;; While dabbrev-expand searches for words you already types, in current;; buffers and other buffers, hippie-expand includes more sources,
;; such as filenames, klll ring...
(global-set-key (kbd "M-/") 'hippie-expand) ;; replace dabbrev-expand
(setq
 hippie-expand-try-functions-list
 '(try-expand-dabbrev ;; Try to expand word "dynamically", searching the current buffer.
   try-expand-dabbrev-all-buffers ;; Try to expand word "dynamically", searching all other buffers.
   try-expand-dabbrev-from-kill ;; Try to expand word "dynamically", searching the kill ring.
   try-complete-file-name-partially ;; Try to complete text as a file name, as many characters as unique.
   try-complete-file-name ;; Try to complete text as a file name.
   try-expand-all-abbrevs ;; Try to expand word before point according to all abbrev tables.
   try-expand-list ;; Try to complete the current line to an entire line in the buffer.
   try-expand-line ;; Try to complete the current line to an entire line in the buffer.
   try-complete-lisp-symbol-partially ;; Try to complete as an Emacs Lisp symbol, as many characters as unique.
   try-complete-lisp-symbol) ;; Try to complete word as an Emacs Lisp symbol.
 )

;; GROUP: Convenience -> HL Line
(global-hl-line-mode 1)
;; (set-face-background 'hi-line "#FF6100")


(setq ibuffer-use-other-window t)
(add-hook 'prog-mode-hook 'linum-mode)

;; whenever you create useless whitespace, the whitespace is highlighted
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

(global-set-key (kbd "C-c w") 'whitespace-mode)

(add-hook 'after-init-hook 'global-company-mode)

(require 'expand-region)
(global-set-key (kbd "M-m") 'er/expand-region)

(require 'rebox2)
(global-set-key [(meta q)] 'rebox-dwim)
(global-set-key [(shift meta q)] 'rebox-cycle)
(add-hook 'prog-mode-hook (lambda ()
                            (set (make-local-variable 'rebox-style-loop) '(25 17 21))
                            (set (make-local-variable 'rebox-min-fill-column) 40)
                            (rebox-mode 1)))

(projectile-global-mode)

(provide 'setup-convenience)
;;; setup-convenience.el ends here
