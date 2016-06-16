;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname counter_world) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; Counter World. Counter starts from 10 (or any starter number entered to Main)
;; and goes down till 0

;; =================
;; Constants:
(define WIDTH 180)
(define HEIGHT 120)
(define MTS (empty-scene WIDTH HEIGHT))
(define CTR-Y (/ HEIGHT 2)) ; CTR stands for centre
(define CTR-X (/ WIDTH 2))
(define FS 96)     ; default font size
(define FC "blue") ; default font colour
(define STEP 1)    ; how much smaller is the next counter step
(define SN 0)      ; stop number

;; =================
;; Data definitions:

;; Counter is number
;; Interp. the number that shows the current status of the countdown
(define C1 0)   ; to test one-digit numbers
(define C2 10)  ; to test two-digit numbers
(define C3 100) ; to test three-digit numbers
#;
(define (fn-for-counter_world c)
  (... c))

;; =================
;; Functions:

;; Counter -> Counter
;; start the world with ...
;; 
(define (main c)
  (big-bang c                    ; Counter
            (on-tick   countdown)     ; Counter -> Counter
            (to-draw   render)   ; Counter -> Image
            (stop-when has-run-down?)      ; Counter -> Boolean
            (on-mouse  click-mouse)      ; Counter Integer Integer MouseEvent -> Counter
            (on-key    handle-key)    ; Counter KeyEvent -> Counter
            )
  )

;; Counter -> Counter
;; produce the next ...

(check-expect (countdown 10) 9)
(check-expect (countdown 1) 0)
(check-expect (countdown SN) SN)

(define (countdown c)
  (if (> c SN) (- c 1) SN)
  )


;; Counter -> Image
;; render the number as an image
(check-expect (render 10) (place-image (text (number->string 10) FS FC) CTR-X CTR-Y MTS))

(define (render c)
  (place-image
   (text
    (number->string c) FS FC) CTR-X CTR-Y MTS)
  )

;; Number -> Boolean
;; shows if the countdown has reached the stop condition
(check-expect (has-run-down? (+ SN 10)) #f)
(check-expect (has-run-down? SN) #t)

(define (has-run-down? c)
  (<= c SN)
  )

;; Counter KeyEvent -> Counter
;; when space is pressed, counter resets to zero
(check-expect (handle-key 10 " ") SN)
(check-expect (handle-key 10 "a") 10)
(check-expect (handle-key SN " ") SN)
(check-expect (handle-key SN "a") SN)

(define (handle-key c kevt)
  (cond [(key=? " " kevt) SN]
        [else c]
        )
  )

;; Counter Integer Integer MouseEvent -> Counter
;; when mouse is clicked, the

(define (click-mouse c x y me)
  (cond [(mouse=? me "button-down") SN]
        [else c]
        )
  )