;; change command to meta
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'hyper)
(setq mac-right-option-modifier nil)

;; Norwegian mac-keyboard alt-keys)
(define-key key-translation-map (kbd "s-8") (kbd "["))
(define-key key-translation-map (kbd "s-(") (kbd "{"))
(define-key key-translation-map (kbd "s-9") (kbd "]"))
(define-key key-translation-map (kbd "s-)") (kbd "}"))
(define-key key-translation-map (kbd "s-7") (kbd "|"))
(define-key key-translation-map (kbd "s-/") (kbd "\\"))

(global-set-key (kbd "s-l") (λ (insert "λ")))

;; Disable print key
(global-unset-key (kbd "s-p"))

(global-set-key (kbd "<escape>") 'keyboard-quit)
(define-key minibuffer-mode-map (kbd "<escape>") 'minibuffer-keyboard-quit)

(global-set-key (kbd "M-w") 'kill-current-buffer)

;; Cut copy paste
(global-set-key (kbd "M-s-x") 'simpleclip-cut)
(global-set-key (kbd "M-c") 'simpleclip-copy)
(global-set-key (kbd "M-X") 'simpleclip-cut)
(global-set-key (kbd "M-v") 'simpleclip-paste)

;; Undo redo
(global-set-key (kbd "M-z") 'undo-tree-undo)
(global-set-key (kbd "M-Z") 'undo-tree-redo)
(global-set-key (kbd "C-M-z") 'undo-tree-visualize)

;; Open save etc
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-o") 'find-file)
(global-set-key (kbd "M-O") 'recentf)
(global-set-key (kbd "M-t") 'projectile-find-file-dwim)

;; Text navigation
(global-set-key (kbd "s-<right>") 'right-word)
(global-set-key (kbd "s-<left>") 'left-word)
(global-set-key (kbd "s-<backspace>") 'backward-kill-word)
(global-set-key (kbd "M-<left>") (λ (call-interactively (if (= (current-indentation) (current-column)) 'beginning-of-line 'back-to-indentation))))
(global-set-key (kbd "M-<right>") 'move-end-of-line)
(global-set-key (kbd "M-<backspace>") (λ (kill-line 0)))
(global-set-key (kbd "s-<up>") 'backward-paragraph)
(global-set-key (kbd "s-<down>") 'forward-paragraph)
(global-set-key (kbd "M-<up>") 'beginning-of-buffer)

(global-set-key (kbd "M-<down>") 'end-of-buffer)
(global-set-key (kbd "M-<return>") (λ (move-end-of-line 1) (newline)))

(global-set-key (kbd "M-s-<up>") 'move-text-up)
(global-set-key (kbd "M-s-<down>") 'move-text-down)

;; Code stuff
(global-set-key (kbd "M-/") 'comment-line)
(global-set-key (kbd "C-.") 'completion-at-point)
(global-set-key (kbd "C-c r t") 'combobulate-cursor-edit-sequence-dwim)
;; (global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<down-mouse-1>") 'xref-find-definitions-at-mouse)

;; Find etc
(global-set-key (kbd "M-f") (λ (consult-line "=")))
(global-set-key (kbd "M-e") (λ (consult-line (concat "=" (buffer-substring-no-properties (mark) (point))))))
(global-set-key (kbd "M-l") 'consult-goto-line)
(global-set-key (kbd "M-F") 'consult-ripgrep)

;; Cycle buffers
(global-set-key (kbd "C-<tab>") 'consult-buffer)
(define-key vertico-map (kbd "C-<tab>") 'vertico-next)
(define-key vertico-map (kbd "C-S-<tab>") 'vertico-previous)
(global-set-key (kbd "M-<") 'next-window-any-frame)
(global-set-key (kbd "M->") 'previous-window-any-frame)

;; Treemacs
(global-set-key (kbd "C-M-s-t") 'treemacs)

(provide 'keys)
