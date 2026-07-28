import HautevilleHouse.BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  UltrasoundWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.safetyCompliance

end BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean
end HautevilleHouse