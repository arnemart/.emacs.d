(defmacro λ (&rest body)
  `(lambda ()
     (interactive)
     ,@body))
(global-set-key (kbd "s-l") (λ (insert "\u03bb")))


;; Default version of this isn't shift-aware :-(
(defun shift-aware-forward-same-syntax (&optional arg)
  "Move point past all characters with the same syntax class.
With prefix argument ARG, do it ARG times if positive, or move
backwards ARG times if negative."
  (interactive "^p")
  (or arg (setq arg 1))
  (while (< arg 0)
    (skip-syntax-backward
     (char-to-string (char-syntax (char-before))))
    (setq arg (1+ arg)))
  (while (> arg 0)
    (skip-syntax-forward (char-to-string (char-syntax (char-after))))
    (setq arg (1- arg))))
(defun shift-aware-backward-same-syntax (&optional arg)
  (interactive "^p")
  (shift-aware-forward-same-syntax -1))


(defun new-unnamed-buffer ()
  "Create a new buffer named \"untitled-n\""
  (interactive)
  (let ((buffer-name "untitled-1") (buffer-num 1))
    (while (get-buffer buffer-name)
      (setq buffer-num (+ 1 buffer-num))
      (setq buffer-name (format "untitled-%d" buffer-num)))
    (let ((buffer (get-buffer-create buffer-name)))
      (switch-to-buffer buffer)
      (setq buffer-offer-save t)
      (setq whitespace-cleanup-mode-initially-clean t))))

(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let* ((file-assoc-list (mapcar (lambda (x) (cons (s-chop-prefix (concat (expand-file-name "~") "/") x) x)) recentf-list))
         (filename-list (-distinct (mapcar #'car file-assoc-list)))
         (filename (ido-completing-read "Choose recent file: " filename-list nil t)))
    (when filename
      (find-file (cdr (assoc filename file-assoc-list))))))


(defun search-for-marked-region (beg end)
  "Set selected region as search text"
  (interactive "r")
  (let ((selection (buffer-substring-no-properties beg end)))
    (deactivate-mark)
    (isearch-mode t)
    (isearch-yank-string selection)))


(defun open-file-at-point ()
  "Opens the file at point, prompts to create it if necessary."
  (interactive)
  (let ((path (ffap-file-at-point)))
    (if (and path (not (file-directory-p path)))
        (if (string-match-p "\\`/https?://" path)
            (browse-url path)
          (find-file path))
      (let ((newpath (thing-at-point 'filename)))
        (let ((newfile (read-string (format "Create file (%s): " newpath) nil nil newpath)))
          (find-file newfile))))))


(defun my-switch-buffer ()
  "Switch buffer using projectile or ido-switch-buffer"
  (interactive)
  (if (projectile-project-p)
      (projectile-switch-to-buffer)
    (ido-switch-buffer)))


(defun my-ag (pattern &optional arg)
  "Use ag or projectile-ag conditionally"
  (interactive
   (list (read-from-minibuffer
          (projectile-prepend-project-name "Ag search for: ")
          (projectile-symbol-at-point))
         current-prefix-arg))
  (if (projectile-project-p)
      (projectile-ag pattern arg)
    (ag-project pattern)))


(defun indent-buffer ()
  "Indent the whole thing"
  (interactive)
  (indent-region (point-min) (point-max)))


(defun indent-region-or-buffer ()
  "Indent the whole thing or the selected part of the thing"
  (interactive)
  (if mark-active
      (indent-region (region-beginning) (region-end))
    (indent-buffer)))


(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))


;; Splits
(defun my-split-vertical ()
  "Split buffer vertically and select the new buffer"
  (interactive)
  (split-window-right)
  (other-window 1))
(defun my-split-horizontal ()
  "Split buffer horizontally and select the new buffer"
  (interactive)
  (split-window-below)
  (other-window 1))


(defun eval-region-or-buffer (command)
  "Pipe the current region or buffer through `command`
   and show output in the minibuffer`"
  (interactive)
  (let ((debug-on-error t) (start 1) (end 1))
    (cond
     (mark-active
      (setq start (region-beginning))
      (setq end (region-end)))
     (t
      (setq start (point-min))
      (setq end (point-max))))
    (shell-command-on-region
     start
     end
     command)
    (deactivate-mark)))

(defun node-js-eval-region-or-buffer ()
  (interactive)
  (eval-region-or-buffer "node"))

(defun php-eval-region-or-buffer ()
  (interactive)
  (eval-region-or-buffer "php"))

(defun ruby-eval-region-or-buffer ()
  (interactive)
  (eval-region-or-buffer (shell-command-to-string "rbenv which ruby")))


(defun toggle-rectangular-selection ()
  "Toggle between normal multi-line selection and column selection with multiple cursurs"
  (interactive)
  (when mark-active
    (if (= (mc/num-cursors) 1)
        (let ((start (region-beginning)) (end (region-end)))
          (deactivate-mark)
          (goto-char start)
          (set-rectangular-region-anchor)
          (goto-char end))
      (rrm/keyboard-quit)
      (multiple-cursors-mode 0)
      (goto-char start)
      (set-mark-command nil)
      (goto-char end))))

(defun shuffle-region (beg end)
  "Randomize lines in region from BEG to END."
  (interactive "*r")
  (let ((lines (split-string
                (delete-and-extract-region beg end) "\n")))
    (when (string-equal "" (car (last lines 1)))
      (setq lines (butlast lines 1)))
    (apply 'insert
           (mapcar 'cdr
                   (sort (mapcar (lambda (x) (cons (random) (concat x "\n"))) lines)
                         (lambda (a b) (< (car a) (car b))))))))


(provide 'defuns)
