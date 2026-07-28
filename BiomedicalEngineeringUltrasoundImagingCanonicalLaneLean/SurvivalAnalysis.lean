import HautevilleHouse.BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean.UltrasoundAdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean

structure SurvivalAnalysisPackage where
  timeToEvent : Prop
  censoringModel : Prop
  hazardFunction : Prop
  survivalCurve : Prop
  prognosticFactors : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  timeToEventClosed : S.timeToEvent
  censoringModelClosed : S.censoringModel
  hazardFunctionClosed : S.hazardFunction
  survivalCurveClosed : S.survivalCurve
  prognosticFactorsClosed : S.prognosticFactors

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.timeToEvent ∧ S.censoringModel ∧ S.hazardFunction ∧ S.survivalCurve ∧ S.prognosticFactors

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage) (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S := by
  exact And.intro E.timeToEventClosed
    (And.intro E.censoringModelClosed
      (And.intro E.hazardFunctionClosed
        (And.intro E.survivalCurveClosed E.prognosticFactorsClosed)))

end BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean
end HautevilleHouse