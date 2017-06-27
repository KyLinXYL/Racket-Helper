#lang racket
(require r5rs)

(define env (scheme-report-environment 5))
(eval  ;only after evaluating your my-map, the program in the input can use my-map
 '
(define (my-map proc . args)
; 在此处补充你的代码
  (define (notnull? x) (not(null? x)))
  (define (filter pred alist)
    (if(null? alist)
       '()
       (let ((a (car alist)))
         (if(pred a)
            (cons a (filter pred (cdr alist)))
            (filter pred (cdr alist))))))
  (if(null? args)
     '()
     (let ((L1ni (map car (filter notnull? args)))
           (nextargs (filter notnull? (map cdr (filter notnull? args)))))
       (if(null? L1ni)
          '()
          (cons (apply proc L1ni)
                (apply my-map (cons proc nextargs)))))))
  ;
env)

(define (myloop)
  (let ((codes (read)))
    (if (eq? codes eof)
        (void)
        (begin  (displayln (eval codes env)) (myloop)))))


(myloop)