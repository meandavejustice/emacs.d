;;; package --- Summary

;;; Commentary:

;;; Code:

(global-set-key (kbd "M-g") 'goto-line)

;The generic apropos (of any symbol) is MUCH more useful than apropos-command
(global-set-key "\C-ha" 'apropos)

;Suspend-frame is stupid
(global-set-key "\C-z" 'ignore)
(global-set-key "\C-x\C-z" 'ignore)
(global-set-key (kbd "C-;") 'ibuffer)
(global-set-key "\C-xg" 'magit-status)

(provide 'cfg-keybindings)
;;; cfg-keybindings.el ends here
