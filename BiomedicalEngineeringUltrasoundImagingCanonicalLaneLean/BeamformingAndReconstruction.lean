import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean

structure BeamformingPackage where
  arrayGeometry : Type
  focusingDelays : Type
  apodizationWeights : Type
  delayAndSumValid : Prop
  beamformingResolution : Prop

structure BeamformingEvidence (B : BeamformingPackage) where
  delayAndSumValidClosed : B.delayAndSumValid
  beamformingResolutionClosed : B.beamformingResolution

def BeamformingClosed (B : BeamformingPackage) : Prop :=
  B.delayAndSumValid ∧ B.beamformingResolution

theorem beamforming_closed_from_evidence
    (B : BeamformingPackage) (E : BeamformingEvidence B) :
    BeamformingClosed B := by
  exact And.intro E.delayAndSumValidClosed E.beamformingResolutionClosed

structure ReconstructionPackage (B : BeamformingPackage) where
  envelopeDetection : Prop
  logCompression : Prop
  scanConversion : Prop
  bModeImageFormed : Prop

structure ReconstructionEvidence {B : BeamformingPackage} (R : ReconstructionPackage B) where
  envelopeDetectionClosed : R.envelopeDetection
  logCompressionClosed : R.logCompression
  scanConversionClosed : R.scanConversion
  bModeImageFormedClosed : R.bModeImageFormed

def ReconstructionClosed {B : BeamformingPackage} (R : ReconstructionPackage B) : Prop :=
  R.envelopeDetection ∧ R.logCompression ∧ R.scanConversion ∧ R.bModeImageFormed

theorem reconstruction_closed_from_evidence
    {B : BeamformingPackage} (R : ReconstructionPackage B) (E : ReconstructionEvidence R) :
    ReconstructionClosed R := by
  exact And.intro E.envelopeDetectionClosed
    (And.intro E.logCompressionClosed
      (And.intro E.scanConversionClosed E.bModeImageFormedClosed))

end BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean
end HautevilleHouse