(use-package org-mode
  :bind (:map org-mode-map
              ("M-<up>"        . nil)
              ("C-<up>"        . org-metaup)
              ("M-<down>"      . nil)
              ("C-<down>"      . org-metadown)
              ("M-<left>"      . nil)
              ("C-<left>"      . org-metaleft)
              ("M-<right>"     . nil)
              ("C-<right>"     . org-metaright)

              ("M-<return>"    . nil)
              ("M-a"           . nil)

              ("M-S-<down>"    . nil)
              ("M-s-<down>"    . org-shiftmetadown)
              ("M-S-<up>"      . nil)
              ("M-s-<up>"      . org-shiftmetaup)

              ("M-S-<left>"    . nil)
              ("C-M-s-<left>"  . org-shiftmetaleft)
              ("M-S-<right>"   . nil)
              ("C-M-s-<right>" . org-shiftmetaright)

              ("S-<left>"      . nil)
              ("C-S-<left>"    . org-shiftleft)
              ("S-<right>"     . nil)
              ("C-S-<right>"   . org-shiftright)
              ("S-<down>"      . nil)
              ("C-S-<down>"    . org-shiftdown)
              ("S-<up>"        . nil)
              ("C-S-<up>"      . org-shiftup)))

(provide 'setup-org-mode)
