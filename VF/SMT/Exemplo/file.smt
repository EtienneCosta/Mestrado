; Sejam x, y e z inteiros positivos, distintos entre si. Se o valor de y não
; poder exceder 3, que valores poderão ter as variáveis x, y e z para que a sua 
; soma dê 8 ?


(set-logic QF_LIA)
; QF_LIA (quantifier-free linear integer arithmetic)
(declare-fun x () Int)
(declare-fun y () Int)
(declare-fun z () Int)

(assert (> x 0))
(assert (> y 0))
(assert (> z 0))
(assert (distinct x y z))
(assert (= (+ x y z) 8))
(assert (<= y 3))

;(assert (not (= x 5)))
;(assert (not (= y 1)))
;(assert (not (= z 2)))
;(assert (not (= x 1)))
;(assert (not (= y 2)))
;(assert (not (= z 5)))
;(assert (not (= x 4)))
;(assert (not (= y 3)))
;(assert (not (= z 1)))
(check-sat)
(get-model)

; sat 
; x,y,z são inteiros positivos ✅
; x=/=y=/=z ✅
; y<=3 ✅
; x+y+z = 8 ✅
; Soluções possíveis .
; x = 5 , y = 1 , z = 2
; x = 1 , y = 2 , z = 5
; x = 4 , y = 3 , z = 1
