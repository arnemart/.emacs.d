(use-package projectile
  :straight t
  :bind
  (("s-p" . projectile-command-map))
  :config
  (projectile-mode t))

(provide 'setup-projectile)
