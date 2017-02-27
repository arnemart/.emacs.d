;; (use-package scss-mode
;;   :ensure t)

(use-package rainbow-mode
  :ensure t
  :config
  (add-hook 'css-mode-hook 'rainbow-mode)
  (add-hook 'scss-mode-hook 'rainbow-mode))

(provide 'setup-css-mode)
