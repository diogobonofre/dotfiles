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

(add-hook 'org-mode-hook (lambda () (display-line-numbers-mode 0)))

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

(use-package eglot :ensure t)

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

;; Mini-buffer completion
(setq completions-detailed t)			; additional information for options in *Completion* buffer
; (setq completion-cycle-threshold 10)		; TAB will cycle between options instead of completions up to 10 options
(setq read-buffer-completion-ignore-case t)	; disabling case sensitive matching
(setq read-file-name-completion-ignore-case t)

;; Default external browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium")

;; Starts dired in dired-omit-mode by default -> C-x M-o to toggle
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode)))

(add-hook 'org-mode-hook (lambda () (variable-pitch-mode)))

(setq scroll-step 1			; how much it scrolls each time 
      scroll-preserve-screen-position t ; prevent text from jumping beneath the cursor
      scroll-margin 8			; minimum number of lines up and above the cursor
      scroll-conservatively 10000)	; scroll only when extremely necessary
