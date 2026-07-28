import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace UltrasoundImagingCanonicalLaneLean

structure UltrasoundTransducer where
  centerFrequency : ℝ
  bandwidth : ℝ
  elementCount : ℕ
  apertureSize : ℝ
  focusingDepth : ℝ

def transducerResolution (t : UltrasoundTransducer) : ℝ :=
  t.centerFrequency / t.bandwidth

structure AcousticImpedance where
  density : ℝ
  speedOfSound : ℝ

def reflectionCoefficient (z1 z2 : AcousticImpedance) : ℝ :=
  (z2.density * z2.speedOfSound - z1.density * z1.speedOfSound) /
  (z2.density * z2.speedOfSound + z1.density * z1.speedOfSound)

structure AdmissibleClass where
  object : UltrasoundTransducer
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

end UltrasoundImagingCanonicalLaneLean
end HautevilleHouse