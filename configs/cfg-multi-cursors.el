;;; package --- Summary

;;; Commentary:

;;; Code:
(unless (package-installed-p 'multiple-cursors)
  (package-install 'multiple-cursors))


(require 'multiple-cursors)
(global-set-key (kbd "C-c C-u") 'mc/edit-lines)
(provide 'cfg-multi-cursors)
;;; cfg-multi-cursors.el ends here
