
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
   #:simple-test
   #:test-file))

(in-package :css-lexer/test)

(defun simple-test ()
  (with-stream (css (css-lexer
                     (string-input-stream
                      "body { color: #f00; }")))
    (loop
       (multiple-value-bind (token state) (stream-read css)
         (ecase state
           ((nil) (print token))
           ((:eof) (return))
           ((:non-blocking) (sleep 0.01)))))))

(defun test-file (path)
  (with-stream (css (css-lexer
                     (babel-input-stream
                      (unistd-stream-open path :read t))))
    (loop
       (multiple-value-bind (token state) (stream-read css)
         (ecase state
           ((nil) (print token))
           ((:eof) (return))
           ((:non-blocking) (sleep 0.01)))))))

(defun run ()
  (simple-test))

(untrace token-stream::subseq*
         token-stream:make-token)
