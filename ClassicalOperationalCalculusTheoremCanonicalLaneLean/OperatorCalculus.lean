import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

structure OperatorCalculusPackage where
  operatorDomain : Type u
  operatorRange : Type v
  compositionRule : Prop
  shiftRule : Prop
  scaleRule : Prop

structure OperatorCalculusEvidence (O : OperatorCalculusPackage) where
  compositionRuleClosed : O.compositionRule
  shiftRuleClosed : O.shiftRule
  scaleRuleClosed : O.scaleRule

def OperatorCalculusClosed (O : OperatorCalculusPackage) : Prop :=
  O.compositionRule ∧ O.shiftRule ∧ O.scaleRule

theorem operator_calculus_closed_from_evidence (O : OperatorCalculusPackage)
    (E : OperatorCalculusEvidence O) : OperatorCalculusClosed O := by
  exact And.intro E.compositionRuleClosed (And.intro E.shiftRuleClosed E.scaleRuleClosed)

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse