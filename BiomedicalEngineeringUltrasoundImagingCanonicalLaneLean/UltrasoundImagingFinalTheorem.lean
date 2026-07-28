import UltrasoundImagingCanonicalLaneLean.UltrasoundImagingBridgeLemmas

namespace HautevilleHouse
namespace UltrasoundImagingCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness.casesOn (fun h => False.elim h) (fun h => h)

def ConstrainedUltrasoundClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_ultrasound_endgame (A : AdmissibleClass) :
    ConstrainedUltrasoundClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end UltrasoundImagingCanonicalLaneLean
end HautevilleHouse