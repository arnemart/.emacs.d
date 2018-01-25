;; Font
(set-default-font "Fira Mono 13")

;; Window size/position
(when window-system
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 1200 (x-display-pixel-height) t))

;; Color theme
(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (color-theme-sanityinc-tomorrow-night)
  ;; Dim region highlight color
  (set-face-attribute 'region nil :background "#373b41"))

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
  :init
  (global-fringe-current-line-mode 1)
  :config
  (global-git-gutter-mode))


;; Gut gitter
(use-package git-gutter-fringe
  :ensure t
  :config
  (setq git-gutter-fr:side 'right-fringe))

;; Unicode fonts
(use-package unicode-fonts
  :ensure t
  :config
  (unicode-fonts-setup))


;; Diminish
(eval-after-load "visual-line-mode" '(diminish 'global-visual-line-mode))
(eval-after-load "whitespace" '(diminish 'global-whitespace-mode))
(eval-after-load "auto-revert" '(diminish 'auto-revert-mode))
(eval-after-load "hrb-mode" '(diminish 'hrb-mode))
(eval-after-load "abbrev" '(diminish 'abbrev-mode))

(defmacro rename-modeline (package-name mode new-name)
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
        (setq mode-name ,new-name))))

(rename-modeline "js2-mode" js2-mode "JS2")

(provide 'appearance)
