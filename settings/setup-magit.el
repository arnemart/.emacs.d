(use-package magit
  :straight t
  :custom
  (magit-diff-visit-prefer-worktree t))

(defun magit-status-fullscreen (prefix)
  (interactive "P")
  (magit-status)
  (unless prefix
    (delete-other-windows)))

(global-set-key (kbd "C-x m") 'magit-status-fullscreen)
(keymap-unset magit-mode-map "C-<tab>")

(provide 'setup-magit)
