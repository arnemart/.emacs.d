(use-package projectile
  :straight t
  :demand t
  :bind
  (("s-p" . projectile-command-map))
  :config
  (projectile-mode t))

(provide 'setup-projectile)
