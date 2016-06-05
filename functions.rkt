#lang racket
(require 2htdp/image)

;the repetitive way
(above (circle 40 "solid" "red")
       (circle 40 "solid" "yellow")
       (circle 40 "solid" "green"))

;the function way
(define cols (list "red" "yellow" "green"))

(define (colored-circle acol)
  (circle 40 "solid" acol))
(define (stacked-circles colors)
  (apply above (map colored-circle colors)))

(colored-circle "blue")
(stacked-circles cols)

;the lambda way
(apply beside (map (lambda (acol) (circle 40 "solid" acol)) cols))

;optional parameters
(define (testpars one [two "two"] [three "three"])
  (writeln (string-append one " " two " " three)))

(testpars "one")
(testpars "one" "oh")
(testpars "one" "oh" "one")