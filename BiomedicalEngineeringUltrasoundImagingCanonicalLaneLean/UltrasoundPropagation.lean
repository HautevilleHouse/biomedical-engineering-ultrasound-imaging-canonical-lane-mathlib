import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean

structure UltrasoundPropagationPackage where
  mediumDensity : ℝ
  speedOfSound : ℝ
  attenuationCoefficient : ℝ
  waveEquationValid : Prop
  boundaryConditions : Prop

structure UltrasoundPropagationEvidence (P : UltrasoundPropagationPackage) where
  waveEquationValidClosed : P.waveEquationValid
  boundaryConditionsClosed : P.boundaryConditions

def UltrasoundPropagationClosed (P : UltrasoundPropagationPackage) : Prop :=
  P.waveEquationValid ∧ P.boundaryConditions

theorem ultrasound_propagation_closed_from_evidence
    (P : UltrasoundPropagationPackage) (E : UltrasoundPropagationEvidence P) :
    UltrasoundPropagationClosed P := by
  exact And.intro E.waveEquationValidClosed E.boundaryConditionsClosed

end BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean
end HautevilleHouse