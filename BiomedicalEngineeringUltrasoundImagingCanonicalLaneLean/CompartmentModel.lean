import HautevilleHouse.BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean.UltrasoundAdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean

structure CompartmentModelPackage where
  compartments : Nat
  transferRates : Prop
  initialConditions : Prop
  compartmentEquations : Prop
  pharmacokineticParameters : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  compartmentsClosed : C.compartments = 2
  transferRatesClosed : C.transferRates
  initialConditionsClosed : C.initialConditions
  compartmentEquationsClosed : C.compartmentEquations
  pharmacokineticParametersClosed : C.pharmacokineticParameters

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.compartments = 2 ∧ C.transferRates ∧ C.initialConditions ∧ C.compartmentEquations ∧ C.pharmacokineticParameters

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage) (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.compartmentsClosed
    (And.intro E.transferRatesClosed
      (And.intro E.initialConditionsClosed
        (And.intro E.compartmentEquationsClosed E.pharmacokineticParametersClosed)))

end BiomedicalEngineeringUltrasoundImagingCanonicalLaneLean
end HautevilleHouse