(use-package tagedit
  :ensure t
  :bind (:map tagedit-mode-map
              (">" . nil)))


(use-package web-mode
  :ensure t
  :mode "\\.html$"
  :mode "\\.liquid$"
  :mode "\\.twig"
  :mode "\\.html\\.erb"
  :mode "\\.php"
  :bind (:map web-mode-map
              ("M-r" . refresh-chrome)
              ("C-M-<left>" . sgml-skip-tag-backward)
              ("C-M-<right>" . sgml-skip-tag-forward)
              ("C-<right>" . tagedit-forward-slurp-tag)
              ("C-<left>" . tagedit-forward-barf-tag)
              ("s-s" . tagedit-kill-attribute)
              ("C-k" . tagedit-kill)
              ("M-m S" . tagedit-split-tag)
              ("M-m J" . tagedit-join-tags)
              ("M-m P" . tagedit-splice-tag)
              ("M-m R" . tagedit-raise-tag)
              ("C-M-s-p" . browse-url-of-file)
              ("C-M-<left>" . backward-sexp)
              ("C-M-<right>" . forward-sexp)
              ("M-s-." . sgml-close-tag))
  :init
  (setq web-mode-content-types-alist
        '(("jsx"  . "\\.jsx?\\'")))
  (setq web-mode-engines-alist
        '(("twig" . "craft/templates/.*\\.html\\'")))
  (add-hook 'web-mode-hook
            '(lambda ()
               (require 'tagedit)
               (set (make-local-variable 'te/skip-tag-forward-fn)
                    'web-mode-te-skip-tag-forward-fn)

               (set (make-local-variable 'te/skip-tag-backward-fn)
                    'web-mode-te-skip-tag-backward-fn)

               (set (make-local-variable 'te/empty-tag-p-fn)
                    'web-mode-element-is-void)

               (set (make-local-variable 'te/current-tag-fn)
                    'web-mode-te-current-tag-fn)

               (set (make-local-variable 'te/forward-sexp-fn)
                    'web-mode-te-forward-sexp)

               (set (make-local-variable 'te/backward-sexp-fn)
                    'web-mode-te-backward-sexp)

               (set (make-local-variable 'te/forward-list-fn)
                    'web-mode-te-forward-list)

               (set (make-local-variable 'te/backward-list-fn)
                    'web-mode-tag-previous)

               (set (make-local-variable 'forward-sexp-function) nil)

               (defun tagedit-insert-lt ()
                 (interactive)
                 (when (fboundp 'autopair-mode)
                   (autopair-mode -1))
                 (if (or (te/point-inside-string?)
                         (te/point-inside-tag-innards?))
                     (self-insert-command 1)
                   (if mark-active
                       (let ((start (region-beginning)) (end (region-end)))
                         (deactivate-mark)
                         (goto-char end)
                         (insert "</>")
                         (forward-char -1)
                         (te/create-mirror (point) (point))
                         (goto-char start)
                         (insert "<>")
                         (forward-char -1)
                         (te/create-master (point) (point)))
                     (insert "<></>")
                     (forward-char -1)
                     (te/create-mirror (point) (point))
                     (forward-char -3)
                     (te/create-master (point) (point)))))

               (tagedit-mode 1)

               (defadvice te/on-master-modification (around fix-php-tags activate)
                 (if (looking-back "\\?" nil)
                     (let ((inhibit-modification-hooks t))
                       (te/remove-closing-tag-and-mirror (te/current-tag))
                       (insert "php  ?")
                       (forward-char -2)
                       (te/conclude-tag-edit))
                   ad-do-it))


               (tagedit-add-experimental-features)

               (defun te/eligible-for-auto-attribute-insert? ()
                 (and (te/point-inside-tag-innards?)
                      (not (te/point-inside-string?))
                      (not (te/point-inside-comment?))
                      (not (s-starts-with? "%" (te/get (te/current-tag) :name)))
                      (not (s-starts-with? "?" (te/get (te/current-tag) :name)))))

               (defadvice indent-for-tab-command (around jump-inside-tag activate)
                 (interactive)
                 (if (and (te/point-inside-tag-innards?) (te/point-inside-string?))
                     (search-forward ">")
                   (forward-char)
                   ad-do-it))

               (defadvice newline (around possibly-reindent-tags activate)
                 (interactive)
                 (cond
                  ((and (string-equal (string (preceding-char)) ">") (looking-at "<"))
                   ad-do-it
                   (let ((do-the-thing t))
                     (save-excursion
                       (search-backward "<")
                       (if (looking-at "<\/")
                           (setq do-the-thing nil)))
                     (when do-the-thing
                       (save-excursion
                         (unless (looking-at "<\/")
                           (sgml-skip-tag-forward 1))
                         (newline-and-indent))
                       (indent-according-to-mode))))
                  (t ad-do-it)))))

  (defun web-mode-te-skip-tag-forward-fn ()
    "Move to end of current (or next) tag.
web-mode's nearest equivalent that I could find only handles current tag.
Hence this wrapper."
    (skip-syntax-forward " <")
    (web-mode-element-end))

  (defun web-mode-te-skip-tag-backward-fn ()
    "Move to beginning of current (or previous) tag.
web-mode's nearest equivalent that I could find only handles current tag.
Hence this wrapper."
    (skip-syntax-backward " >")
    (backward-char 1)
    (web-mode-element-beginning))

  (defun web-mode-te-current-tag-fn ()
    "Return current tag alist for tagedit."
    (ignore-errors
      (save-excursion
        (let* ((beg (web-mode-element-beginning-position))
               ;; web-mode's end-position gets the position of the closing >,
               ;; while tagedit expects the position *after* it.
               (end (+ 1 (web-mode-element-end-position)))
               (name (get-text-property beg 'tag-name))
               (self-closing (if (web-mode-element-is-void name)
                                 :t
                               :f)))
          `((:name . ,name)
            (:self-closing . ,self-closing)
            (:beg . ,beg)
            (:end . ,end))))))


  (defun web-mode-te-forward-list ()
    (unless (looking-at "<")
      (web-mode-tag-next))
    (web-mode-tag-end))

  (defun web-mode-te-forward-sexp ()
    (forward-sexp)
    (if (looking-at ">")
        (forward-char)))

  (defun web-mode-te-backward-sexp ()
    (backward-sexp)
    (forward-char -2)
    (unless (looking-at "</")
      (forward-char 2))
    (forward-char -1)
    (unless (looking-at "<")
      (forward-char 1))))

(provide 'setup-web-mode)
