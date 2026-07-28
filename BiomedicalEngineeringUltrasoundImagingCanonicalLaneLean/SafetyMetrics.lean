import HautevilleHouse.BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean.ImageReconstruction

namespace HautevilleHouse
namespace BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean

structure SafetyMetricsPackage {U : UltrasoundWavePropagationPackage} {B : BeamformingPackage U}
    {I : ImageReconstructionPackage U B} where
  mechanicalIndex : Prop
  thermalIndex : Prop
  intensityLimits : Prop
  cavitationModel : Prop
  regulatoryCompliance : Prop

structure SafetyMetricsEvidence {U : UltrasoundWavePropagationPackage} {B : BeamformingPackage U}
    {I : ImageReconstructionPackage U B} (S : SafetyMetricsPackage U B I) where
  mechanicalIndexClosed : S.mechanicalIndex
  thermalIndexClosed : S.thermalIndex
  intensityLimitsClosed : S.intensityLimits
  cavitationModelClosed : S.cavitationModel
  regulatoryComplianceClosed : S.regulatoryCompliance

def SafetyMetricsClosed {U : UltrasoundWavePropagationPackage} {B : BeamformingPackage U}
    {I : ImageReconstructionPackage U B} (S : SafetyMetricsPackage U B I) : Prop :=
  S.mechanicalIndex ∧ S.thermalIndex ∧ S.intensityLimits ∧ S.cavitationModel ∧ S.regulatoryCompliance

theorem safety_metrics_closed_from_evidence
    {U : UltrasoundWavePropagationPackage} {B : BeamformingPackage U}
    {I : ImageReconstructionPackage U B} (S : SafetyMetricsPackage U B I)
    (E : SafetyMetricsEvidence S) : SafetyMetricsClosed S := by
  exact And.intro E.mechanicalIndexClosed
    (And.intro E.thermalIndexClosed
      (And.intro E.intensityLimitsClosed
        (And.intro E.cavitationModelClosed E.regulatoryComplianceClosed)))

end BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean
end HautevilleHouse