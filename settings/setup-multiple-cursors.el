(use-package multiple-cursors
  :straight t
  :bind (("s-SPC"   . 'mc/edit-lines)
         ("C-æ"     . 'mc/mark-next-like-this)
         ("C-Æ"     . 'mc/mark-all-like-this-dwim)
         ("C-M-s-æ" . 'mc/skip-to-next-like-this)
         ("s-<mouse-1>" . 'mc/add-cursor-on-click)
         :map mc/keymap
         ("<return>" . nil))
  :init
  (global-unset-key (kbd "s-<down-mouse-1>")))

(provide 'setup-multiple-cursors)
