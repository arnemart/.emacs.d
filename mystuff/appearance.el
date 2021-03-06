;; Window size/position
(when window-system
  (run-at-time "3 sec" nil (lambda ()
                             (set-frame-position (selected-frame) 0 0)
                             (set-frame-size (selected-frame) 1100 (- (x-display-pixel-height) 48) t))))

(setq default-frame-alist '((ns-transparent-titlebar . t) (ns-appearance . 'nil)))

;; Font
(run-at-time "1 sec" nil 'set-frame-font "Fira Code 13" t)

;; Color theme
(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (color-theme-sanityinc-tomorrow-night)
  ;; Dim region highlight color
  (set-face-attribute 'region nil :background "#32363b")
  (set-face-attribute 'default nil :background "#1e1e1e"))

;; Fix color space
(setq ns-use-srgb-colorspace nil)

;; NYAN NAYN
(use-package nyan-mode
  :ensure t
  :init
  (setq nyan-bar-length 20)
  :config
  (nyan-mode))

;; Powerline
(use-package powerline
  :ensure t
  :config
  (require 'my-powerline-theme)
  (my-powerline-theme))

;; Highlight indentation
(use-package highlight-indentation
  :ensure t
  :diminish highlight-indentation-current-column-mode
  :diminish highlight-indentation-mode
  :config
  (add-hook 'prog-mode-hook
            (lambda ()
              (highlight-indentation-current-column-mode t)))
  (add-hook 'scss-mode-hook
            (lambda ()
              (highlight-indentation-current-column-mode t))))

(use-package all-the-icons
  :ensure t)

;; Highlight matching parens
(show-paren-mode 1)

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))


;; Show whitespace
(global-whitespace-mode)


;; Fringe
(use-package fringe-current-line
  :ensure t
  :config
  (global-fringe-current-line-mode 1))


;; Gut gitter
(use-package git-gutter-fringe
  :ensure t
  :init
  (setq git-gutter-fr:side 'right-fringe)
  :config
  (global-git-gutter-mode))

;; Unicode fonts
(use-package unicode-fonts
  :ensure t
  :config
  (unicode-fonts-setup))


;; Diminish
(eval-after-load "visual-line-mode" '(diminish 'global-visual-line-mode))
(eval-after-load "whitespace" '(diminish 'global-whitespace-mode))
(eval-after-load "autorevert" '(diminish 'auto-revert-mode))
(eval-after-load "hrb-mode" '(diminish 'hrb-mode))
(eval-after-load "abbrev" '(diminish 'abbrev-mode))
(eval-after-load "git-gutter-fringe" '(diminish 'git-gutter-mode))
(eval-after-load "undo-tree" '(diminish 'undo-tree-mode))

(defmacro rename-modeline (package-name mode new-name)
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
        (setq mode-name ,new-name))))

(rename-modeline "js2-mode" js2-mode "JS2")

(provide 'appearance)
