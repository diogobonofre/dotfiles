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

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(load-theme 'ef-kassio t)
(setq electric-pair-delete-adjacent-pairs t)
(electric-pair-mode t)
(global-hl-line-mode 1)
(tooltip-mode 0)
(delete-selection-mode t)
(setq use-dialog-box nil)
(setq dired-kill-when-opening-new-dired-buffer t)
(setq vc-follow-symlinks t)
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-=") 'text-scale-increase)

(custom-set-faces
 '(default ((t (:family "Roboto Mono" :height 110 :weight regular))))
 '(variable-pitch ((t (:family "Roboto" :height 120 :weight regular))))
 '(fixed-pitch ((t (:family "Roboto Mono" :height 110 :weight regular)))))

(set-face-attribute 'font-lock-comment-face nil :slant 'italic)

(add-hook 'prog-mode-hook (lambda () (display-line-numbers-mode t) (setq display-line-numbers 'relative)))
(add-hook 'org-mode-hook (lambda () (display-line-numbers-mode 0)))

(fido-vertical-mode 1)

(setq font-lock-maximum-decoration t)

(use-package rainbow-mode
  :defer 1
  :hook (prog-mode . rainbow-mode))

(defun document-format ()
  (setq fill-column 120)
  (auto-fill-mode 1)
  (visual-line-mode 1)
  (display-fill-column-indicator-mode 1))

(add-hook 'org-mode-hook 'document-format) (add-hook 'prog-mode-hook 'document-format)

(use-package org
  :defer 1
  :config (setq org-startup-indented t
		org-hide-leading-stars t
		org-clock-sound "~/Music/emacs-pomodoro-ding.wav"))

(use-package which-key
  :init (which-key-mode))

;; Mini-buffer completion
(setq completions-detailed t)			; additional information for options in *Completion* buffer
(setq completion-cycle-threshold 10)		; TAB will cycle between options instead of completions up to 10 options
(setq read-buffer-completion-ignore-case t)	; disabling case sensitive matching
(setq read-file-name-completion-ignore-case t)  

;; Default external browser
(setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "brave")

;; Starts dired in dired-omit-mode by default -> C-x M-o to toggle
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode)))

(add-hook 'org-mode-hook (lambda () (variable-pitch-mode)))

(setq scroll-step 1			; how much it scrolls each time
      scroll-preserve-screen-position t	; prevent text from jumping beneath the cursor
      scroll-margin 8			; minimum number of lines up and above the cursor
      scroll-conservatively 10000)	; scroll only when extremely necessary

(setq gc-cons-threshold 500000000)

(use-package ef-themes)
(setq ef-themes-mixed-fonts t)
(setq ef-themes-headings
      '((0 variable-pitch light 1.9)
        (1 variable-pitch light 1.8)
        (2 variable-pitch regular 1.7)
        (3 variable-pitch regular 1.6)
        (4 variable-pitch regular 1.5)
        (5 variable-pitch 1.4)
        (6 variable-pitch 1.3)
        (7 variable-pitch 1.2)
        (t variable-pitch 1.1)))

(use-package visual-fill-column
  :hook (org-mode . visual-fill-column-mode)
  :custom
  (visual-fill-column-width 120)
  (visual-fill-column-center-text t))

(setq ring-bell-function 'ignore)

(use-package diminish)
(diminish 'visual-line-mode)
(diminish 'eldoc-mode)
(diminish 'rainbow-mode)
(diminish 'which-key-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;				Org Mode	      			    ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Org Mode Prefix: C-c o

(defun find-org-home ()
  (interactive)
  (find-file "~/Documents/notes/home.org"))
(global-set-key (kbd "C-c o h") 'find-org-home)

(defcustom org-roam-directory "~/Documents/notes/roam/"
  "Directory for roam notes."
  :type 'directory
  :group 'roam-variables
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

(defun find-org-roam-file ()
  "Select roam file with tag display and completion."
  (interactive)
  (let* ((dir (expand-file-name org-roam-directory))
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

(global-set-key (kbd "C-c o r") 'find-org-roam-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;                         LSPs & Code Completion                         ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
  (company-minimum-prefix-length 0)
  (company-show-numbers t)
  (company-tooltip-align-annotations t)
  (global-company-mode t))
