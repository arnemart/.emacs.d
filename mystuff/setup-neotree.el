(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (if (projectile-project-p)
      (let ((project-dir (projectile-project-root))
            (file-name (buffer-file-name)))
        (neotree-toggle)
        (if project-dir
            (if (neo-global--window-exists-p)
                (progn
                  (neotree-dir project-dir)
                  (neotree-find file-name)))
          (message "Could not find git project root.")))
    (neotree-toggle)))


(use-package neotree
  :ensure t
  :config
  (add-hook 'projectile-after-switch-project-hook 'neotree-projectile-action)
  :bind (("C-M-s-s" . neotree-project-dir)
         :map neotree-mode-map
         ("M-<backspace>" . neotree-delete-node)
         ("M-<down>" . neotree-open-file-in-system-application)))


(provide 'setup-neotree)
