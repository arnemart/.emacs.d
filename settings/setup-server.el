;; Vanlig server for emacsclient
(server-start)

;; HTTP-server
(use-package simple-httpd
  :straight t
  :custom
  (httpd-serve-files nil)
  (httpd-port 42069)
  :config
  (defservlet* open-file text/plain (file)
    (let ((parts (split-string file ":")))
      (let ((filename (car parts))
            (line (cadr parts)))
        (if (file-exists-p filename)
            (progn
              (run-with-timer 0 nil (lambda (f l)
                                      (find-file f)
                                      (when l (goto-line (string-to-number l)))
                                      (x-focus-frame nil))
                              filename line)
              (httpd-send-header t "text/plain" 200 :Access-Control-Allow-Origin "*"))
          (httpd-send-header t "text/plain" 404 :Access-Control-Allow-Origin "*")))))
  (httpd-start)
  (set-process-query-on-exit-flag (get-process "httpd") nil))

(provide 'setup-server)
