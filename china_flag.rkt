#lang racket
;
; National flag of the Republic of China
;
; See also: https://zh.wikipedia.org/zh-cn/%E4%B8%AD%E8%8F%AF%E6%B0%91%E5%9C%8B%E5%9C%8B%E6%97%97
;
(require 2htdp/image)

; Radius of the core of white sun
(define CORE_R (* 1 15))
; Width and height of left top corner
(define CORNER_W (* 8 CORE_R))
(define CORNER_H (* (/ 2 3) CORNER_W))

; Define colors for Sky Blue (cmyk 100 80 0 20)
;               and Deep Red (cmyk 0 100 100 10)
; See also: http://flag.moi.gov.tw/FAQ.html
(define skyblue (color 2 63 136))
(define deepred (color 215 25 32))

; Draw and save the national flag
(define IMAGE (overlay/align 'left 'top
                             (overlay
                              (underlay
                               (rotate (/ 360 (* 12 2)) (star-polygon (* (* 4 CORE_R) (sin (/ pi 12))) 12 5 'solid 'white))
                               (circle (* (/ 17 15) CORE_R) 'solid skyblue)
                               (circle CORE_R 'solid 'white))
                              (rectangle CORNER_W CORNER_H 'solid skyblue))
                             (rectangle (* 2 CORNER_W) (* 2 CORNER_H) 'solid deepred)))
IMAGE
(save-image IMAGE "roc_flag.png")
