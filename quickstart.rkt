#lang slideshow

; the primitive way
;(circle 10)
;(rectangle 10 20)
;(hc-append (circle 10) (rectangle 10 20))

; a more sophisticated way
(define c (circle 10))
(define r (rectangle 10 20))

;(hc-append 20 c r c) ; with spacing

(define (square n)
  ; A semi-colon starts a line comment.
  ; The expression below is the function body.
  (filled-rectangle n n))

(define (filled-circle s [col "blue"])
  ; s size
  ; col colour
  (colorize (filled-ellipse s s) col))

; local scope
(define (four p)
  (define two-p (hc-append p p))
  (vc-append two-p two-p))

; using "let" for local multiple binding
(define (checker p1 p2)
  (let ([p12 (hc-append p1 p2)]
        [p21 (hc-append p2 p1)])
    (vc-append p12 p21)))


; let* lets later binding use earlier bindings
(define (checkerboard p)
  (let* ([rp (colorize p "orange")]
         [bp (colorize p "blue")]
         [c (checker rp bp)]
         [c4 (four c)])
    (four c4)))

; function with arguments
(define (series mk)
  (hc-append 4 (mk 5) (mk 10) (mk 20)))

; using lexical binding
(define (rgb-series mk)
  (vc-append
   (series (lambda (sz) (colorize (mk sz) "red")))
   (series (lambda (sz) (colorize (mk sz) "green")))
   (series (lambda (sz) (colorize (mk sz) "blue")))))

; a different alignment
(define (rgb-maker mk)
  (lambda (sz)
    (vc-append (colorize (mk sz) "red")
               (colorize (mk sz) "green")
               (colorize (mk sz) "blue"))))

; lists
; using a list
(define (rainbow p)
  (map (lambda (color)
         (colorize p color))
       (list "red" "orange" "yellow" "green" "blue" "purple")))


; uninstalled modules are automatically downloaded and deployed
(require (planet schematics/random:1:0/random))
(random-gaussian)

; causes problems:
;(require 2htdp/image)
;(circle 20 "solid" "blue")

(require slideshow/code)

(define-syntax pict+code
  (syntax-rules ()
    [(pict+code expr)
     (hc-append 10
                expr
                (code expr))]))

(require racket/class
         racket/gui/base)
(define f (new frame% [label "My Art"]
                      [width 300]
                      [height 300]
                      [alignment '(center center)]))

(define (add-drawing p)
  (let ([drawer (make-pict-drawer p)])
    (new canvas% [parent f]
                 [style '(border)]
                 [paint-callback (lambda (self dc)
                                   (drawer dc 0 0))])))

; to make it possible to use it as a module:
 (provide (all-defined-out))