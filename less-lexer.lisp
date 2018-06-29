
(in-package :less-lexer)

(defclass less-lexer (css-lexer) ())

(defmethod comment-token ((lx less-lexer))
  (push-token lx)
  (or (and (match lx "/*")
           (match-until lx "*/")
           (make-token lx 'comment-token))
      (and (match lx "//")
           (match-until lx (lambda (lx)
                             (match-newline lx)))
           (make-token lx 'comment-token))
      (discard-token lx)))

;;  CSS lexer

(defun less-lexer (stream)
  (assert (eq 'character (stream-element-type stream)))
  (make-instance 'less-lexer :stream stream))
