#lang racket
(require slideshow)
(require "quickstart.rkt")

(square 10)
(square 20)
(filled-circle 10)
(filled-circle 10 "red")

(four (circle 10))

(checker (colorize (square 10) "yellow")
         (colorize (square 10) "blue"))

(checkerboard (square 10))
(checkerboard (filled-circle 20))

(series circle)
(series square)
(series filled-circle)
(series (lambda (size) (checkerboard (square size))))

(rgb-series circle)
(rgb-series square)

(series (rgb-maker circle))
(series (rgb-maker square))

(require slideshow/code)
(code (circle 10))

; map gives list arguments one by one
; apply gives all at once, but not as a list
(apply vc-append (rainbow (square 10)))
(apply hc-append (rainbow (square 10)))

; slideshow is the main module
; other modules are imported with "require"
(require pict/flash)
(filled-flash 40 30)

(pict+code (circle 10))

(send f show #t)
(add-drawing (pict+code (circle 10)))

(add-drawing (colorize (filled-flash 50 30) "yellow"))
