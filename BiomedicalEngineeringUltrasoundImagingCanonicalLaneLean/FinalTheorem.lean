import HautevilleHouse.BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean

def ConstrainedUltrasoundClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_ultrasound_endgame (A : AdmissibleClass) :
    ConstrainedUltrasoundClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean
end HautevilleHouse