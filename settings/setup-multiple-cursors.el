(use-package multiple-cursors
  :straight t
  :bind (("s-SPC"   . 'mc/edit-lines)
         ("C-æ"     . 'mc/mark-next-like-this)
         ("C-Æ"     . 'mc/mark-all-like-this-dwim)
         ("C-M-s-æ" . 'mc/skip-to-next-like-this)
         ("M-<mouse-1>" . 'mc/add-cursor-on-click)
         :map mc/keymap
         ("<return>" . nil))
  :init
  (global-unset-key (kbd "M-<down-mouse-1>")))

(provide 'setup-multiple-cursors)
