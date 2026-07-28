import HautevilleHouse.BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean.BeamformingPackage

namespace HautevilleHouse
namespace BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean

structure ImageReconstructionPackage {W : WavePropagationPackage} {B : BeamformingPackage W} where
  envelopeDetection : Type u
  logCompression : Type v
  scanConversion : Type w
  bmodeImage : Type x
  envelopeCorrect : Prop
  compressionDynamicRange : Prop
  spatialConsistency : Prop

structure ImageReconstructionEvidence {W : WavePropagationPackage} {B : BeamformingPackage W} (R : ImageReconstructionPackage) where
  envelopeCorrectClosed : R.envelopeCorrect
  compressionDynamicRangeClosed : R.compressionDynamicRange
  spatialConsistencyClosed : R.spatialConsistency

def ImageReconstructionClosed {W : WavePropagationPackage} {B : BeamformingPackage W} (R : ImageReconstructionPackage) : Prop :=
  R.envelopeCorrect ∧ R.compressionDynamicRange ∧ R.spatialConsistency

theorem image_reconstruction_closed_from_evidence {W : WavePropagationPackage} {B : BeamformingPackage W} (R : ImageReconstructionPackage) (E : ImageReconstructionEvidence R) : ImageReconstructionClosed R :=
  And.intro E.envelopeCorrectClosed (And.intro E.compressionDynamicRangeClosed E.spatialConsistencyClosed)

end BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean
end HautevilleHouse