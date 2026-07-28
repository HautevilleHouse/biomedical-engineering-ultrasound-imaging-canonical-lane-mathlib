import HautevilleHouse.BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean.WavePropagationPackage

namespace HautevilleHouse
namespace BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean

structure BeamformingCertificate (P : WavePropagationPackage) where
  delayAndSum : Prop
  apodization : Prop
  dynamicFocusing : Prop
  adaptiveBeamforming : Prop
  delayAndSumClosed : delayAndSum
  apodizationClosed : apodization
  dynamicFocusingClosed : dynamicFocusing
  adaptiveBeamformingClosed : adaptiveBeamforming
  wavePropagationEvidence : WavePropagationEvidence P

def BeamformingCertificateClosed {P : WavePropagationPackage} (C : BeamformingCertificate P) : Prop :=
  C.delayAndSum ∧ C.apodization ∧ C.dynamicFocusing ∧ C.adaptiveBeamforming ∧ WavePropagationClosed P

theorem beamforming_certificate_closed {P : WavePropagationPackage} (C : BeamformingCertificate P) : BeamformingCertificateClosed C := by
  exact And.intro C.delayAndSumClosed
    (And.intro C.apodizationClosed
      (And.intro C.dynamicFocusingClosed
        (And.intro C.adaptiveBeamformingClosed
          (wave_propagation_closed_from_evidence P C.wavePropagationEvidence))))

structure BeamformingEvidenceTerms {P : WavePropagationPackage} (C : BeamformingCertificate P) where
  delayAndSumEvidence : C.delayAndSum
  apodizationEvidence : C.apodization
  dynamicFocusingEvidence : C.dynamicFocusing
  adaptiveBeamformingEvidence : C.adaptiveBeamforming
  beamformingClosed : BeamformingCertificateClosed C

def BeamformingCertificate.evidenceTerms {P : WavePropagationPackage} (C : BeamformingCertificate P) : BeamformingEvidenceTerms C :=
  { delayAndSumEvidence := C.delayAndSumClosed,
    apodizationEvidence := C.apodizationClosed,
    dynamicFocusingEvidence := C.dynamicFocusingClosed,
    adaptiveBeamformingEvidence := C.adaptiveBeamformingClosed,
    beamformingClosed := beamforming_certificate_closed C
  }

end BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean
end HautevilleHouse