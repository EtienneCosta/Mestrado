(set-logic QF_AUFLIA)

; Declaração das funções constantes  : i
(declare-const i0 Int)
(declare-const i1 Int)
(declare-const i2 Int)

; Declaração das funções constantes  : j
(declare-const j0 Int)
(declare-const j1 Int)
(declare-const j2 Int)
(declare-const j3 Int)
(declare-const j4 Int)
(declare-const j5 Int)
(declare-const j6 Int)
(declare-const j7 Int)
(declare-const j8 Int)

; Declaração das funções constantes  : M[][]
(declare-const M0 (Array Int (Array Int Int)))
(declare-const M1 (Array Int (Array Int Int)))
(declare-const M2 (Array Int (Array Int Int)))
(declare-const M3 (Array Int (Array Int Int)))
(declare-const M4 (Array Int (Array Int Int)))
(declare-const M5 (Array Int (Array Int Int)))
(declare-const M6 (Array Int (Array Int Int)))
(declare-const M7 (Array Int (Array Int Int)))
(declare-const M8 (Array Int (Array Int Int)))
(declare-const M9 (Array Int (Array Int Int)))

; i0=1
(assert (= i0 1))
; j0=1
(assert (= j0 1))
; M0[i0][j0] = i0+j0
(assert (= M1 (store M0 i0 (store (select M0 i0) j0 (+ i0 j0)) ) ))
; j1=j0+1
(assert (= j1 (+ j0 1)))
; M0[i0][j1] = i0+j1
(assert (= M2 (store M1 i0 (store (select M1 i0) j1 (+ i0 j1)) ) ))
; j2=j1+1
(assert (= j2 (+ j1 1)))
; M0[i0][j2] = i0+j2
(assert (= M3 (store M2 i0 (store (select M2 i0) j2 (+ i0 j2)) ) ))
; i1=i0+1
(assert (= i1 (+ i0 1)))
; j3=1
(assert (= j3 1))
; M0[i1][j3] = i1+j3
(assert (= M4 (store M3 i1 (store (select M3 i1) j3 (+ i1 j3)) ) ))
; j4=j3+1
(assert (= j4 (+ j3 1)))
; M0[i1][j4] = i1+j4
(assert (= M5 (store M4 i1 (store (select M4 i1) j4 (+ i1 j4)) ) ))
; j5=j4+1
(assert (= j5 (+ j4 1)))
; M0[i1][j5] = i1+j5
(assert (= M6 (store M5 i1 (store (select M5 i1) j5 (+ i1 j5)) ) ))
; i2=i1+1
(assert (= i2 (+ i1 1)))
; j6=1
(assert (= j6 1 ) )
; M0[i2][j6] = i2+j6
(assert (= M7 (store M6 i2 (store (select M6 i2) j6 (+ i2 j6 ) ) ) ))
; j7=j6+1
(assert (= j7 (+ j6 1)))
; M0[i2][j7] = i2+j7
(assert (= M8 (store M7 i2 (store (select M7 i2) j7 (+ i2 j7 ) ) ) ))
; j8=j7+1
(assert (= j8 (+ j7 1)))
; M0[i2][j8] = i2+j7
(assert (= M9 (store M8 i2 (store (select M8 i2) j8 (+ i2 j8 ) ) ) ))

(push)
(echo "----------------------------------------------------------------------------------------")
(echo "Se i=j então M[i][j] =/= 3 ")
(declare-const i Int)
(declare-const j Int)
(assert (not( => (= i j)  (not (= (select (select M9 i) j) 3) ) ) ) ) 
(check-sat)
(echo "Returns SAT : Pois pode estar a tentar aceder um endereço de memória inválido,")
(echo "              i.e posições que não estão definidas no nosso Array,")
(echo "              visto que o seu tamanho inicial não está declarado .")
(echo "----------------------------------------------------------------------------------------")
(pop)
;
;


(push)
(echo "----------------------------------------------------------------------------------------")
(echo "Para quaisquer i e j entre 1 e 3, M[i][j] = M[j][i]")
(declare-const i Int)
(declare-const j Int)
(assert  (and (<= 1 i ) (<= i 3 ) ) ) 
(assert  (and (<= 1 j ) (<= j 3 ) ) ) 
(assert (not (= (select (select M9 i) j)  (select (select M9 j) i) )))
(check-sat)
(echo "Verdadeira .")
(echo "----------------------------------------------------------------------------------------")
(pop)


(push)
(echo "----------------------------------------------------------------------------------------")
(echo "Para quaisquer i e j entre 1 e 3, se i<j então M[i][j] < 6")
(declare-const i Int)
(declare-const j Int)
(assert  (and (<= 1 i ) (<= i 3 ) ) ) 
(assert  (and (<= 1 j ) (<= j 3 ) ) ) 
(assert (not (=> (< i j) (< (select (select M9 i) j) 6))))
(check-sat)
(echo "Verdadeira .")
(echo "----------------------------------------------------------------------------------------")
(pop)


(push)
(echo "----------------------------------------------------------------------------------------")
(echo "Para quaisquer i, a e b entre 1 e 3 se a>b então M[i][a] > M[i][b] .")
(declare-const i Int)
(declare-const a Int)
(declare-const b Int)
(assert  (and (<= 1 i ) (<= i 3 ) ) ) 
(assert  (and (<= 1 a ) (<= a 3 ) ) ) 
(assert  (and (<= 1 b ) (<= b 3 ) ) ) 
(assert (not (=> (> a b) (> (select (select M9 i) a)  (select (select M9 i) b) ))))
(check-sat)
(echo "Verdadeira .")
(echo "----------------------------------------------------------------------------------------")
(pop)


(push)
(echo "----------------------------------------------------------------------------------------")
(echo "Para  quaisquer i e j entre 1 e 3, M[i][j]+ M[i+1][j+1] = M[i+1][j]+ M[i][j+1] .")
(declare-const i Int)
(declare-const j Int)
(assert  (and (<= 1 i ) (<= i 3 ) ) ) 
(assert  (and (<= 1 j ) (<= j 3 ) ) ) 
(assert (not (= (+ (select (select M9 i) j)  (select(select M9 (+ i 1 )) (+ j 1)))  (+ (select (select M9 (+ i 1) ) j) (select (select M9 i) (+ j 1 ))))))
(check-sat)
(echo "Returns SAT : Pois pode estar a tentar aceder um endereço de memória inválido,")
(echo "              i.e posições que não estão definidas no nosso Array,")
(echo "              visto que o seu tamanho inicial não está declarado .")
(echo "              Um exemplo simples seria para i ou j igual a 3.")
(echo "              i=3 e j=1 ... M[3][1]+ M[4][2] = M[4][1] + M[3][2] .")
(echo "----------------------------------------------------------------------------------------")
(pop)