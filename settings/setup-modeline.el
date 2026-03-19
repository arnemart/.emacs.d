(use-package doom-modeline
  :straight t
  :init
  (setq doom-modeline-percent-position nil)
  (doom-modeline-mode 1))

(use-package nyan-mode
  :straight t
  :init
  (setq nyan-bar-length 24)
  :config
  (nyan-mode))

(use-package diminish
  :straight t
  :config
  (progn
    (diminish 'global-undo-tree-mode)
    (diminish 'undo-tree-mode)
    (diminish 'eldoc-mode)))

(provide 'setup-modeline)
