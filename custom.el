(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-indent-blank-lines-on-move nil)
 '(auto-indent-next-pair-timer-geo-mean
   (quote
    ((web-mode 6.0436757279586006e-05 6)
     (lisp-interaction-mode 5e-05 16)
     (emacs-lisp-mode 5e-05 27)
     (default 0.0005 0))))
 '(blink-cursor-blinks 0)
 '(css-indent-offset 2)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(cycbuf-attributes-list
   (quote
    (("M" 1 left cycbuf-get-modified-string)
     ("R" 2 left cycbuf-get-readonly-string)
     ("Buffer" cycbuf-get-name-length left cycbuf-get-name)
     ("" 2 left "  ")
     ("Directory" cycbuf-get-file-length right cycbuf-get-file-name)
     ("" 1 left " ")
     ("Mode" 12 left cycbuf-get-mode-name)
     ("" 2 left "  "))))
 '(cycbuf-buffer-sort-function (quote cycbuf-sort-by-recency))
 '(cycbuf-clear-delay 10000)
 '(cycbuf-dont-show-regexp (quote ("^ " "^\\*cycbuf\\*$" "SPEEDBAR")))
 '(exec-path-from-shell-arguments (quote ("-l")))
 '(js-indent-level 2)
 '(mac-pass-control-to-system nil)
 '(neo-show-updir-line nil)
 '(neo-smart-open t)
 '(neo-theme (quote icons))
 '(neo-toggle-window-keep-p t)
 '(neo-window-fixed-size nil)
 '(neo-window-position (quote right))
 '(neo-window-width 35)
 '(org-support-shift-select t)
 '(package-selected-packages
   (quote
    (markdown-mode fish-mode apache-mode nginx-mode highlight-indentation all-the-icons neotree rainbow-delimiters rainbow-delimiters-mode rainbow-mode reveal-in-osx-finder smartparens rinari hrb-mode enh-ruby-mode magit paredit web-mode tagedit use-package-chords key-chord nodejs-repl skewer-mode json-mode js2-refactor rjsx-mode ag textmate textmate-mode move-text undo-tree fringe-current-line whitespace-cleanup-mode cycbuf expand-region multiple-cursors projectile-speedbar sr-speedbar projectile powerline nyan-mode color-theme-sanityinc-tomorrow-night unicode-fonts auto-indent-mode auto-compile ido-completing-read+ smex dash s use-package ido-vertical-mode flx-ido)))
 '(powerline-default-separator (quote wave))
 '(projectile-mode-line
   (quote
    (:eval
     (if
         (file-remote-p default-directory)
         " Projectile"
       (format " P[%s]"
               (projectile-project-name))))))
 '(sp-autoskip-closing-pair (quote always-end))
 '(sp-navigate-consider-sgml-tags (quote (web-mode html-mode)))
 '(speedbar-show-unknown-files t)
 '(sr-speedbar-skip-other-window-p t)
 '(truncate-lines t)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-enable-auto-closing t)
 '(web-mode-enable-auto-pairing nil)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-script-padding 2)
 '(web-mode-sql-indent-offset 2)
 '(web-mode-style-padding 2)
 '(whitespace-style
   (quote
    (face tabs trailing space-before-tab indentation space-after-tab tab-mark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cycbuf-current-face ((t (:background "#666666" :weight bold))))
 '(cycbuf-header-face ((t (:foreground "light blue" :weight bold))))
 '(linum ((t (:inherit (shadow default) :foreground "#666666"))))
 '(show-paren-match ((t (:background "#888" :foreground "#222"))))
 '(speedbar-button-face ((t (:inherit speedbar-directory-face))))
 '(speedbar-file-face ((t (:foreground "White"))))
 '(speedbar-highlight-face ((t (:background "#333333"))))
 '(speedbar-selected-face ((t (:foreground "#aaaaaa" :underline t))))
 '(speedbar-separator-face ((t (:background "#33aadd" :foreground "white" :overline "gray"))))
 '(web-mode-doctype-face ((t (:inherit font-lock-keyword-face))))
 '(web-mode-html-attr-name-face ((t (:inherit font-lock-variable-name-face))))
 '(web-mode-html-tag-face ((t (:inherit font-lock-function-name-face))))
 '(whitespace-empty ((t (:background "#f0c674" :foreground "#cc6666"))))
 '(whitespace-hspace ((t (:background "#1d1f21" :foreground "#1d1f21"))))
 '(whitespace-indentation ((t (:background "#1d1f21" :foreground "#1d1f21"))))
 '(whitespace-line ((t (:foreground "#cc6666"))))
 '(whitespace-newline ((t (:foreground "#1d1f21" :weight normal))))
 '(whitespace-space ((t (:background "#1d1f21" :foreground "#1d1f21"))))
 '(whitespace-space-after-tab ((t (:background "#1d1f21" :foreground "#1d1f21"))))
 '(whitespace-space-before-tab ((t (:background "#cc6666" :foreground "#cc6666"))))
 '(whitespace-tab ((t (:background "#1d1f21" :foreground "#1d1f21"))))
 '(whitespace-trailing ((t (:background "#cc6666" :foreground "#1d1f21" :weight bold)))))
