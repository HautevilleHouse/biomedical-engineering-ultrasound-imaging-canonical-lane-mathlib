import HautevilleHouse.BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean.UltrasoundWavePropagation

namespace HautevilleHouse
namespace BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean

structure BeamformingPackage {U : UltrasoundWavePropagationPackage} where
  delayAndSum : Prop
  apodization : Prop
  dynamicFocusing : Prop
  apertureGrowth : Prop
  syntheticAperture : Prop

structure BeamformingEvidence {U : UltrasoundWavePropagationPackage} (B : BeamformingPackage U) where
  delayAndSumClosed : B.delayAndSum
  apodizationClosed : B.apodization
  dynamicFocusingClosed : B.dynamicFocusing
  apertureGrowthClosed : B.apertureGrowth
  syntheticApertureClosed : B.syntheticAperture

def BeamformingClosed {U : UltrasoundWavePropagationPackage} (B : BeamformingPackage U) : Prop :=
  B.delayAndSum ∧ B.apodization ∧ B.dynamicFocusing ∧ B.apertureGrowth ∧ B.syntheticAperture

theorem beamforming_closed_from_evidence
    {U : UltrasoundWavePropagationPackage} (B : BeamformingPackage U) (E : BeamformingEvidence B) :
    BeamformingClosed B := by
  exact And.intro E.delayAndSumClosed
    (And.intro E.apodizationClosed
      (And.intro E.dynamicFocusingClosed
        (And.intro E.apertureGrowthClosed E.syntheticApertureClosed)))

end BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean
end HautevilleHouse