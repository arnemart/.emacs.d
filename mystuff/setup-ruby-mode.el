(use-package enh-ruby-mode
  :ensure t
  :mode "\\.rb$"
  :mode "\\.rake$"
  :mode "Rakefile$"
  :mode "\\.gemspec$"
  :mode "\\.ru$"
  :mode "Gemfile$"
  :mode "Guardfile$"
  :mode "\\.jbuilder$"
  :init
  (setq ruby-use-smie nil)
  (setq-default ruby-compilation-executable "/Users/arnemart/.rbenv/shims/ruby")
  :bind (:map enh-ruby-mode-map
              ("C-j" . nil)
              ("M-r" . ruby-eval-region-or-buffer))
  :config
  (use-package hrb-mode
    :init
    (setq hrb-highlight-mode 'mixed)
    :config
    (hrb-mode t))
  (use-package rinari
    :ensure t
    :config
    (global-rinari-mode)))


(provide 'setup-ruby-mode)
