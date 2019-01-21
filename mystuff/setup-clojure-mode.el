(use-package clojure-mode
  :ensure t
  :config
  (use-package clj-refactor
    :ensure t)
  (use-package cider
    :ensure t
    :config
    (add-hook 'cider-repl-mode-hook '(lambda ()
                                       (smartparens-mode -1)
                                       (paredit-mode t))))
  (add-hook 'clojure-mode-hook '(lambda ()
                                  (smartparens-mode -1)
                                  (paredit-mode t)
                                  (clj-refactor-mode 1)
                                  (cljr-add-keybindings-with-prefix "M-m"))))

(provide 'setup-clojure-mode)
