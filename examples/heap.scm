(define (left-child k) (* 2 k))

(define (right-child k) (+ (* 2 k) 1))

(define (pq-parent n)
  (if (= n 1)
    -1
    (floor (/ n 2))))

(define (pq-child n) (* n 2))
