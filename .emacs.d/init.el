(require 'org)

(org-babel-load-file
 (expand-file-name
  "config.org"
  user-emacs-directory))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number ((t (:inherit default :background "#000000" :foreground "#dddddd"))))
 '(line-number-current-line ((t (:inherit default :background "#000000" :foreground "#5f87af")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("691055ca72d9549e4bdfa77c3362e96fbe414a44baa56b4593e8d39d7b1ce55e" default))
 '(warning-suppress-log-types '((emacs))))
