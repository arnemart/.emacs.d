(use-package doom-modeline
  :straight t
  :custom
  (doom-modeline-buffer-encoding 'nondefault)
  (doom-modeline-buffer-file-name-style 'file-name-with-project)
  (doom-modeline-percent-position nil)
  :init
  (doom-modeline-mode 1))

(use-package nyan-mode
  :straight t
  :init
  (setq nyan-bar-length 20)
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
