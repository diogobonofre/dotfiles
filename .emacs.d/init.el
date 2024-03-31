;; General
(desktop-save-mode 1) ;; Save sessions

;; Help with maintaining this file clean
(setq custom-file "~/.emacs.d/autoconfig.el")
(load custom-file)

;; Save all Emacs temporary files (~, #) in one directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

;; Text Editor
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;; Visual
(scroll-bar-mode -1)                                  ; Display scroll bar
(menu-bar-mode -1)                    				        ; Display menu bar
(tool-bar-mode -1)                                    ; Display tool bar
(global-display-line-numbers-mode)                    ; Enable line numbers
(menu-bar--display-line-numbers-mode-relative)        ; Set relative line numbers
;; Set font family, style, and size
(set-face-attribute 'default nil
                    :family "Iosevka Nerd Font Mono"	; Font family
                    :height 250                       ; Font size (* 10)
                    :weight 'medium                   ; Font weight: normal, bold, etc.
                    :width 'normal)             			; Font width: normal, condensed, etc.
(custom-set-faces					;; Customized fonts
 '(font-lock-comment-face ((t (:slant italic))))
 '(font-lock-keyword-face ((t (:slant italic)))))
(load-theme 'plateau)
	      
;; Enable Electric Pair
(electric-pair-mode 1)
(setq electric-pair-pairs '((?\( . ?\))
			    (?\[ . ?\])
			    (?\{ . ?\})
			    (?\" . ?\")
			    (?\' . ?\')))

;; Packages
;; Set package archives
(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("marmalade" . "https://marmalade-repo.org/packages/")))

;; Initialize packages
(package-initialize)

;; Install packages if they're not already installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Set up use-package
(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;; Completion
(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

;; Save history between sessions
(use-package savehist
  :init
  (savehist-mode))

(setq history-length 100)

;; Helps in corfu completions too
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Give more information about files and dirs
(use-package marginalia
  :after vertico
  :ensure t
  :custom
  (marginalia-annotators
   '(marginalia-annotators-heavy
     marginalia-annotators-light nil))
  :init
  (marginalia-mode))

;; Configure directory extension.
(use-package vertico-directory
  :after vertico
  :ensure nil
  ;; More convenient directory navigation commands
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  ;; Tidy shadowed file names
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package nerd-icons
  :ensure t
  :custom
  (nerd-icons-font-family "Iosevka NFP"))

;; Discord Rich Presence
(use-package elcord
    :ensure t)

;; Wakatime
(use-package 'wakatime-mode)

;; Themes
(use-package autothemer
    :ensure t)

(use-package gruber-darker-theme)
