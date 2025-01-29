;;; init.el --- The Emacs sane default configuration  -*- lexical-binding: t; -*-
;; Copyright (C) 2025 Diogo Bonofre
;; Author: Diogo Bonofre <diogobonofre@gmail.com>
;; Created: 29 Jan 2025
;; Keywords: emacs configuration init
;; URL: https://github.com/diogobonofre/dotfiles
;; Package-Requires: (emacs "29.x")
;; Commentary: This is a Emacs configuration who tries to give more sane defaults,
;;	       several quality of life improvements and to be a reference for other
;;	       ergonomic configurations for new users and old lazy ones. It's not
;;	       an attempt of creating a Visual Studio Code replica inside Emacs,
;;	       instead, it's an attempt of using Emacs to it's fullest in it's
;;	       own way, respecting the editor philosophy and design.
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software: you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free Software
;; Foundation, either version 3 of the License, or (at your option) any later version.
;; This program is distributed in the hope that it will be useful, but WITHOUT ANY
;; WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
;; PARTICULAR PURPOSE.
;;
;; See the GNU General Public License for more details. You should have received a
;; copy of the GNU General Public License along with this program. If not, see
;; <https://www.gnu.org/licenses/>.

;;; Code

;;; Packages & File Structure
(setq custom-file "~/.config/emacs/custom-variables.el")

(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
	("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Change the user-emacs-directory to keep unwanted things out of ~/.config/emacs
(setq user-emacs-directory (expand-file-name "~/.cache/emacs/")
      url-history-file (expand-file-name "url/history" user-emacs-directory))

;;; Text Editing
(delete-selection-mode t)	; Start writing overrite current selection

(setq electric-pair-delete-adjacent-pairs t)
(electric-pair-mode t)		; Autocomplete pairs ([{}])

(setq dired-kill-when-opening-new-dired-buffer t) ; Kill the current buffer when selecting new directory
(setq vc-follow-symlinks t)			  ; VC follows the link and visits the real file,

;;; Sane default keybindings
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


;;; Format buffer
(defun format-buffer ()
  (setq fill-column 120)
  (auto-fill-mode 1)
  (visual-line-mode 1)
  (display-fill-column-indicator-mode 1))

(add-hook 'org-mode-hook 'format-buffer)
(add-hook 'prog-mode-hook 'format-buffer)

;;; Set default external browser
(setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "brave")

;;; Adjust garbage collector threshold to 500mb
(setq gc-cons-threshold 500000000)

;;; Remove annoying sounds
(setq ring-bell-function 'ignore)

;;; GUI
;;;; Removing default GUI clutter
(tool-bar-mode 0)		; Remove tool bar - can be acessed with F10
(menu-bar-mode 0)		; Remove menu bar
(scroll-bar-mode 0)		; Remove scroll bar
(tooltip-mode 0)		; Remove help pop-up windows
(setq use-dialog-box nil)	; Prevent mouse commands from using dialog boxes

(global-hl-line-mode 1) ; Highlights current line

;;;; Line numbers
(add-hook 'prog-mode-hook (lambda ()
			    (display-line-numbers-mode t)
			    (setq display-line-numbers 'relative)))
(add-hook 'org-mode-hook (lambda ()
			   (display-line-numbers-mode 0)))

;;;; Org-mode centralized text
(use-package visual-fill-column
  :hook (org-mode . visual-fill-column-mode)
  :custom
  (visual-fill-column-width 120)
  (visual-fill-column-center-text t))

;;;; Smooth scrolling
(setq scroll-step 1			; how much it scrolls each time
      scroll-preserve-screen-position t	; prevent text from jumping beneath the cursor
      scroll-margin 8			; minimum number of lines up and above the cursor
      scroll-conservatively 10000)	; scroll only when extremely necessary

;;;; Starts dired in dired-omit-mode by default -> C-x M-o to toggle
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode)))
(add-hook 'org-mode-hook (lambda () (variable-pitch-mode)))

;;;; Faces
(setq font-lock-maximum-decoration t)
(custom-set-faces
 '(default ((t (:family "Roboto Mono" :height 110 :weight regular))))
 '(variable-pitch ((t (:family "Roboto" :height 120 :weight regular))))
 '(fixed-pitch ((t (:family "Roboto Mono" :height 110 :weight regular)))))

;;;; Mini-buffer completion
(setq completions-detailed t)			; additional information for options in *Completion* buffer
(setq completion-cycle-threshold 10)		; TAB will cycle between options instead of completions up to 10 options
(setq read-buffer-completion-ignore-case t)	; disabling case sensitive matching
(setq read-file-name-completion-ignore-case t)
(fido-vertical-mode 1)

;;;; Keybinding completions
(use-package which-key
  :init (which-key-mode))

;;;; Colored color codes
(use-package rainbow-mode
  :defer 1
  :hook (prog-mode . rainbow-mode))

;;;; Themes
(use-package ef-themes)
(setq ef-themes-mixed-fonts t)
(setq ef-themes-headings
      '((0 variable-pitch bold 1.728)
        (1 variable-pitch bold 1.44)
        (2 variable-pitch bold 1.2)
        (3 variable-pitch bold 1.18)
        (4 variable-pitch bold 1.15)
        (5 variable-pitch bold 1.12)
        (6 variable-pitch bold 1.1)
        (7 variable-pitch bold 1)
        (t variable-pitch bold 1)))

;;;; Modeline
(column-number-mode 1)

(use-package diminish)
(diminish 'visual-line-mode)
(diminish 'eldoc-mode)
(diminish 'rainbow-mode)
(diminish 'which-key-mode)

;;; Windows & Tabs
;;;; Functions
(defun change-window-focus ()
  (interactive)
  (other-window 1)
  (maximize-window))

;;;; Keybindings
;;;;; Improvements in default keybindings 
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C-0") 'text-scale-adjust)

;;;;; GUI Management Prefix: C-c g
(global-set-key (kbd "C-c g e") 'ef-themes-select)
(global-set-key (kbd "C-c g t") 'tool-bar-mode)
(global-set-key (kbd "C-c g m") 'menu-bar-mode)
(global-set-key (kbd "C-c g s") 'scroll-bar-mode)
(global-set-key (kbd "C-c g d") 'window-divider-mode)

;;;;; Window Management Prefix: C-c m
(global-set-key (kbd "C-c w s") 'window-swap-states)
(global-set-key (kbd "C-c w -") 'minimize-window)
(global-set-key (kbd "C-c w =") 'maximize-window)
(global-set-key (kbd "C-c w b") 'balance-windows)
(global-set-key (kbd "C-c w o") 'change-window-focus)
(global-set-key (kbd "C-c w k") 'delete-window)
(global-set-key (kbd "C-c w v") 'split-window-vertically)
(global-set-key (kbd "C-c w h") 'split-window-horizontally)

;;;;; Windmove Prefix: C-M
(global-set-key (kbd "C-M-n") 'windmove-down)
(global-set-key (kbd "C-M-p") 'windmove-up)
(global-set-key (kbd "C-M-b") 'windmove-left)
(global-set-key (kbd "C-M-f") 'windmove-right)

;;;;; Tab Management Prefix: C-c t
(global-set-key (kbd "C-c t n") 'tab-new)
(global-set-key (kbd "C-c t k") 'tab-close)
(global-set-key (kbd "C-c t l") 'tab-list)
(global-set-key (kbd "C-c t u") 'tab-undo)
(global-set-key (kbd "C-c t r") 'tab-rename)
(global-set-key (kbd "C-c t m") 'tab-bar-move-tab)
(global-set-key (kbd "M-p") 'tab-previous)
(global-set-key (kbd "M-n") 'tab-next)

;;; Terminal/Shell
;;;; Functions
(defun start-shell-vertically ()
  (interactive)
  (split-window-vertically)
  (other-window 1)
  (shell))

(defun start-shell-horizontally ()
  (interactive)
  (split-window-horizontally)
  (other-window 1)
  (shell))

(defun start-term-vertically ()
  (interactive)
  (split-window-vertically)
  (other-window 1)
  (term "/bin/bash"))

(defun start-term-horizontally ()
  (interactive)
  (split-window-horizontally)
  (other-window 1)
  (term "/bin/bash"))
;;;; Keybindings
;;;;; Shell Prefix: C-c s
(global-set-key (kbd "C-c s v") 'start-shell-vertically)
(global-set-key (kbd "C-c s h") 'start-shell-horizontally)
;;;; Term Prefix: C-c t
(global-set-key (kbd "C-c t v") 'start-term-vertically)
(global-set-key (kbd "C-c t h") 'start-term-horizontally)

;;; Org Mode
;;;; Settings
(use-package org
  :defer 1
  :config (setq org-startup-indented t
		org-hide-leading-stars t
		org-clock-sound "~/Music/emacs-pomodoro-ding.wav"))

(setq org-cycle-level-faces nil)

;;;; Functions
(defun find-org-home ()
  (interactive)
  (find-file "~/Documents/notes/home.org"))

(defcustom org-notes-directory "~/Documents/notes/"
  "Directory for org notes."
  :type 'directory
  :group 'org
  :set (lambda (sym val)
         (set-default sym (file-name-as-directory val))))

(defun get-org-file-tags (file)
  "Extract Org file tags from #+FILETAGS in FILE."
  (with-temp-buffer
    (insert-file-contents file nil 0 1000) ; Check first 1000 characters
    (let ((case-fold-search t)
          tags)
      (goto-char (point-min))
      (when (re-search-forward "^#\\+FILETAGS:\\s-*\\(:.*:\\)" nil t)
        (setq tags (split-string (match-string 1) ":" t "\\s-*"))
        (mapconcat 'identity tags ", ")))))

(defun find-org-notes-file ()
  "Select roam file with tag display and completion."
  (interactive)
  (let* ((dir (expand-file-name org-notes-directory))
         (files (seq-remove (lambda (f) (file-directory-p (expand-file-name f dir)))
                           (directory-files dir nil "^[^.]")))
         (candidates 
          (mapcar (lambda (f)
                    (let ((fullpath (expand-file-name f dir)))
                      (cons f (when (string-match "\\.org\\'" f)
                                (get-org-file-tags fullpath)))))
                  files)))
    (find-file
     (expand-file-name
      (completing-read
       "Select note: "
       (lambda (string pred action)
         (if (eq action 'metadata)
             `(metadata 
               (annotation-function
                . ,(lambda (candidate)
                     (when-let (tags (cdr (assoc candidate candidates)))
                       (concat "  " (propertize tags 'face 'font-lock-comment-face))))))
           (complete-with-action action candidates string pred)))
       nil t)
      dir))))

;;;; Keybindings
;;;;; Org Mode Prefix: C-c & C-c o 
(global-set-key (kbd "C-c o h") 'find-org-home)
(global-set-key (kbd "C-c o f") 'find-org-notes-file)
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;;;;; Packages
(use-package org-superstar
  :hook (org-mode . org-superstar-mode))

;;; LSPs & Code Completion
;;;; LSP Prefix: C-c l
(use-package lsp-mode
  :config
  (setq read-process-output-max (* 1024 1024))
  (setq lsp-modeline-diagnostics-enable t)
  (lsp-headerline-breadcrumb-mode 0)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((lsp-mode . lsp-enable-which-key-integration)
	 ((c++-mode c-mode) . lsp-deferred))
  :commands
  (lsp lsp-deferred))

;;;; Company Prefix: C-c c
(use-package company
  :defer 2
  :diminish
  :custom
  (company-begin-commands '(self-insert-command))
  (company-idle-delay 0)
  (company-minimum-prefix-length 2)
  (company-show-numbers t)
  (company-tooltip-align-annotations t)
  (global-company-mode t))

;;;; Web Prefix: C-c C-w (also used for window management)
(global-set-key (kbd "C-c C-w b") 'browse-url-of-file)

;;;; Zig
(use-package zig-mode)
(use-package zig-ts-mode)

;;; init.el ends here
