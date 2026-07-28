import UltrasoundImagingCanonicalLaneLean.UltrasoundImagingAdmissibleClass

namespace HautevilleHouse
namespace UltrasoundImagingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.gateWitness.casesOn (fun h => h) (fun h => False.elim h)

end UltrasoundImagingCanonicalLaneLean
end HautevilleHouse