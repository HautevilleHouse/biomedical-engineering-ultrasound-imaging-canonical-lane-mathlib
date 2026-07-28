import HautevilleHouse.BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean.UltrasoundWavePropagation

namespace HautevilleHouse
namespace BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean

structure BeamformingPackage (W : WavePropagationPackage) where
  transducerArray : Type u
  delayAndSum : Type v
  apodization : Type w
  beamformedRF : Type x
  delayPrecision : Prop
  apodizationCorrect : Prop
  sumCoherent : Prop

structure BeamformingEvidence {W : WavePropagationPackage} (B : BeamformingPackage W) where
  delayPrecisionClosed : B.delayPrecision
  apodizationCorrectClosed : B.apodizationCorrect
  sumCoherentClosed : B.sumCoherent

def BeamformingClosed {W : WavePropagationPackage} (B : BeamformingPackage W) : Prop :=
  B.delayPrecision ∧ B.apodizationCorrect ∧ B.sumCoherent

theorem beamforming_closed_from_evidence {W : WavePropagationPackage} (B : BeamformingPackage W) (E : BeamformingEvidence B) : BeamformingClosed B :=
  And.intro E.delayPrecisionClosed (And.intro E.apodizationCorrectClosed E.sumCoherentClosed)

end BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean
end HautevilleHouse