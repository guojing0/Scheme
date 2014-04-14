;;; Logic gates' implementions which are not in Lisp.

(define nand
  (lambda (x y)
    (not (and x y))))

(define nor
  (lambda (x y)
    (not (or x y))))

(define xnor
  (lambda (x y)
    (not (xor x y))))

(define xor
  (lambda (x y)
    (or (and x (not y))
	(and (not x) y))))