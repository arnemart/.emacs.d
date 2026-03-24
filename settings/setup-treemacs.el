(use-package treemacs
  :straight t
  :defer t
  :bind
  (:map treemacs-mode-map
        ([mouse-1] . #'treemacs-single-click-expand-action))
  :config
  (treemacs-follow-mode t)
  (treemacs-fringe-indicator-mode 'always)
  (treemacs-filewatch-mode t)
  (treemacs-resize-icons 44)
  (setq treemacs-indentation 1)
  (setq treemacs-width 40))

(use-package treemacs-projectile
  :after (treemacs projectile)
  :straight t
  :config
  (treemacs-project-follow-mode t))

(use-package treemacs-nerd-icons
  :after (treemacs nerd-icons)
  :straight t
  :config
  (treemacs-nerd-icons-config))

(use-package treemacs-magit
  :after (treemacs magit)
  :straight t)

(provide 'setup-treemacs)
