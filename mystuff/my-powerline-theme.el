(defface plerrface-active
  '((t (:foreground "red" :inherit 'powerline-active2)))
  "")

(defface plerrface-inactive
  '((t (:foreground "DarkRed" :inherit 'powerline-inactive2)))
  "")

(defun my-powerline-theme ()
  "Setup the default mode-line."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (errface (if active 'plerrface-active 'plerrface-inactive))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          powerline-default-separator
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           powerline-default-separator
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list
                                ;; (powerline-raw "%*" nil 'l)
                                ;;      (powerline-buffer-size nil 'l)
                                ;;      (powerline-raw mode-line-mule-info nil 'l)
                                (powerline-buffer-id nil 'l)
                                (when (boundp 'buffer-file-coding-system)
                                  (let ((coding (s-chop-prefix "prefer-" (s-chop-suffix "-unix" (prin1-to-string buffer-file-coding-system)))))
                                    (when (not (s-contains? "utf-8" coding t))
                                      (powerline-raw coding errface 'l))))
                                (when (and (boundp 'which-func-mode) which-func-mode)
                                  (powerline-raw which-func-format nil 'l))
                                (powerline-raw " ")
                                (funcall separator-left mode-line face1)
                                (powerline-raw (nyan-create) face1)
                                (when (boundp 'erc-modified-channels-object)
                                  (powerline-raw erc-modified-channels-object face1 'l))
                                (powerline-major-mode face1 'l)
                                (powerline-process face1)
                                (powerline-minor-modes face1 'l)
                                (powerline-narrow face1 'l)
                                (powerline-raw " " face1)
                                (funcall separator-left face1 face2)
                                (powerline-vc face2 'r)))
                          (rhs (list (powerline-raw global-mode-string face2 'r)
                                     (funcall separator-right face2 face1)
                                     (powerline-raw "%4l" face1 'l)
                                     (powerline-raw ":" face1 'l)
                                     (powerline-raw "%3c" face1 'r)
                                     (funcall separator-right face1 mode-line)
                                     (powerline-raw " ")
                                     (powerline-raw "%6p" nil 'r)
                                     (powerline-hud face2 face1))))
                     (concat (powerline-render lhs)
                             (powerline-fill face2 (powerline-width rhs))
                             (powerline-render rhs)))))))

(provide 'my-powerline-theme)
