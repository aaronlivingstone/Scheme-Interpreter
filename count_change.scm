(define (count-change total denoms max-coins)
  (cond ((< max-coins 1) 0)
	((< total 0) 0)
	((null? denoms) 0)
	((= total 0) 1)
	(else (+ (count-change total (cdr denoms) max-coins) (count-change (- total (car denoms)) denoms (- max-coins 1))))
  )
)

(define (count-partitions total max-value)
  (cond ((= total 0) 1)
	((= max-value 0) 0)
	((< total 0) 0)
	(else (+ (count-partitions total (- max-value 1)) (count-partitions (- total max-value) max-value)))))

(define (list-partitions total max-pieces max-value)
     (define part-list nil)
     (define (find-parts total max-pieces max-value part-list)
          (cond ((zero? total) (list nil))
                ((zero? max-pieces) (list nil))
                ((< total max-value) (list-partitions total max-pieces (- max-value 1))))
        (define construct (lambda (x y) (cons x y)))
        (append (map (construct ((list-partitions (- total max-value) (- max-pieces 1) max-value)) (list-partitions total max-pieces (- max-value 1))))))
     (find-parts total max-pieces max-value part-list))

(define (list-partitions total max-pieces max-value)
(define total_partitions ())
(define (helper total max parts max-pieces)
(cond ((or (< total 0) (<= max 0)) ())
((and (= total 0) (<= (length parts) max-pieces)) (define total_partitions (append total_partitions (list parts))))
(#t (helper (- total max) max (append parts (list max)) max-pieces) (helper total (- max 1) parts max-pieces))))
(helper total max-value '() max-pieces)
total_partitions)
