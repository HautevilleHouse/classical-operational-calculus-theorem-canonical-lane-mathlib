import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

structure InversionFormulaPackage where
  bromwichIntegral : Prop
  contourChoice : Prop
  convergenceCondition : Prop
  uniqueness : Prop

structure InversionFormulaEvidence (I : InversionFormulaPackage) where
  bromwichIntegralClosed : I.bromwichIntegral
  contourChoiceClosed : I.contourChoice
  convergenceConditionClosed : I.convergenceCondition
  uniquenessClosed : I.uniqueness

def InversionFormulaClosed (I : InversionFormulaPackage) : Prop :=
  I.bromwichIntegral ∧ I.contourChoice ∧ I.convergenceCondition ∧ I.uniqueness

theorem inversion_formula_closed_from_evidence (I : InversionFormulaPackage)
    (E : InversionFormulaEvidence I) : InversionFormulaClosed I := by
  exact And.intro E.bromwichIntegralClosed
    (And.intro E.contourChoiceClosed
      (And.intro E.convergenceConditionClosed E.uniquenessClosed))

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse