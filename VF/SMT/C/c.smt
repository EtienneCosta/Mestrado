(set-logic QF_AUFLIA)
; Logicalenconding of the C program:
;
;       x    = x + 1 
;       a[i] = x + 2 
;       y    = a[i]

; Array Size Type
(declare-const a0 (Array Int Int))
(declare-const a1 (Array Int Int))
(declare-const i0 Int)
(declare-const x0 Int)
(declare-const x1 Int)
(declare-const y1 Int)

(assert (= x1 (+ x0 1)))
(assert (= a1 (store a0 i0 (+ x1 2))))
(assert (= y1 (select a1 i0 )))

;; Is it true that after the execution of program y>x holds?
(assert (not (> y1 x1)))
(check-sat)

; Response : UNSAT -> É verdade que y > x no final da execução.