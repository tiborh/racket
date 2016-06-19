#lang racket
; define a new data type:
(define-struct pos (x y))

; make two instances of it
(define p1 (make-pos 3 6))
(define p2 (make-pos 2 8))

; selectors
(write "x = ")
(pos-x p1)
(write "y = ")
(pos-y p1)

; predicate
(write "is p1 a 'pos'? ")
(pos? p1)
(write "is p2 a 'pos'? ")
(pos? p2)
(define pf "hello")
(write "is pf a 'pos'? ")
(pos? pf)