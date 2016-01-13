;;; package --- Summary

;;; Commentary:

;;; Code:
(load-theme 'xemacs t t)
(enable-theme 'xemacs)

(require 'package)
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
  '("elpa" . "http://tromey.com/elpa/"))

(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)

;(add-to-list 'load-path "~/bin/")

(setq load-path (cons "~/.emacs.d/configs/" load-path))

;; Defaults

(defalias 'wsm 'whitespace-mode)

;; faster keystroke echoing
(setq echo-keystrokes 0.1)

;; (global-hl-line-mode t)
;; (set-face-background 'hl-line "#000")

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; (setq inferior-lisp-command "lein repl"
;;       cider-repl-popup-stacktraces t)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)


;; (setq gnus-button-url 'browse-url-generic
;;           browse-url-generic-program "firefox"
;;           browse-url-browser-function gnus-button-url)

;; (add-hook 'text-mode-hook 'turn-on-flyspell)
;; (add-hook 'prog-mode-hook 'flyspell-prog-mode)
;; (eval-afterload 'auto-complete
;;                 '(ac-flyspell-workaround))

; SHUT UP!
(setq ring-bell-function 'ignore)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
(if (fboundp `menu-bar-mode) (menu-bar-mode -1)) ;; minimal chrome
(if (fboundp `tool-bar-mode) (tool-bar-mode -1)) ;; no toolbar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(defalias 'qrr 'query-replace-regex)
(defalias 'rs 'replace-string)
(defalias 'yes-or-no-p 'y-or-n-p) ;; only type  y  instead of  yes
(setq inhibit-splash-screen t) ;; no splash screen
(setq-default indent-tabs-mode nil) ;; no tabs!
(setq-default tab-width 2)
; (setq fill-column 80) ;; M-q should fill at 80 chars, not 75
(setq-default truncate-lines 1) ;; no wordwrap

; (desktop-save-mode nil) ;; auto-save buffer state on close for a later time.

; backups DIR
; (setq backup-directory-alist '(("." . "~/.saves")))
(require 'setup-editing)
(require 'setup-convenience)                                        ;
(require 'setup-files)

;; (require 'fill-column-indicator)
;; (require 'pretty-mode)
;; (global-pretty-mode t)
(require 'cfg-multi-cursors)

(require 'cfg-snippets)

(require 'cfg-autocomplete)

; play music
(require 'cfg-emms)

(require 'cfg-emmet)

(require 'cfg-syntax)

(require 'cfg-projectile)

(require 'cfg-helm)

; TODO: fix emails one day
; (require 'cfg-mu4e)

;; load calendar
(require 'calfw)

(require 'server)

(unless (server-running-p)
    (server-start))

;; fix shell prompt
(setq comint-prompt-read-only)

(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Set *scratch* message. TODO: Set this to something cool, blank for now
(setq initial-scratch-message "")

(defun remove-scratch-buffer ()
  "Remove *scratch* from buffer after the mode has been set."
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
	  '(lambda ()
	     (let ((buffer "*Completions*"))
	       (and (get-buffer buffer)
		    (kill-buffer buffer)))))

;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

;; Show only one active window when opening multiple files at the same time.
(add-hook 'window-setup-hook 'delete-other-windows)

;;; init.el ends here
