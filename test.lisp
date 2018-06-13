
(in-package :common-lisp-user)

(defpackage :css-lexer/test
  (:use :babel-stream
        :cl
        :cl-stream
        :css-lexer
        :unistd-stream)
  #.(cl-stream:shadowing-import-from)
  (:export
   #:run
   #:simple-test))

(in-package :css-lexer/test)

(defun simple-test ()
  (with-stream (css (css-lexer
                     (string-input-stream
                      "body { color: #f00; }")))
    (loop
       (let ((r (stream-read css)))
         (print r)
         (when (typep r 'css-lexer::eof-token)
           (return))))))

(defun run ()
  (simple-test))

(untrace token-stream::subseq*
         token-stream:make-token)
