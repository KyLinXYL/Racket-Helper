#lang racket

(define (square x) (* x x))
(define (inc x) (+ x 1))
(define (db x) (* x 2))

(define (combine f1 f2 n)
; 在此处补充你的代码
  (define (g x) (f1 (f2 x)))
  (define (k x)
    (if(= 0 n)
       x
       (begin (set! n (- n 1)) (g (k x)))))
  k)
  ;
((combine square inc 1) 2)
((combine square inc 2) 3)
((combine db inc 3) 2)
((combine inc inc 4) 3)

(display "********") (newline)

(define (myloop)
  (let ((n (read))
        (x (read)))
    (if (eq? n eof)
        (void)
        (begin (display ((combine inc square n) x)) 
               (newline) (myloop)))))

(myloop)