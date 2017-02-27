(->> '(ezimage-directory-plus
       "folder-o"
       ezimage-directory-minus "folder-open-o"
       ezimage-directory "folder-o"
       ezimage-page-plus "file-text-o"
       ezimage-page-minus "file-text-o"
       ezimage-page "file-o"
       ezimage-box-plus "chevron-right"
       ezimage-box-minus "chevron-down"
       ezimage-mail "envelope-o"
       ezimage-document-tag "tags"
       ezimage-info-tag "info-circle"
       ezimage-tag "tag"
       ezimage-tag-gt "tag"
       ezimage-tag-v "tag"
       ezimage-tag-type "tag"
       ezimage-checkout "check"
       ezimage-object "circle"
       ezimage-object-out-of-date "exclamation-circle"
       ezimage-label "bookmark-o"
       ezimage-lock "lock")
     (-partition 2)
     (--map (list (first it) (concat (first (last it)) "_cccccc_16")))
     (-map (lambda (it)
             (eval `(setq
                     ,(first it)
                     '(image :type png :file ,(concat "~/.emacs.d/mystuff/icons/" (first (last it)) ".png") :ascent center))))))

(provide 'setup-ezimage)
