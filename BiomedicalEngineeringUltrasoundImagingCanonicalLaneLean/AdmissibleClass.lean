import HautevilleHouse.BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean

structure UltrasoundAdmittedObject where
  ultrasoundSystem : Type
  transducerArray : Type
  beamformingAlgorithm : Prop
  imageReconstructionPipeline : Prop
  safetyCompliance : Prop

structure AdmissibleClass where
  object : UltrasoundAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  UltrasoundWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean
end HautevilleHouse