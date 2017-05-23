(setq inhibit-startup-message t)
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setenv "LANG" "en_US.UTF-8")

(add-to-list 'load-path (expand-file-name "mystuff" user-emacs-directory))
(setq site-lisp-dir (expand-file-name "site" user-emacs-directory))
(add-to-list 'load-path site-lisp-dir)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(setq backup-directory-alist `(("." . "~/.emacs-saves")))
(setq backup-by-copying-when-linked t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)


(eval-when-compile
  (require 'use-package))
(use-package diminish :ensure t)
(use-package bind-key :ensure t)

(setq load-prefer-newer t)
(use-package auto-compile :ensure t)
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)


(use-package s :ensure t)
(use-package dash :ensure t)
(use-package dash-functional :ensure t)

(use-package exec-path-from-shell :ensure t)
(exec-path-from-shell-initialize)
(server-start)

(require 'appearance)

(require 'defuns)

(require 'textmate)

(require 'key-bindings)

(require 'behaviors)

(require 'copypaste)

(require 'setup-hippie-expand)

(require 'setup-magit)


(require 'setup-paredit)

(require 'modes)

(require 'setup-js2-mode)

(require 'setup-web-mode)

(require 'setup-ruby-mode)

(require 'setup-css-mode)
