;;; Codes here help me grasp and understand Church encoding
;;; while I learn Lambda calculus from Programming Language and
;;; Lambda Calculus. Here are some examples on Church numberials.

(define zero
  (lambda (f)
    (lambda (x) x)))

(define one
  (lambda (f)
    (lambda (x) (f x))))

(define iszero
  (lambda (n)
    ((n (lambda (x) #f)) #t)))

;;; Above all are definitions of ZERO, ONE and ISZERO of Church encoding.

(iszero one)
;; => #f

(iszero zero)
;; => #t

(((lambda (f) (lambda (x) (f x))) (lambda (x) #f)) #t) ; ISZERO TO ONE
;; => #f

(((lambda (f) (lambda (x) x)) (lambda (x) #f)) #t)     ; ISZERO TO ZERO
;; => #t