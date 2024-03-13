;; Text Editing
(delete-selection-mode 1)     ;; Delete the current selection when start typing
(require 'autopair)
(autopair-global-mode 1)

;; IDO
(ido-mode 1)                  ;; Set IDO search completion
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

;; Visual
;; Colors
(load-theme 'wombat t)        ;; Set theme

;; Fonts

;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

