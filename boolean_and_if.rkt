#lang racket
(define a 100)
(define b  50)
(define c (+ b b))
(define d (+ a b))

(define (compare a b)
  (define (write-info rel abool)
    (printf "~a ~s ~a ? ~a ~n" a rel b abool))
  (write-info ">"  (> a b)) 
  (write-info "<"  (< a b)) 
  (write-info "="  (= a b))
  (write-info "!="  (not (= a b)))
  (write-info ">=" (>= a b))
  (write-info "<=" (<= a b))
  (writeln "---------------"))

(compare a b)
(compare a c)
(compare a d)

(write "string comparison: ")
(string=? "foo" "bar")

(require 2htdp/image)
(define i1 (rectangle 10 20 "solid" "red"))
(define i2 (rectangle 20 10 "solid" "blue"))
(write "image width comparison: ")
(< (image-width i1) (image-width i2))

(write "tall or wide image? ")
(if (< (image-width i1) (image-height i1)) "tall" "wide")

(write "comparing both height and width: ")
(and (< (image-width i1) (image-width i2))
     (< (image-height i1) (image-height i2)))
(write "same with 'or'")
(or (< (image-width i1) (image-width i2))
    (< (image-height i1) (image-height i2)))
