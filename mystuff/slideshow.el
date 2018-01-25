(defun goto-slide (n)
  (interactive)
  (-if-let (file
            (->> (buffer-file-name)
                (file-name-sans-extension)
                (file-name-nondirectory)
                (s-split "-")
                (-last-item)
                (string-to-number)
                (+ n)
                (number-to-string)
                (s-prepend "*-")
                (s-append ".*")
                (file-expand-wildcards)
                (--remove (s-ends-with? "#" it))
                (car)))
      (find-file file)
    (message "No slide found")))


(global-set-key (kbd "C-s-<right>") (λ (goto-slide 1)))
(global-set-key (kbd "C-s-<left>") (λ (goto-slide -1)))

(provide 'slideshow)
