;;;; Some very easy codes here.

(define atom
  (lambda (n)
    (if (pair? n)
	#f
	#t)))

(define copy-self
  (lambda (lst)
    (if (null? lst)
	'()
	(cons (car lst)
	      (copy-self (cdr lst))))))

;; Accumulator
(define acc
  (lambda (n)
    (lambda (i)
      (set! n (+ n i))
      n)))

(define acc2
  (lambda (n)
    (lambda (i) (incf n i))))

; example
; (define foo (acc 10))
; (foo 10) -> 20
; (foo 5)  -> 25
; (foo 25) -> 50

(define-syntax set-zero!
  (syntax-rules ()
    [(_) #t]
    [(_ e) (set! e 0)]
    [(_ e1 e2 e3 ...)
     (if e1 (begin
	      (set-zero! e1)
	      (set-zero! e2 e3 ...)) #f)]))

; example
; (set! x 2) -> 2
; (set! y 3) -> 3
; (set-zero! x y) -> x:0 y:0

; by R. Kent Dybvig
(define memoize
  (lambda (proc)
    (let ([cache '()])
      (lambda (x)
	(cond
	 [(assq x cache) => cdr]
	 [else
	  (let ([ans (proc x)])
	    (set! cache (cons (cons x ans) cache))
	    ans)])))))

(define fst
  (lambda (lst)
    (apply (lambda (x . y) x) lst)))

(define rst
  (lambda (lst)
    (apply (lambda (x . y) y) lst)))

;;; Something about stacks.

(define init
  (lambda ()
    (set! lst '())))

(define push
  (lambda (x)
    (set! lst (cons x lst))))

(define pop
  (lambda ()
    (if (null? lst)
	'()
	(let ([top (car lst)])
	  (set! lst (cdr lst))
	  top))))

;;; incf and decf in Common Lisp

(define-syntax incf
  (syntax-rules ()
    [(_ x) (set! x (1+ x))]
    [(_ x y) (set! x (+ x y))]))

(define-syntax decf
  (syntax-rules ()
    [(_ x) (set! x (1- x))]
    [(_ x y) (set! x (- x y))]))