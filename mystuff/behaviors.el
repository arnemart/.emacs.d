
;; ido stuff
(use-package flx-ido :ensure t)
(use-package ido-vertical-mode :ensure t)
(use-package ido-completing-read+ :ensure t)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-vertical-define-keys 'C-n-C-p-up-and-down)

(ido-mode 1)
(ido-everywhere 1)
(ido-vertical-mode 1)
(flx-ido-mode 1)

;; Multiple cursors
(use-package multiple-cursors
  :ensure t
  :bind (("C-c C-r" . mc/mark-sgml-tag-pair)
         ("C-æ" . mc/mark-next-like-this)
         ("C-s-æ" . mc/unmark-next-like-this)
         ("C-s-M-æ" . mc/skip-to-next-like-this)
         ("C-Æ" . mc/mark-all-like-this)
         ("s-SPC" . mc/edit-lines)
         ("C-s-SPC" . toggle-rectangular-selection)
         ("M-<mouse-1>" . mc/add-cursor-on-click)))

;; Overwrite selection
(delete-selection-mode 1)

;; Projectile
(use-package projectile
  :ensure t
  :bind ("M-t" . projectile-find-file))

(projectile-mode)
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
  :bind (("C-M-s-s" . neotree-project-dir)))

;; ag
(use-package ag
  :ensure t
  :bind ("M-F" . my-ag))

;; Who wants to type "yes" or "no"
(defalias 'yes-or-no-p 'y-or-n-p)

;; No dialog boxes please
(setq use-dialog-box nil)

;; Keep everything in a single window
(setq ns-pop-up-frames nil)

;; ffap
(use-package ffap
  :bind (("C-c f f" . open-file-at-point)
         ("C-M-s-f" . open-file-at-point)))

;; Keep track of recent files
(setq recentf-max-saved-items 100)
(recentf-mode 1)

;; Uniquify buffer names
(use-package uniquify
  :init
  (setq uniquify-buffer-name-style 'forward))

;; Expand region
(use-package expand-region
  :ensure t
  :bind (("C-@" . er/expand-region)
         ("C-*" . er/contract-region)))

;; Save place
(use-package saveplace
  :init
  (setq-default save-place t))

;; Smex
(use-package smex
  :ensure t
  :bind  (("M-x" . smex)
          ("M-X" . smex-major-mode-commands)))

;; Smartparens
(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode))

;; Indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(electric-indent-mode t)

(use-package auto-indent-mode
  :ensure t
  :diminish auto-indent-mode
  :config
  (auto-indent-global-mode)
  ;; If, after inserting a character, we have a line that consists of a single character, indent.
  (add-hook 'post-self-insert-hook
            '(lambda ()
               (when (= (+ 1 (line-beginning-position)) (line-end-position))
                 (indent-according-to-mode)
                 (end-of-line)))))
;; Reindent braces in most programming modes
(defadvice newline-and-indent (around maybe-reindent-braces activate)
  (progn (when (and (sp-point-in-empty-sexp)
                    (not (-contains? sp-lisp-modes major-mode)))
           (save-excursion
             (newline)
             (indent-according-to-mode)))
         ad-do-it))

;; Cycle buffers
(use-package cycbuf
  :ensure t
  :bind (("M-s-<left>" . cycbuf-switch-to-previous-buffer)
         ("M-s-<right>" . cycbuf-switch-to-next-buffer)))

;; Clean whitespace
(use-package whitespace-cleanup-mode
  :ensure t
  :bind ("C-M-s-w" . whitespace-cleanup)
  :diminish whitespace-cleanup-mode
  :init
  (global-whitespace-cleanup-mode))

;; Undo tree
(use-package undo-tree
  :ensure t
  :bind (("M-z" . undo-tree-undo)
         ("M-Z" . undo-tree-redo)
         ("C-M-z" . undo-tree-visualize)))

;; Move text
(use-package move-text :ensure t)
(global-set-key (kbd "M-s-<up>") (λ (move-text-up 1)))
(global-set-key (kbd "M-s-<down>") 'move-text-down)

;; Key chords
(use-package key-chord :ensure t)

;; yasnippet
(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :init
  (require 'snippet-helpers)
  :config
  (setq yas/root-directory "~/.emacs.d/snippets")
  (setq yas-verbosity 1)
  (yas/load-directory yas/root-directory)
  (yas-global-mode 1))


;; Reveal in finder
(use-package reveal-in-osx-finder :ensure t)

(provide 'behaviors)
