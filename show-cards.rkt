#lang racket

(provide show-cards)

(require meta-engine (prefix-in r: rsound))

(define-component counter number?)                                         
(define-component last-card-index number?)                                         
(define-component dummy any/c)                                         

(define (half n)
  (/ n 2))

(define (get-card-index sprite-list)
  (remainder (floor (get-counter))
                    (length sprite-list)))


(define my-stream (r:make-pstream))

(define (show-cards 
           #:delay (times 1) 
           sprite-list)
  (entity
    (position (posn 200 200))

    (counter 0 (+ (get-counter)
                  (/ 1 times)))

    (dummy (void) (begin 
                     (when (not (eq? (get-card-index sprite-list)
                                     (get-last-card-index)))
                       (r:pstream-play my-stream r:click-1))))

    (last-card-index 0 (get-card-index sprite-list))

    (sprite (first sprite-list)
            (list-ref sprite-list (get-last-card-index)))))
