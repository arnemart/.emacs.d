;; Theme
(use-package alabaster-themes
  :straight t
  :config
  (load-theme 'alabaster-themes-light-bg))

(use-package solaire-mode
  :straight t
  :config
  (solaire-global-mode t))

(use-package ns-auto-titlebar
  :straight t
  :config
  (when (eq system-type 'darwin) (ns-auto-titlebar-mode)))

;; Visible bell in echo area
(use-package echo-bell
  :straight t
  :config
  (setq visible-bell t)
  (echo-bell-mode t))

;; Font
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
  :bind (:map vertico-map
              ("M-<" . nil)
              ("M->" . nil))
  :init
  (vertico-mode))

(use-package savehist
  :straight t
  :init
  (savehist-mode))

(use-package orderless
  :straight t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil)
  (orderless-matching-styles '(orderless-literal orderless-initialism orderless-flex)))

(use-package corfu
  :straight t
  :custom
  (corfu-cycle t)
  (corfu-auto t) 
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0)
  (corfu-popupinfo-delay '(0.5 . 0.2))
  (corfu-preview-current 'insert)
  (corfu-preselect 'first)
  (corfu-on-exact-match nil)
  :init
  (global-corfu-mode)
  (corfu-history-mode)
  (corfu-popupinfo-mode))

;; Nice search and stuff
(use-package consult
  :straight t)

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

;; Minibuffer marginalia
(use-package marginalia
  :straight t
  :init (marginalia-mode))

;; Backward forward
(use-package backward-forward
  :straight t
  :bind (("M-s-," . backward-forward-previous-location)
         ("M-s-." . backward-forward-next-location))
  :init (backward-forward-mode t))

;; Tabs!
(use-package centaur-tabs
  :straight t
  :demand t
  :hook
  (treemacs-mode . centaur-tabs-local-mode)
  :custom
  (centaur-tabs-cycle-scope 'tabs)
  (centaur-tabs-set-icons t)
  (centaur-tabs-icon-type 'nerd-icons)
  (centaur-tabs-style "bar")
  :config
  (centaur-tabs-mode t)
  (centaur-tabs-group-by-projectile-project)
  (define-key centaur-tabs-mode-map (vector centaur-tabs-display-line 'wheel-up)   nil)
  (define-key centaur-tabs-mode-map (vector centaur-tabs-display-line 'wheel-down) nil)
  :bind
  ("M-s-<left>" . centaur-tabs-backward)
  ("M-s-<right>" . centaur-tabs-forward))

(provide 'ui)
