(use-package magit
  :straight t
  :custom
  (magit-diff-visit-prefer-worktree t)
  (magit-define-global-key-bindings nil)
  :config
  (unbind-key "M-t" magit-mode-map))

(set-default 'magit-log-margin '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 18))

(defun magit-status-fullscreen (prefix)
  (interactive "P")
  (magit-status)
  (unless prefix
    (delete-other-windows)))

(global-set-key (kbd "C-x m") 'magit-status-fullscreen)
(keymap-unset magit-mode-map "C-<tab>")

(use-package git-gutter
  :straight t
  :config
  (global-git-gutter-mode t))

(provide 'setup-magit)
