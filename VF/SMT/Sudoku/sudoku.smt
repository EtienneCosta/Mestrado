(set-logic QF_LIA)
; QF_LIA (quantifier-free linear integer arithmetic)

; Declaração das constantes  
(declare-fun x11 () Int)
(declare-fun x12 () Int)
(declare-fun x13 () Int)
(declare-fun x14 () Int)
(declare-fun x21 () Int)
(declare-fun x22 () Int)
(declare-fun x23 () Int)
(declare-fun x24 () Int)
(declare-fun x31 () Int)
(declare-fun x32 () Int)
(declare-fun x33 () Int)
(declare-fun x34 () Int)
(declare-fun x41 () Int)
(declare-fun x42 () Int)
(declare-fun x43 () Int)
(declare-fun x44 () Int)

; Limite das constantes
(assert (and (<= 1 x11) (<= x11 4)))
(assert (and (<= 1 x12) (<= x12 4)))
(assert (and (<= 1 x13) (<= x13 4)))
(assert (and (<= 1 x14) (<= x14 4)))
(assert (and (<= 1 x21) (<= x21 4)))
(assert (and (<= 1 x22) (<= x22 4)))
(assert (and (<= 1 x23) (<= x23 4)))
(assert (and (<= 1 x24) (<= x24 4)))
(assert (and (<= 1 x31) (<= x31 4)))
(assert (and (<= 1 x32) (<= x32 4)))
(assert (and (<= 1 x33) (<= x33 4)))
(assert (and (<= 1 x34) (<= x34 4)))
(assert (and (<= 1 x41) (<= x41 4)))
(assert (and (<= 1 x42) (<= x42 4)))
(assert (and (<= 1 x43) (<= x43 4)))
(assert (and (<= 1 x44) (<= x44 4)))

;Regras sobre linhas 
(assert (distinct x11 x12 x13 x14))
(assert (distinct x21 x22 x23 x24))
(assert (distinct x31 x32 x33 x34))
(assert (distinct x41 x42 x43 x44))

;Regras sobre colunas
(assert (distinct x11 x21 x31 x41))
(assert (distinct x12 x22 x32 x42))
(assert (distinct x13 x23 x33 x43))
(assert (distinct x14 x24 x34 x44))


;Regras sobre sub-matrizes:
(assert (distinct x11 x12 x21 x22))
(assert (distinct x13 x14 x23 x24))
(assert (distinct x31 x32 x41 x42))
(assert (distinct x33 x34 x43 x44))

;Estado inicial do tabuleiro:
(assert(= x11 4))
(assert(= x13 1))
(assert(= x22 2))
(assert(= x33 3))
(assert(= x42 4))
(assert(= x44 1))

(check-sat)
(get-model)

; sat 
; 4 3 1 2
; 1 2 4 3
; 2 1 3 4
; 3 4 2 1
