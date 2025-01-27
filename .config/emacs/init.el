(setq custom-file "~/.config/emacs/custom-variables.el")

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(load-theme 'tango-dark t)

(custom-set-faces
 '(default ((t (:family "Monospaced" :height 120 :weight medium))))
 '(variable-pitch ((t (:family "DeJavu Serif" :height 120 :weight medium))))
 '(fixed-pitch ((t (:family "Monospaced" :height 120 :weight medium)))))

(global-visual-line-mode)

(add-hook 'prog-mode-hook
          (lambda ()
            (display-line-numbers-mode t)
            (setq display-line-numbers 'relative)))

(add-hook 'org-mode-hook
          (lambda ()
            (display-line-numbers-mode t)
            (setq display-line-numbers 'absolute)))

(electric-pair-mode t)
(setq electric-pair-delete-adjacent-pairs t)

(fido-vertical-mode 1)

(setq font-lock-maximum-decoration t)

(use-package rainbow-mode :ensure t)

(use-package org
  :config
  (setq org-startup-indented t
	org-hide-leading-stars t
	org-clock-sound "~/Music/emacs-pomodoro-ding.wav"))

(use-package eglot
  :ensure t)
