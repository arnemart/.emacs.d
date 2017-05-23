(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :bind (:map markdown-mode-map
              ("M-<up>"     . nil)
              ("M-<down>"   . nil)
              ("M-<left>"   . nil)
              ("M-S-<left>"   . nil)
              ("M-<right>"  . nil)
              ("M-S-<right>"  . nil)
              ("M-<return>" . nil)
              ("M-n"        . nil)
              ("C-<up>"     . markdown-move-up)
              ("C-<down>"   . markdown-move-down)
              ("C-<left>"   . markdown-promote)
              ("C-<right>"  . markdown-demote)
              ("C-<return>" . markdown-insert-list-item)))

(provide 'setup-markdown-mode)
