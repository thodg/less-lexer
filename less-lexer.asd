;;
;;  less-lexer  -  LESS lexer as a cl-stream/token-stream
;;
;;  Copyright 2018 Thomas de Grivel <thoxdg@gmail.com>
;;
;;  Permission to use, copy, modify, and distribute this software for any
;;  purpose with or without fee is hereby granted, provided that the above
;;  copyright notice and this permission notice appear in all copies.
;;
;;  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
;;  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
;;  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
;;  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
;;  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
;;  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
;;  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
;;

(in-package :common-lisp-user)

(defpackage :less-lexer.system
  (:use :common-lisp :asdf))

(in-package :less-lexer.system)

(defsystem :less-lexer
  :name "less-lexer"
  :author "Thomas de Grivel <thoxdg@gmail.com>"
  :version "0.1"
  :description "LESS lexer as a cl-stream/token-stream"
  :depends-on ("css-lexer")
  :components
  ((:file "package")
   (:file "less-lexer" :depends-on ("package"))))

(defsystem :less-lexer/test
  :name "less-lexer/test"
  :depends-on ("babel-stream" "less-lexer" "unistd-stream")
  :components
  ((:file "test")))
