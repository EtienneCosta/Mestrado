Section LP.

Variables A B C D: Prop.

Lemma a: (A -> C) /\ (B -> C) -> (A /\ B) -> C.
Proof.
  intros.
  destruct H.
  destruct H0.
  apply H.
  assumption.
Qed.