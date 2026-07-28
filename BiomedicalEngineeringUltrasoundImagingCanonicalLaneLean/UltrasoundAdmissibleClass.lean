import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean

structure UltrasoundImagingObject where
  dataset : Type
  imagingModality : Prop
  diagnosticConclusion : Prop
  conclusion : diagnosticConclusion

structure AdmissibleClass where
  object : UltrasoundImagingObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean
end HautevilleHouse