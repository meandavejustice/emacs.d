;;; package --- Summary

;;; Commentary:

;;; Code:
(unless (package-installed-p 'emms)
  (package-install 'emms))

(require 'emms)

(emms-all)
(emms-default-players)
(setq emms-source-file-default-directory "~/Share-Everything/Music/")

(global-set-key (kbd "<XF86AudioPlay>") 'emms-pause)
(global-set-key (kbd "<XF86AudioStop>") 'emms-stop)
(global-set-key (kbd "<XF86AudioPrev>") 'emms-previous)
(global-set-key (kbd "<XF86AudioNext>") 'emms-next)

(provide 'cfg-emms)
;;; cfg-emms.el ends here
