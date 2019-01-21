;; Mac modifier keys
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'hyper)

;; Change mouse behavior
(define-key global-map (kbd "<S-down-mouse-1>") 'ignore)
(define-key global-map (kbd "<S-mouse-1>") 'mouse-save-then-kill)
;; (define-key global-map (kbd "<down-mouse-3>") 'mac-mouse-buffer-menu)

(global-set-key (kbd "<wheel-left>") (λ (scroll-right 1)))
(global-set-key (kbd "<wheel-right>") (λ (when (> (window-hscroll) 0) (scroll-left 1))))
(global-set-key (kbd "<double-wheel-left>") (λ (scroll-right 2)))
(global-set-key (kbd "<double-wheel-right>") (λ (scroll-left 2)))
(global-set-key (kbd "<triple-wheel-left>") (λ (scroll-right 5)))
(global-set-key (kbd "<triple-wheel-right>") (λ (scroll-left 5)))

(global-unset-key (kbd "M-<down-mouse-1>"))


;; Symbols
(define-key key-translation-map (kbd "s-8") (kbd "["))
(define-key key-translation-map (kbd "s-(") (kbd "{"))
(define-key key-translation-map (kbd "s-9") (kbd "]"))
(define-key key-translation-map (kbd "s-)") (kbd "}"))
(define-key key-translation-map (kbd "s-7") (kbd "|"))
(define-key key-translation-map (kbd "s-/") (kbd "\\"))
(define-key key-translation-map (kbd "s-.") (kbd "…"))
(define-key key-translation-map (kbd "s--") (kbd "–"))
(define-key key-translation-map (kbd "s-_") (kbd "—"))
(define-key key-translation-map (kbd "s-¨") (kbd "~"))

(define-key key-translation-map (kbd "s-v") (kbd "‹"))
(define-key key-translation-map (kbd "s-b") (kbd "›"))
(define-key key-translation-map (kbd "s-V") (kbd "«"))
(define-key key-translation-map (kbd "s-B") (kbd "»"))

(define-key key-translation-map (kbd "s-n") (kbd "‘"))
(define-key key-translation-map (kbd "s-m") (kbd "’"))
(define-key key-translation-map (kbd "s-N") (kbd "“"))
(define-key key-translation-map (kbd "s-M") (kbd "”"))

;; Return behavior
(define-key global-map (kbd "C-j") 'newline)
(define-key global-map (kbd "RET") 'newline-and-indent)

;; File stuff
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-S") 'ido-write-file)
(global-set-key (kbd "M-w") 'kill-this-buffer)
(global-set-key (kbd "M-W") 'delete-frame)
(global-set-key (kbd "M-o") 'ido-find-file)
(global-set-key (kbd "M-O") 'recentf-ido-find-file)

;; Navigate
(global-set-key (kbd "s-<up>") 'backward-paragraph)
(global-set-key (kbd "s-<down>") 'forward-paragraph)
(global-set-key (kbd "M-<up>") 'beginning-of-buffer)
(global-set-key (kbd "M-<down>") 'end-of-buffer)
(global-set-key (kbd "M-<right>") 'end-of-line)
(global-set-key (kbd "M-<left>") 'beginning-of-line)
(global-set-key (kbd "C-<right>") 'shift-aware-forward-same-syntax)
(global-set-key (kbd "C-<left>") 'shift-aware-backward-same-syntax)
(global-set-key (kbd "C-s-<right>") 'shift-aware-forward-same-syntax)
(global-set-key (kbd "C-s-<left>") 'shift-aware-backward-same-syntax)
(global-set-key (kbd "s-<right>") 'forward-word)
(global-set-key (kbd "s-<left>") 'backward-word)
(global-set-key (kbd "C-s-<up>") 'sp-backward-sexp)
(global-set-key (kbd "C-s-<down>") 'sp-forward-sexp)
(global-set-key (kbd "M-a") 'mark-whole-buffer)
(global-set-key (kbd "M-l") 'goto-line-with-feedback)

(global-set-key (kbd "M-<backspace>") (λ (kill-line 0)))

;; From textmate mode
(global-set-key (kbd "M-L") 'textmate-select-line)
(global-set-key (kbd "M-<return>") 'textmate-next-line)
(global-set-key (kbd "M-/") 'comment-or-uncomment-region-or-line)


;; Find
(global-set-key (kbd "M-f") 'isearch-forward)
(global-set-key (kbd "M-g") 'isearch-repeat-forward)
(global-set-key (kbd "M-G") 'isearch-repeat-backward)
(global-set-key (kbd "M-e") 'search-for-marked-region)
(define-key isearch-mode-map (kbd "M-g") 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "M-e") 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "M-G") 'isearch-repeat-backward)
(define-key isearch-mode-map (kbd "M-E") 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "<escape>") 'keyboard-quit)
;; Make sure M-v pastes when searching
(define-key isearch-mode-map (kbd "M-v") (λ
                                          (kill-new (osx-clipboard-paste-function))
                                          (isearch-yank-kill)))

;; Splits
(global-set-key (kbd "C-x 2") 'my-split-vertical)
(global-set-key (kbd "C-x |") 'my-split-vertical)
(global-set-key (kbd "C-x 3") 'my-split-horizontal)
(global-set-key (kbd "C-x _") 'my-split-horizontal)
(global-unset-key (kbd "M-d"))
(global-set-key (kbd "M-d") 'my-split-vertical)
(global-set-key (kbd "M-D") 'my-split-horizontal)

;; Make sure M-v pastes when searching
(define-key isearch-mode-map (kbd "M-v") (λ
                                          (kill-new (osx-clipboard-paste-function))
                                          (isearch-yank-kill)))


;; Buffers/frames
(global-set-key (kbd "M-n") 'new-unnamed-buffer)

(global-set-key (kbd "M-b") 'ido-switch-buffer)
(global-set-key (kbd "M-<") 'next-multiframe-window)
(global-set-key (kbd "M->") 'previous-multiframe-window)


;; Indent
(global-set-key (kbd "M-s-8") 'indent-region-or-buffer)
(global-set-key (kbd "M-C-s-8") 'indent-region-or-buffer)

;; Jump
(global-set-key (kbd "C-.") 'pop-to-mark-command)
(global-set-key (kbd "C-:") 'pop-global-mark)

;; Window stuff
(global-set-key (kbd "M-h") 'ns-do-hide-emacs)
(global-set-key (kbd "C-M-<") 'next-frame)
(global-set-key (kbd "C-M->") 'prev-frame)

;; Hippie expand
(global-set-key (kbd "<escape>") (λ (cond (mark-active (deactivate-mark)) (t (hippie-expand-no-case-fold)))))
(global-set-key (kbd "M--") 'hippie-expand-no-case-fold)
;; Make shift-escape use previous hippie-expand-match
(global-set-key (kbd "S-<escape>") 'undo-tree-undo)

;; Minibuffer
(define-key minibuffer-local-map (kbd "<escape>") 'minibuffer-keyboard-quit)

(provide 'key-bindings)
