;; Dash
(use-package dash
  :straight t)

;; Dont wanna use kill ring
(use-package simpleclip
  :straight t
  :config
  (simpleclip-mode 1))

;; undo-tree
(use-package undo-tree
  :straight t
  :config
  (global-undo-tree-mode))

;; scroll stuff

(use-package ultra-scroll
  :straight t
  :config
  (ultra-scroll-mode 1))

;; (pixel-scroll-mode t)

;; (use-package scroll-restore
;;   :straight t
;;   :custom
;;   (scroll-restore-cursor-type 'hollow)
;;   (scroll-restore-handle-cursor 'type)
;;   (scroll-restore-handle-region t)
;;   (scroll-restore-jump-back t)
;;   :config
;;   ;; (add-to-list 'scroll-restore-commands 'ultra-scroll--hide-cursor)
;;   ;; (add-to-list 'scroll-restore-commands 'ultra-scroll--hide-cursor-undo)
;;   ;; (add-to-list 'scroll-restore-commands 'ultra-scroll-up)
;;   ;; (add-to-list 'scroll-restore-commands 'ultra-scroll-down)
;;   ;; (add-to-list 'scroll-restore-commands 'ultra-scroll--prepare-to-scroll)
;;   ;; (add-to-list 'scroll-restore-commands 'ultra-scroll--end-scroll)
;;   ;; (add-to-list 'scroll-restore-commands 'ultra-scroll--scroll)
;;   ;; (add-to-list 'scroll-restore-commands 'ultra-scroll)
;;   ;; (add-to-list 'scroll-restore-commands 'ultra-scroll-mac)
;;   (add-to-list 'scroll-restore-commands 'pixel-scroll-up)
;;   (add-to-list 'scroll-restore-commands 'pixel-scroll-down)
;;   (scroll-restore-mode t))

;; Move text
(use-package move-text
  :straight t)

;; No dialog boxes please
(setq use-dialog-box nil)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Auto pairs
(electric-pair-mode)

;; delete selection when typing
(delete-selection-mode t)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Horizontal scroll
(setq mouse-wheel-tilt-scroll t)
(setq mouse-wheel-flip-direction t)

;; Lines should be 120 characters wide, not 72
(setq fill-column 120)

;; Save a list of recent files visited. (open recent file with C-x f)
(recentf-mode 1)
(setq recentf-max-saved-items 100) ;; just 20 is too recent

;; Save minibuffer history
(savehist-mode 1)
(setq history-length 1000)

;; Never insert tabs
(set-default 'indent-tabs-mode nil)

;; Show me empty lines after buffer end
(set-default 'indicate-empty-lines t)

;; Don't break lines for me, please
(setq-default truncate-lines t)

;; Allow recursive minibuffers
(setq enable-recursive-minibuffers t)

;; Don't be so stingy on the memory, we have lots now. It's the distant future.
(setq gc-cons-threshold 20000000)

;; Sentences do not need double spaces to end. Period.
(set-default 'sentence-end-double-space nil)

;; Add parts of each file's directory to the buffer name if not unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; A saner ediff
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Nic says eval-expression-print-level needs to be set to nil (turned off) so
;; that you can always see what's happening. Nic is wrong.
(setq eval-expression-print-level 100)

;; Offer to create parent directories if they do not exist
;; http://iqbalansari.github.io/blog/2014/12/07/automatically-create-parent-directories-on-visiting-a-new-file-in-emacs/
(defun my-create-non-existent-directory ()
  (let ((parent-directory (file-name-directory buffer-file-name)))
    (when (and (not (file-exists-p parent-directory))
               (y-or-n-p (format "Directory `%s' does not exist! Create it?" parent-directory)))
      (make-directory parent-directory t))))

(add-to-list 'find-file-not-found-functions 'my-create-non-existent-directory)

(provide 'sane-defaults)
