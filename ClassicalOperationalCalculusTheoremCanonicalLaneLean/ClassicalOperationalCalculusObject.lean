import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

structure OperationalCalculusObject where
  originalFunction : Type u → Type v
  transformedFunction : Type u → Type v
  kernel : Type w → Type u → Type v
  convolutionProduct : Type u → Type v
  integralTransform : Type u → Type v

structure AdmittedOperationalObject where
  obj : OperationalCalculusObject
  convergenceCondition : Prop
  inversionFormulaHolds : Prop
  convolutionTheoremHolds : Prop
  conclusion : convergenceCondition ∧ inversionFormulaHolds ∧ convolutionTheoremHolds

def OperationalCalculusWitnessClosed (O : AdmittedOperationalObject) : Prop :=
  O.convergenceCondition ∧ O.inversionFormulaHolds ∧ O.convolutionTheoremHolds

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse