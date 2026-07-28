import HautevilleHouse.BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean.Beamforming

namespace HautevilleHouse
namespace BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean

structure ImageReconstructionPackage {U : UltrasoundWavePropagationPackage} {B : BeamformingPackage U} where
  envelopeDetection : Prop
  scanConversion : Prop
  logCompression : Prop
  speckleReduction : Prop
  resolutionEnhancement : Prop

structure ImageReconstructionEvidence {U : UltrasoundWavePropagationPackage} {B : BeamformingPackage U}
    (I : ImageReconstructionPackage U B) where
  envelopeDetectionClosed : I.envelopeDetection
  scanConversionClosed : I.scanConversion
  logCompressionClosed : I.logCompression
  speckleReductionClosed : I.speckleReduction
  resolutionEnhancementClosed : I.resolutionEnhancement

def ImageReconstructionClosed {U : UltrasoundWavePropagationPackage} {B : BeamformingPackage U}
    (I : ImageReconstructionPackage U B) : Prop :=
  I.envelopeDetection ∧ I.scanConversion ∧ I.logCompression ∧ I.speckleReduction ∧ I.resolutionEnhancement

theorem image_reconstruction_closed_from_evidence
    {U : UltrasoundWavePropagationPackage} {B : BeamformingPackage U}
    (I : ImageReconstructionPackage U B) (E : ImageReconstructionEvidence I) :
    ImageReconstructionClosed I := by
  exact And.intro E.envelopeDetectionClosed
    (And.intro E.scanConversionClosed
      (And.intro E.logCompressionClosed
        (And.intro E.speckleReductionClosed E.resolutionEnhancementClosed)))

end BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean
end HautevilleHouse