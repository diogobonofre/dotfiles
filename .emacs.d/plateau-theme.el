(require 'autothemer)

(autothemer-deftheme
 plateau ""

 ((((class color) (min-colors #xFFFFFF)))

  ;; Monochrome colors
  (plateau-bg             "#121212")
  (plateau-fg             "#FFFFFF")
  (plateau-black      		"#282828")
  (plateau-dark-grey    	"#333333")
  (plateau-medium-grey		"#888888")
  (plateau-light-grey   	"#BBBBBB")
  (plateau-charcoal-grey	"#555555")
  (plateau-beige	        "#9C9990")
  (plateau-white      		"#EBEEEE")

  ;; Highlight colors
  (plateau-yellow          "#FFCC22")
  (plateau-blue       		"#96A6C8")
  (plateau-green          "#95A99F")
  (plateau-red        		"#A22C29")
  )

 ;; Customize faces
 (
  ;; General
  (default                    (:background plateau-bg :foreground plateau-fg))
  (cursor                     (:background plateau-yellow :foreground plateau-bg))
  (highlight                  (:background plateau-yellow :foreground plateau-bg))
  (warning              			(:foreground plateau-yellow))
  (line-number                (:foreground plateau-black))
  (line-number-current-line   (:foreground plateau-yellow))
  (region               			(:background plateau-black))
  (error                			(:foreground plateau-red))
  (success                    (:foreground plateau-green))
  (link               				(:foreground plateau-white :underline t))
  (isearch              			(:background plateau-yellow :foreground plateau-bg))
  (isearch-group-1        		(:background plateau-white :foreground plateau-bg))
  (isearch-group-2        		(:background plateau-white :foreground plateau-bg))
  (lazy-highlight         		(:background plateau-white :foreground plateau-bg))
  
  ;; Mode Line
  (mode-line            			(:background plateau-bg :foreground plateau-fg))
  (mode-line-highlight      	(:background plateau-fg :foreground plateau-bg))

  ;; Minibuffer
  (minibuffer-prompt      		(:foreground plateau-yellow))
    
  ;; Dired
  (dired-header         			(:foreground plateau-yellow))
  (dired-directory        		(:foreground plateau-blue))
  
  ;; Languages
  (font-lock-keyword-face           (:foreground plateau-yellow))
  (font-lock-type-face              (:foreground plateau-yellow))
  (font-lock-function-name-face   	(:foreground plateau-medium-grey))
  (font-lock-variable-name-face 		(:foreground plateau-fg))
  (font-lock-string-face            (:foreground plateau-beige))
  (font-lock-builtin-face       		(:foreground plateau-yellow))
  (font-lock-constant-face          (:foreground plateau-green))
  (font-lock-preprocessor-face    	(:foreground plateau-green))
  (font-lock-comment-face          	(:foreground plateau-charcoal-grey))
  (font-lock-comment-delimiter-face	(:foreground plateau-charcoal-grey))
  (show-paren-match                 (:background plateau-light-grey :foreground plateau-bg))

  ;; Terminal
  (ansi-color-black           (:foreground plateau-black))
  (ansi-color-red             (:foreground plateau-dark-grey))
  (ansi-color-green     			(:foreground plateau-green))
  (ansi-color-yellow         	(:foreground plateau-yellow))
  (ansi-color-blue      			(:foreground plateau-blue))
  (ansi-color-magenta       	(:foreground plateau-medium-grey))
  (ansi-color-cyan            (:foreground plateau-light-grey))
  (ansi-color-white     			(:foreground plateau-white))

  ;; Nerd Icons
  ))

(provide-theme 'plateau)
