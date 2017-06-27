#lang racket
(require r5rs)
(define env (scheme-report-environment 5))

(eval '(define (last-pair lst)
         (if (null? (cdr lst))
             lst
             (last-pair (cdr lst))))
      env)

(eval '(define (make-cycle lst)
         (set-cdr! (last-pair lst) lst)
         lst)
      env)

(eval '
; 在此处补充你的代码
      (define (check-cycle alist)
        (define (contains? alist aitem)
          (cond((null? alist) #f)
               ((eq? (car alist) aitem) #t)
               (else (contains? (cdr alist) aitem))))
        (define checked '())
        (define (cc0 alist)
          (if(null? alist)
             #f
             (let((aitem (car alist)))
               (if(contains? checked aitem)
                  #t
                  (begin (set! checked (cons aitem checked))
                         (cc0 (cdr alist)))))))
        (cc0 alist))
      ;
env)

(define (myloop)
  (define (eval-codes codes last-val)
    (if (null? codes)
        last-val
        (eval-codes (cdr codes) (eval (car codes) env))))
    
  (let ((codes (read)))
    (if (eq? codes eof)
        (void)
        (begin (displayln (eval-codes codes (void))) (myloop)))))


(myloop)