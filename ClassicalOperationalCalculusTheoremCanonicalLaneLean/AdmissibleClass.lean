import ClassicalOperationalCalculusTheoremCanonicalLaneLean.TheoremStatement

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : OperationalCalculusAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  OperationalCalculusWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse