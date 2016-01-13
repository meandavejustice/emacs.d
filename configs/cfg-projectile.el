;;; package --- Summary

;;; Commentary:

;;; Code:
(unless (package-installed-p 'projectile)
  (package-install 'projectile))

(require 'projectile)

(projectile-global-mode)
(global-set-key (kbd "C-c h") 'helm-projectile)

(provide 'cfg-projectile)
;;; cfg-projectile.el ends here
