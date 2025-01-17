Require Import Basics Types.
Require Import Truncations.Core.
Require Import WildCat.
Require Import Pointed.
Require Import Spaces.Int Spaces.Circle Spaces.Spheres.
Require Import Algebra.AbGroups.
Require Import Homotopy.HomotopyGroup.

(** The fundamental group of the 1-sphere *)

Local Open Scope wc_iso_scope.

Section Pi1S1.
  Context `{Univalence}.

  Local Open Scope int_scope.
  Local Open Scope pointed_scope.

  Theorem Pi1Circle : Pi 1 [Circle, base] ≅ abgroup_Z.
  Proof.
    (** We give the isomorphism backwards, so we check the operation is preserved coming from the integer side. *)
    symmetry.
    srapply Build_GroupIsomorphism'.
    { equiv_via (base = base).
      2: exact (equiv_tr 0 (loops [Circle, base])).
      symmetry.
      exact equiv_loopCircle_int. }
    intros a b.
    cbn; apply ap.
    apply loopexp_add.
  Defined.

  Theorem Pi1S1 : Pi 1 (psphere 1) ≅ abgroup_Z.
  Proof.
    etransitivity.
    2: apply Pi1Circle.
    apply groupiso_pi_functor.
    apply pequiv_S1_Circle.
  Defined.

End Pi1S1.
