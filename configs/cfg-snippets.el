;;; package --- Summary

;;; Commentary:

;;; Code:
(unless (package-installed-p 'yasnippet)
  (package-install 'yasnippet))

(require 'yasnippet)
;; fix tab weirdness
(setq yas-indent-line nil)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets" ;; personal snippets
        "~/.emacs.d/elpa/yasnippet-20150811.1222/snippets" ;; default snippets
        ))

(yas-global-mode 1)
(provide 'cfg-snippets)
;;; cfg-snippets.el ends here
