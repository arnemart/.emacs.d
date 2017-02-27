(defun js-method-function-p ()
  (save-excursion
    (word-search-backward "function$")
    (looking-back ": " nil)))

(defun js-anonymous-function-p ()
  (save-excursion
    (word-search-backward "function$")
    (looking-back " = " nil)))

(defun snippet--function-punctuation ()
  (if (js-method-function-p)
      (if (looking-at "\s*\n*\s*\\}")
          ""
        ",")
    (when (js-anonymous-function-p)
      ";")))

(provide 'snippet-helpers)
