(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))
(add-to-list 'load-path settings-dir)

(setq inhibit-startup-screen t)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(load (expand-file-name "defuns.el" user-emacs-directory))

(require 'straight-bootstrap)
(require 'ui)
(require 'sane-defaults)
(require 'setup-modeline)
(require 'setup-multiple-cursors)
(require 'keys)

(require 'setup-magit)
(require 'setup-projectile)
(require 'setup-treemacs)

(require 'setup-treesit)
(require 'setup-prettier)
