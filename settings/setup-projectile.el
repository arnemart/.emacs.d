(use-package projectile
  :straight t
  :bind
  (:map global-map
        ("s-p" . projectile-command-map))
  :config
  (projectile-mode t))

(provide 'setup-projectile)
