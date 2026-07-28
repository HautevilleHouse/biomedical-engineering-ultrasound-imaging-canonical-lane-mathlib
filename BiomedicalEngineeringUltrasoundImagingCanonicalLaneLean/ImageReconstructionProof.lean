import HautevilleHouse.BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean.BeamformingEvidenceTerms

namespace HautevilleHouse
namespace BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean

structure ImageReconstructionCertificate {P : WavePropagationPackage} (B : BeamformingCertificate P) where
  signalProcessing : Prop
  envelopeDetection : Prop
  logCompression : Prop
  scanConversion : Prop
  signalProcessingClosed : signalProcessing
  envelopeDetectionClosed : envelopeDetection
  logCompressionClosed : logCompression
  scanConversionClosed : scanConversion
  beamformingEvidence : BeamformingEvidenceTerms B

def ImageReconstructionCertificateClosed {P : WavePropagationPackage} {B : BeamformingCertificate P} (R : ImageReconstructionCertificate B) : Prop :=
  R.signalProcessing ∧ R.envelopeDetection ∧ R.logCompression ∧ R.scanConversion ∧ BeamformingCertificateClosed B

theorem image_reconstruction_certificate_closed {P : WavePropagationPackage} {B : BeamformingCertificate P} (R : ImageReconstructionCertificate B) : ImageReconstructionCertificateClosed R := by
  exact And.intro R.signalProcessingClosed
    (And.intro R.envelopeDetectionClosed
      (And.intro R.logCompressionClosed
        (And.intro R.scanConversionClosed R.beamformingEvidence.beamformingClosed)))

end BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean
end HautevilleHouse