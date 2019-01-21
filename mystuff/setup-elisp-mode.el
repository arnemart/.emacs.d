(add-hook 'emacs-lisp-mode-hook '(lambda ()
                                   (smartparens-mode -1)
                                   (paredit-mode t)))

(provide 'setup-elisp-mode)
