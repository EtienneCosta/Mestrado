(set-logic QF_UF)

(declare-fun mythical () Bool)
(declare-fun immortal () Bool)
(declare-fun mammal () Bool)
(declare-fun horned () Bool)
(declare-fun magical () Bool)

(assert (=> mythical immortal))
(assert (=> (not mythical) (and (not immortal) mammal)))
(assert (=> (or immortal mammal) horned))
(assert (=> horned magical))

;(check-sat)
;(get-model)

;sat
;(
;  (define-fun immortal () Bool
;    false)
;  (define-fun mythical () Bool
;    false)
;  (define-fun magical () Bool
;    true)
;  (define-fun horned () Bool
;    true)
;  (define-fun mammal () Bool
;    true)
;)
; Resposta :

(push)
; - Is the unicorn magical ?
(echo "Is the unicorn magical?")
(assert (not magical))
(check-sat)
(echo "Yes")
(echo "-------------")
(pop)

(push)
; -Is the unicorn horned?
(echo "Is the unicorn horned?")
(assert (not horned))
(check-sat)
(echo "Yes")
(echo "-------------")
(pop)


(push)
; -Is the unicorn mythical?
(echo "Is the unicorn mythical?")
(assert (not mythical))
(check-sat)
(echo "Not necessarily")
(echo "-------------")
(pop)