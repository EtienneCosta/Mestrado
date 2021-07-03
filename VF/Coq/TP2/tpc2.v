on RIP.
 
Set Implicit Arguments.
 
Require Import List.
 
Inductive In (A:Type) (y:A) : list A -> Prop :=
  | InHead : forall (xs:list A), In y (cons y xs)
  | InTail : forall (x:A) (xs:list A), In y xs -> In y (cons x xs).
 
Inductive Prefix (A:Type) : list A -> list A -> Prop :=
  | PreNil : forall (l:list A), Prefix nil l
  | PreCons : forall (x:A) (l1 l2:list A), Prefix l1 l2 -> Prefix (x::l1) (x::l2).
 
Inductive SubList (A:Type) : list A -> list A -> Prop :=
  | SLnil : forall (l:list A), SubList nil l
  | SLcons1 : forall (x:A) (l1 l2:list A), SubList l1 l2 -> SubList (x::l1) (x::l2)
  | SLcons2 : forall (x:A) (l1 l2:list A), SubList l1 l2 -> SubList l1 (x::l2).
 
Lemma a_first: SubList (5::3::nil) (5::7::3::4::nil).
Proof.
  constructor.
  constructor.
  constructor.
  constructor.
Qed.
 
Lemma b_first: forall (A:Type) (l:list A), SubList l l.
Proof.
  intros.
  induction l.
  - constructor.
  - constructor.
    assumption.
Qed.
 
Lemma c_first: forall (A B:Type) (f:A->B) (l1 l2:list A), SubList l1 l2 -> SubList (map f l1) (map f l2).
Proof.
  intros.
  induction l2.
  - simpl.
    inversion H.
    constructor.
  - elim H.
    + simpl.
      constructor.
    + intros.
      simpl.
      constructor.
      assumption.
    + intros.
      simpl.
      constructor.
      assumption.
Qed.
 
Lemma d_first: forall (A:Type) (x:A) (l:list A), In x l -> exists l1, exists l2, l = l1 ++ (x::l2).
Proof.
  intros.
  induction H.
  - exists nil.
    exists xs.
    simpl.
    reflexivity.
  - destruct IHIn.
    exists (x0::x1).
    elim H0.
    intros.
    simpl.
    exists x2.
    rewrite <- H1.
    reflexivity.
Qed.
 
Fixpoint drop (A:Type) (n:nat) (l:list A) {struct l} : list A :=
  match l with
    | nil => nil
    | x::xs => match n with
               | 0 => x::xs
               | _ => drop (n-1) xs
               end
    end.
 
Lemma a_second: drop 2 (5::7::3::4::nil) = 3::4::nil.
Proof.
  simpl.
  reflexivity.
Qed.
 
Lemma b_second: forall (A:Type) (n:nat) (l:list A), SubList (drop n l) l.
Proof.
  intros A.
  induction n.
  - intros.
    assert (drop 0 l = l).
    + induction l.
      * simpl; reflexivity.
      * simpl; reflexivity.
    + rewrite H; apply b_first.
  - induction l.
    + simpl.
      constructor.
    + assert (drop (S n) (a::l) = drop n l).
      * simpl.
        SearchPattern (_ - 0 = _).
        generalize (PeanoNat.Nat.sub_0_r n).
        intros.
        rewrite H.
        reflexivity.
      * rewrite H.
        constructor.
        apply IHn.
Qed.
 
Inductive Sorted : list nat -> Prop := 
  | SortedNil : Sorted nil
  | SortedSingl : forall (x:nat), Sorted (x :: nil)
  | SortedCons : forall (x y:nat) (l:list nat), x <= y -> Sorted (y::l) -> Sorted (x::y::l).
 
 
Lemma a_third: forall (x y:nat) (l:list nat), x <= y -> Sorted (y::l) -> Sorted (x::l).
Proof.
  intros.
  induction l.
  - constructor.
  - generalize H0.
    generalize H.
    constructor.
    + inversion H2.
      rewrite H5 in H1.
      assumption.
    + inversion H0.
      assumption.
Qed.
 
Lemma b_third: forall (x y:nat) (l:list nat), (In y l) /\ (Sorted (x::l)) -> x <= y.
Proof.
  intros.
  destruct H.
  inversion H.
  - rewrite <- H1 in H0.
    inversion H0.
    assumption.
  - induction H1.
    + rewrite <- H2 in H0.
      inversion H0; inversion H6; inversion H11.
      rewrite H9 in H4.
      * assumption.
      * rewrite H9 in H4.
        assumption.
    + Admitted.
 
Lemma a_fourth: forall (A:Type) (l:list A), Prefix l l.
Proof.
  intros.
  induction l.
  - constructor.
  - constructor.
    assumption.
Qed.
 
(*
Lemma b_fourth: forall (A:Type) (l1 l2 l3:list A), Prefix l1 l2 /\ Prefix l2 l3 -> Prefix l1 l3.
Proof.
  intros.
  destruct H.
  induction H.
  - constructor.
  - destruct IHPrefix.
    + inversion H0.
      Admitted.
*)
 
Lemma c_fourth: forall (A:Type) (l1 l2:list A), Prefix l1 l2 /\ Prefix l2 l1 -> l1 = l2.
Proof.
  intros.
  destruct H.
  induction H.
  - inversion H0.
    reflexivity.
  - destruct IHPrefix.
    + inversion H0.
      assumption.
    + reflexivity.
Qed.