(defun osx-clipboard-cut-function (text &rest ignore)
  (let* ((process-connection-type nil)
         (proc (start-process "pbcopy" nil "pbcopy")))
    (process-send-string proc text)
    (process-send-eof proc)))

(defun osx-clipboard-paste-function ()
  ;;(call-process "pbpaste" nil t)
  (s-chop-prefix "setenv: Too many arguments
"
                 (shell-command-to-string "pbpaste")))

(setq mc-clipboard-list '())

(defun paste-from-clipboard ()
  (interactive "*")
  (if (and (fboundp 'mc/num-cursors) (> (mc/num-cursors) 1))
      (let ((i 0))
        (mc/for-each-cursor-ordered
         (mc/restore-state-from-overlay cursor)
         (if mark-active
             (delete-region (region-beginning) (region-end)))
         (insert (if (= 0 (length mc-clipboard-list))
                     (osx-clipboard-paste-function)
                   (nth i (-cycle mc-clipboard-list))))
         (setq i (+ i 1))))

    (if mark-active
        (let ((p1 (region-beginning)) (p2 (region-end)))
          (if (not (window-minibuffer-p))
              (delete-region p1 p2))
          (insert (osx-clipboard-paste-function))
          (indent-region p1 (point)))
      (let ((p1 (point)))
        (insert (osx-clipboard-paste-function))
        (indent-region p1 (point))))))


(defun copy-to-clipboard (p1 p2)
  (interactive "r*")
  (if (and (fboundp 'mc/num-cursors) (> (mc/num-cursors) 1))
      (let ((parts '()))
        (mc/for-each-cursor-ordered
         (save-excursion
           (mc/restore-state-from-overlay cursor)
           (setq parts (cons (buffer-substring-no-properties (region-beginning) (region-end)) parts))))
        (setq mc-clipboard-list (reverse parts))
        (osx-clipboard-cut-function (s-join "\n" mc-clipboard-list)))
    (osx-clipboard-cut-function (buffer-substring p1 p2))
    (setq mc-clipboard-list '())))

(defun cut-to-clipboard (p1 p2)
  (interactive "r*")
  (if (and (fboundp 'mc/num-cursors) (> (mc/num-cursors) 1))
      (let ((parts '()))
        (mc/for-each-cursor-ordered
         (save-excursion
           (mc/restore-state-from-overlay cursor)
           (setq parts (cons (buffer-substring-no-properties (region-beginning) (region-end)) parts))
           (delete-region (region-beginning) (region-end))))
        (setq mc-clipboard-list (reverse parts))
        (osx-clipboard-cut-function (s-join "\n" mc-clipboard-list)))
    (osx-clipboard-cut-function (filter-buffer-substring p1 p2 t))
    (setq mc-clipboard-list '())))


;; Only use system clipboard
(setq interprogram-cut-function nil)
(setq interprogram-paste-function nil)

(global-set-key (kbd "M-v") 'paste-from-clipboard)
(global-set-key (kbd "M-c") 'copy-to-clipboard)
(global-set-key (kbd "M-s-x") 'cut-to-clipboard)

(provide 'copypaste)
