#lang racket
(define result (make-vector 100 -1))

(define (f n)
  (if(<= n 4)
     1
     (let ((tmp (vector-ref result n)))
       (if(eq? tmp -1)
          (let((f1 (f (- n 1)))
               (f2 (f (- n 2)))
               (f3 (f (- n 3)))
               (f4 (f (- n 4)))
               (f5 (f (- n 5))))
            (vector-set! result n
                         (+ f1
                            (* 4 f2)
                            (* 5 f3)
                            (* -2 f4 f4)
                            (* f5 f5 f5)))
            (vector-ref result n))
          tmp))))

(define (loop)
  (let ((a (read)))
    (if(eq? a eof)
       (void)
       (begin (displayln (f a)) (loop)))))

(loop)
          