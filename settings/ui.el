;; Theme

(use-package alabaster-themes
  :straight t
  :config (load-theme 'alabaster-themes-dark))

(use-package solaire-mode
  :straight t
  :config
  (solaire-global-mode t))

;; Font
(add-to-list 'default-frame-alist
             '(font . "Monaspace Argon Frozen 13"))
(use-package ligature
  :straight t
  :config
  (ligature-set-ligatures 'prog-mode '("===" "!==" "=!=" "=/=" "/==" "/=" "#=" "==" "!=" "~~" "=~" "!~" "~-"
                                       "-~" "&=" ">=" "<=" "<-->" "<->" "<!--" "<--" "-->" "<-" "->" "<~>"
                                       "<~~" "~~>" "<~" "~>" "</" "/>" "</>" "<>" "[|" "|]" "/\\" "\\/" "|>"
                                       "<|" "<|>" "{|" "|}" "###" "+++" "&&&" "-:-" "=:=" ":>:" ":<:" "::>"
                                       "<::" "::" ":::" "..=" "..-" "..<" ".=" ".-" "<=>" "<<=" "=>>" "=<<"
                                       ">>=" "=>" "<<" ">>" "#[" "#(" "#!["))
  (global-ligature-mode t))

;; Nice completion
(use-package vertico
  :straight t
  :custom
  (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode))

(use-package orderless
  :straight t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil))

(use-package corfu
  :straight t
  :custom
  (corfu-cycle t)
  (corfu-auto t) 
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0)
  (corfu-popupinfo-delay '(0.5 . 0.2))
  (corfu-preview-current 'insert)
  (corfu-preselect 'prompt)
  (corfu-on-exact-match nil)
  :bind (:map corfu-map
              ("M-SPC"      . corfu-insert-separator)
              ("TAB"        . corfu-next)
              ([tab]        . corfu-next)
              ("S-TAB"      . corfu-previous)
              ([backtab]    . corfu-previous)
              ("S-<return>" . corfu-insert)
              ("RET"        . corfu-insert))
  :init
  (global-corfu-mode)
  (corfu-history-mode)
  (corfu-popupinfo-mode))

;; Nice icons
(use-package nerd-icons
  :straight t
  :custom
  (nerd-icons-font-family "Symbols Nerd Font Mono"))

;; Nice colored parens
(use-package rainbow-delimiters
  :straight t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; Cycle buffers
(use-package cycbuf
  :straight t
  :bind (("C-<tab>"   . cycbuf-switch-to-next-buffer)
         ("C-S-<tab>" . cycbuf-switch-to-previous-buffer)
         ))

(provide 'ui)
