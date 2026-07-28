import HautevilleHouse.BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean.ImageReconstructionPackage

namespace HautevilleHouse
namespace BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean

structure SpeckleStatisticsPackage {W : WavePropagationPackage} {B : BeamformingPackage W} {R : ImageReconstructionPackage} where
  speckleDistribution : Type u
  snr : Prop
  contrastResolution : Prop
  statisticalModelValid : Prop

structure SpeckleStatisticsEvidence {W : WavePropagationPackage} {B : BeamformingPackage W} {R : ImageReconstructionPackage} (S : SpeckleStatisticsPackage) where
  snrClosed : S.snr
  contrastResolutionClosed : S.contrastResolution
  statisticalModelValidClosed : S.statisticalModelValid

def SpeckleStatisticsClosed {W : WavePropagationPackage} {B : BeamformingPackage W} {R : ImageReconstructionPackage} (S : SpeckleStatisticsPackage) : Prop :=
  S.snr ∧ S.contrastResolution ∧ S.statisticalModelValid

theorem speckle_statistics_closed_from_evidence {W : WavePropagationPackage} {B : BeamformingPackage W} {R : ImageReconstructionPackage} (S : SpeckleStatisticsPackage) (E : SpeckleStatisticsEvidence S) : SpeckleStatisticsClosed S :=
  And.intro E.snrClosed (And.intro E.contrastResolutionClosed E.statisticalModelValidClosed)

end BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean
end HautevilleHouse