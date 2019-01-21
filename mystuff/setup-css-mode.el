;; (use-package scss-mode
;;   :ensure t)

(defun css-modes-hook-fn (the-map)
  (rainbow-mode 1)
  (key-chord-define the-map ";;" (λ (save-excursion (move-end-of-line nil) (insert ";")))))

(use-package rainbow-mode
  :ensure t
  :config
  (add-hook 'css-mode-hook '(lambda () (css-modes-hook-fn css-mode-map)))
  (add-hook 'scss-mode-hook '(lambda () (css-modes-hook-fn scss-mode-map))))

(provide 'setup-css-mode)
