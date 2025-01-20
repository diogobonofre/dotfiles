;; Prevent Emacs from creating customizations on this file
(setq custom-file "~/.emacs.d/emacs-custom.el")

;; Guarantees that use-package is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Remove GUI clutter
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;; Set color theme
(load-theme 'ef-deuteranopia-dark t)

;; Define line ending behavior
(global-visual-line-mode)

;; Enable line numbers in prog-mode (relative)
(add-hook 'prog-mode-hook
          (lambda ()
            (display-line-numbers-mode t)
            (setq display-line-numbers 'relative)))

;; Enable normal line numbers in org-mode
(add-hook 'org-mode-hook
          (lambda ()
            (display-line-numbers-mode t)
            (setq display-line-numbers 'absolute)))

;; Auto-complete characters commonly used in pairs like ([{"''"}])
(electric-pair-mode t)
(setq electric-pair-delete-adjacent-pairs t)

;; Highlight color codes in buffers
(use-package rainbow-mode :ensure t)

;; Pack of themes that are easy in the eyes
(use-package ef-themes :ensure t)

;; Org extends the organization and producitivity features capabilities of Emacs
(use-package org
  :ensure t
  :config
  (setq org-startup-indented t
	org-hide-leading-stars t
	org-clock-sound "~/Music/emacs-pomodoro-ding.wav"))

;; Vertico provides vertical completion
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

;; Orderless completion style
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

;; Additional Emacs settings for minibuffers
(use-package emacs
  :custom
  (read-extended-command-predicate #'command-completion-default-include-p)
  :init
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode))

;; Proper terminal implementation inside Emacs
 (use-package vterm
  :ensure t)

;; More tooling for PDF mode
(use-package pdf-tools
  :ensure t)

(defun run-python-dynamic ()
  "Prompt for Python interpreter and arguments before starting the shell."
  (interactive)
  (let ((python-shell-interpreter (read-string "Interpreter: " "poetry"))
        (python-shell-interpreter-args (read-string "Interpreter args: " "run python -i")))
    (run-python)))
