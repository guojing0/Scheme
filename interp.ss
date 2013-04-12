;;; It is something with calculating.


(define env0 '())

(define ext-env
  (lambda (x v env)
    (cons `(,x . ,v) env)))

(define lookup
  (lambda (x env)
    (let ((p (assq x env)))
      (cond
       ((not p) x)
       (else (cdr p))))))

(define closure
  (lambda (f)
    (lambda (env)
      (f env))))

(define interp0
  (lambda (exp env)
    (cond ((symbol? exp) (lookup exp env))
	  ((number? exp) exp)
	  (else (let ((op (car exp))
		      (v1 (cadr exp))
		      (v2 (caddr exp)))
		  (case op
		    (+ (+ v1 v2))
		    (- (- v1 v2))
		    (* (* v1 v2))
		    (/ (/ v1 v2))))))))
  
(define (interp exp)
  (interp0 exp env0))