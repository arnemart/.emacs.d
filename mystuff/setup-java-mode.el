(use-package flycheck
  :ensure t
  :config
  (add-hook 'java-mode-hook 'flycheck-mode))

(use-package company
  :ensure t
  :config
  (add-hook 'java-mode-hook 'company-mode))

(use-package lsp-ui
  :ensure t
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends))

(use-package lsp-mode
  :ensure t
  :config
  (add-hook 'lsp-after-open-hook 'lsp-enable-imenu))

(use-package lsp-intellij
  :ensure t
  :config
  (add-hook 'java-mode-hook 'lsp-intellij-enable))


(provide 'setup-java-mode)
