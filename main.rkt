#lang racket

(require meta-engine)

(require (only-in dtc/frames/animations napoleon/turk) 
         2htdp/image "./show-cards.rkt")   
        
(define (my-star color)
  (register-sprite (star 40 'solid color)))


(define sprite-list
  (list 
    (register-sprite (napoleon/turk 1))
    (register-sprite (napoleon/turk 2))
    (register-sprite (napoleon/turk 3))
    (register-sprite (napoleon/turk 4))
    (my-star "red")
    (my-star "orange")
    (my-star "yellow")
    (my-star "green")
    (my-star "blue")))

                                                                           
(play! (game (show-cards #:delay 100 sprite-list)))   
