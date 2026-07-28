import HautevilleHouse.BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean.UltrasoundAdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean

structure WavePropagationPackage where
  frequency : Prop
  speedOfSound : Prop
  attenuationCoefficient : Prop
  waveEquationSatisfied : Prop
  boundaryConditions : Prop

structure WavePropagationEvidence (P : WavePropagationPackage) where
  frequencyClosed : P.frequency
  speedOfSoundClosed : P.speedOfSound
  attenuationCoefficientClosed : P.attenuationCoefficient
  waveEquationSatisfiedClosed : P.waveEquationSatisfied
  boundaryConditionsClosed : P.boundaryConditions

def WavePropagationClosed (P : WavePropagationPackage) : Prop :=
  P.frequency ∧ P.speedOfSound ∧ P.attenuationCoefficient ∧ P.waveEquationSatisfied ∧ P.boundaryConditions

theorem wave_propagation_closed_from_evidence (P : WavePropagationPackage) (E : WavePropagationEvidence P) : WavePropagationClosed P := by
  exact And.intro E.frequencyClosed
    (And.intro E.speedOfSoundClosed
      (And.intro E.attenuationCoefficientClosed
        (And.intro E.waveEquationSatisfiedClosed E.boundaryConditionsClosed)))

end BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean
end HautevilleHouse