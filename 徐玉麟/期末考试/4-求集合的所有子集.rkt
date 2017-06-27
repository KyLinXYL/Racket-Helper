#lang racket
(define (qsort numbers)
  (if (<= (length numbers) 1)
      numbers
      (let*-values ([(key) (car numbers)]
                    ((small big) (partition (lambda (x) (< x key)) (cdr numbers))))
         (append (qsort small) (list key) (qsort big)))))

(define (all-sub alist)
  (if(null? alist)
     (list '())
     (let((first (car alist))
          (rest (all-sub (cdr alist))))
       (append (list '())
               (map (lambda (asub) (cons first asub)) rest)
               (cdr rest)))))

(define (loop)
  (let((a (read)))
    (if(eq? a eof)
       (void)
       (begin (displayln (all-sub(qsort a))) (loop)))))
(loop)