#lang racket

(require meta-engine rchess "./show-cards.rkt")

;TODO.  Collect more.  
;         Start making speed tiers.
;         Make it easier to study / Recategorize cards ...

(define ids1
  '("557bb495e13823b8398a593c"
    "557ae090e13823b818db76b6"   
    "55826519e1382381e4bf3b8d"   
    "5579fdeee13823b8398a1abf"
    "557c22dce13823b82b9bd9db"
    "557ce5e7e13823b8379075ab"))

(define ids2
  '("557d0f44e13823b81e8af1f9"
    "557ccd39e13823b82f72bd28"   
    "55800b9ce13823b8361d7590"   
    "557884cee13823b824cbae19"
    "558071dbe13823b8350ae4f5"
    "557fef27e13823b83790e48c"))

(define (id->qa id)
  (list 
    (fen->image (fen id))
    (fen->image #:answer? #t (fen id))))


(define (ids->cards ids)
  (map register-sprite
       (flatten 
         (shuffle (map id->qa ids)))) )

(define (study-pack del ids)
  (play! 
    (game 
      (show-cards #:delay del
                  (ids->cards ids)))))   


#;
(study-pack 100 ids1)

(study-pack 500 ids2)


