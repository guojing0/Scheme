(define calc
  (lambda (expr)
    (cond
     ((number? expr) expr)
     (else (let ((op (car expr))
                    (v1 (cadr expr))
                    (v2 (caddr expr)))
	     (case op
	       (let loop ((exps (cddr exp)))
		 (if (null? (cdr exps))
                        (calc (car exps))
                        (loop (cdr exps))))
	       ('+ (+ v1 v2))
	       ('- (- v1 v2))
	       ('* (* v1 v2))
	       ('/ (/ v1 v2))))))))