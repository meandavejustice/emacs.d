;;; package --- Summary

;;; Commentary:

;;; Code:
(unless (package-installed-p 'helm)
  (package-install 'helm))

(require 'helm-config)

(helm-mode 1)
(global-set-key (kbd "C-c j") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(provide 'cfg-helm)
;;; cfg-helm.el ends here
