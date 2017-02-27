(use-package paredit
  :ensure t
  :bind (:map paredit-mode-map
              ("C-M-<left>" . nil)
              ("C-M-<right>" . nil)
              ("M-s" . save-buffer)
              ("M-S" . ido-write-file)
              ("M-<down>" . end-of-buffer)
              ("M-<up>" . beginning-of-buffer)
              ("C-M-s-<down>" . paredit-splice-sexp-killing-forward)
              ("C-M-s-<up>" . paredit-splice-sexp-killing-backward)
              ("M-(" . paredit-wrap-round)
              ("M-)" . paredit-wrap-round-from-behind)
              ("M-s-8" . paredit-wrap-square)
              ("M-s-9" . paredit-wrap-square-from-behind)
              ("M-s-(" . paredit-wrap-curly)
              ("M-s-)" . paredit-wrap-curly-from-behind)
              ("M-m D" . paredit-duplicate-closest-sexp)
              ("M-m S" . paredit-split-sexp)
              ("M-m J" . paredit-join-sexps)
              ("M-m P" . paredit-splice-sexp)
              ("M-m C" . paredit-convolute-sexp)
              ("M-m R" . paredit-raise-sexp)
              ("\\" . nil))
  :init

  (defun paredit--is-at-start-of-sexp ()
    (and (looking-at "(\\|\\[")
         (not (nth 3 (syntax-ppss)))
         (not (nth 4 (syntax-ppss)))))

  (defun paredit-duplicate-closest-sexp ()
    (interactive)
    (while (not (paredit--is-at-start-of-sexp))
      (paredit-backward))
    (set-mark-command nil)
    (while (and (bounds-of-thing-at-point 'sexp)
                (<= (point) (car (bounds-of-thing-at-point 'sexp)))
                (not (= (point) (line-end-position))))
      (forward-sexp)
      (while (looking-at " ")
        (forward-char)))
    (kill-ring-save (mark) (point))
    (paredit-newline)
    (yank)
    (exchange-point-and-mark))

  (defun paredit-wrap-round-from-behind ()
    (interactive)
    (forward-sexp -1)
    (paredit-wrap-round)
    (insert " ")
    (forward-char -1))

  (defun paredit-wrap-square-from-behind ()
    (interactive)
    (forward-sexp -1)
    (paredit-wrap-square))

  (defun paredit-wrap-curly-from-behind ()
    (interactive)
    (forward-sexp -1)
    (paredit-wrap-curly))

  (defun conditionally-enable-paredit-mode ()
    (if (eq this-command 'eval-expression)
        (paredit-mode 1)))

  (add-hook 'minibuffer-setup-hook 'conditionally-enable-paredit-mode)

  (add-hook 'lisp-mode-hook 'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode)

  ;; making paredit work with delete-selection-mode
  (put 'paredit-forward-delete 'delete-selection 'supersede)
  (put 'paredit-backward-delete 'delete-selection 'supersede)
  (put 'paredit-newline 'delete-selection t))

(provide 'setup-paredit)
