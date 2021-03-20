; ==== PROGRAMA =====
; x = a[i];
; y = y + x;
; a[i] = 5 + a[i];
; a[i+1] = a[i-1] -5;

(declare-fun a0 () (Array Int Int))
(declare-const a1 (Array Int Int))  ; Outra forma de declarar constantes.
(declare-const a2 (Array Int Int))  
(declare-const x0  Int)  
(declare-const x1  Int)  
(declare-const y0  Int)  
(declare-const y1  Int)  
(declare-const i0  Int)  

; x = a[i]
(assert (= x1 (select a0 i0) ))

; y = y + x
(assert (= y1 (+ y0 x1)))

; a[i] = 5 + a[i];
(assert (= a1 (store a0 i0 (+ 5 (select a0 i0)))))

; a[i+1] = a[i-1] -5;
(assert (= a2 (store a1 (+ i0 1) (- (select a1 (- i0 1)) 5))))

; No final da execução, verifica-se a seguinte propriedade : x + a[i-1] = a[i] + a[i+1]
(push)
(assert (not (= (+ x1 (select a2 (- i0 1))) (+ (select a2 i0) (select a2 (+ i0 1))))))
(check-sat)
(echo " No final da execução verifica-se que : x + a[i-1] = a[i] + a[i+1]")
;(get-model)
(pop)

; No final da execução, a soma dos valores guardados em a[i-1]e a[i] é sempre positiva.

(push)
(assert (not ( > (+ (select a2 (- i0 1))  (select a2 i0)) 0 )))
(check-sat)
(echo " No final da execução não verifica-se que : a[i-1] + a[i] > 0")
;(get-model)
(pop)


;Se o valor inicial de y for inferior a 5,  então no final da execução,o valor de a[i] é superior ao de y.

(push)
(assert (not (=> (< y0 0) (> (select a2 i0) y1 ))))
(check-sat)
(echo "Verifica-se")
(pop)