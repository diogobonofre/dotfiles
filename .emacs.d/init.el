(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(load-theme 'modus-vivendi t)
(global-visual-line-mode)
(menu-bar--display-line-numbers-mode-relative)
(global-display-line-numbers-mode t)
(electric-pair-mode t)
(setq electric-pair-delete-pair t)

(use-package org
  :ensure t
  :config
  (setq org-startup-indented t
	org-hide-leading-stars t
	org-clock-sound "~/Music/emacs-pomodoro-ding.wav"))
