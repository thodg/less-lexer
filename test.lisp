
(in-package :common-lisp-user)

(require :babel-stream)
(require :unistd-stream)
(require :token-stream)

(defpackage :css-lexer-tests
  (:use :babel-stream
        :cl
        :cl-stream
        :css-lexer
        :unistd-stream)
  #.(cl-stream:shadowing-import-from)
  (:export #:run))

(in-package :css-lexer-tests)

(with-stream (css (css-lexer
                   (string-input-stream
                    "body { color: #f00; }")))
  (loop
     (let ((r (stream-read css)))
       (when (typep r 'css-lexer::eof-token)
         (return))
       (print r))))
