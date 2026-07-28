import HautevilleHouse.BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean

structure UltrasoundWavePropagationPackage where
  waveEquation : Prop
  attenuationModel : Prop
  speedOfSound : Prop
  nonlinearParameter : Prop
  frequencyDependence : Prop

structure UltrasoundWavePropagationEvidence (P : UltrasoundWavePropagationPackage) where
  waveEquationClosed : P.waveEquation
  attenuationModelClosed : P.attenuationModel
  speedOfSoundClosed : P.speedOfSound
  nonlinearParameterClosed : P.nonlinearParameter
  frequencyDependenceClosed : P.frequencyDependence

def UltrasoundWavePropagationClosed (P : UltrasoundWavePropagationPackage) : Prop :=
  P.waveEquation ∧ P.attenuationModel ∧ P.speedOfSound ∧ P.nonlinearParameter ∧ P.frequencyDependence

theorem ultrasound_wave_propagation_closed_from_evidence
    (P : UltrasoundWavePropagationPackage) (E : UltrasoundWavePropagationEvidence P) :
    UltrasoundWavePropagationClosed P := by
  exact And.intro E.waveEquationClosed
    (And.intro E.attenuationModelClosed
      (And.intro E.speedOfSoundClosed
        (And.intro E.nonlinearParameterClosed E.frequencyDependenceClosed)))

end BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean
end HautevilleHouse