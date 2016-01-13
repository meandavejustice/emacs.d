;;; package --- Summary

;;; Commentary:

;;; Code:
(unless (package-installed-p 'emmet-mode)
  (package-install 'emmet-mode))

(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent 2 spaces.
(setq emmet-move-cursor-between-quotes t) ;; default nil

                                        ; emmet autocomplete
(require 'ac-emmet) ;; Not necessary if using ELPA package
(add-hook 'sgml-mode-hook 'ac-emmet-html-setup)
(add-hook 'css-mode-hook 'ac-emmet-css-setup)

(provide 'cfg-emmet)
;;; cfg-emmet.el ends here
