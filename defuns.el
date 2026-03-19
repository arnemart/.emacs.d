(defmacro λ (&rest body)
  `(lambda ()
     (interactive)
     ,@body))

(provide 'defuns)
