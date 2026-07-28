namespace HautevilleHouse
namespace BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean

structure UltrasoundSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure UltrasoundAdmittedObject where
  space : UltrasoundSpace
  imagingResolution : Prop
  contrastMechanism : Prop
  clinicalEndpoint : Prop
  conclusion : clinicalEndpoint

def UltrasoundWitnessClosed (O : UltrasoundAdmittedObject) : Prop :=
  O.clinicalEndpoint

end BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean
end HautevilleHouse