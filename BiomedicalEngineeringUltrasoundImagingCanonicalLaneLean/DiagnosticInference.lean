import HautevilleHouse.BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean.UltrasoundAdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean

structure DiagnosticInferencePackage where
  featureExtraction : Prop
  classifierModel : Prop
  sensitivity : Prop
  specificity : Prop
  diagnosticAccuracy : Prop

structure DiagnosticInferenceEvidence (D : DiagnosticInferencePackage) where
  featureExtractionClosed : D.featureExtraction
  classifierModelClosed : D.classifierModel
  sensitivityClosed : D.sensitivity
  specificityClosed : D.specificity
  diagnosticAccuracyClosed : D.diagnosticAccuracy

def DiagnosticInferenceClosed (D : DiagnosticInferencePackage) : Prop :=
  D.featureExtraction ∧ D.classifierModel ∧ D.sensitivity ∧ D.specificity ∧ D.diagnosticAccuracy

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticInferencePackage) (E : DiagnosticInferenceEvidence D) : DiagnosticInferenceClosed D := by
  exact And.intro E.featureExtractionClosed
    (And.intro E.classifierModelClosed
      (And.intro E.sensitivityClosed
        (And.intro E.specificityClosed E.diagnosticAccuracyClosed)))

end BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean
end HautevilleHouse