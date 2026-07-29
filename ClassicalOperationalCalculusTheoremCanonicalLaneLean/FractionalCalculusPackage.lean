import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

structure FractionalCalculusPackage where
  fractionalOrder : ℝ
  fractionalIntegralDefined : Prop
  fractionalDerivativeDefined : Prop
  semigroupProperty : Prop
  compositionRule : Prop

structure FractionalCalculusEvidence (F : FractionalCalculusPackage) where
  fractionalIntegralDefinedClosed : F.fractionalIntegralDefined
  fractionalDerivativeDefinedClosed : F.fractionalDerivativeDefined
  semigroupPropertyClosed : F.semigroupProperty
  compositionRuleClosed : F.compositionRule

def FractionalCalculusClosed (F : FractionalCalculusPackage) : Prop :=
  F.fractionalIntegralDefined ∧ F.fractionalDerivativeDefined ∧
  F.semigroupProperty ∧ F.compositionRule

theorem fractional_calculus_closed_from_evidence (F : FractionalCalculusPackage)
    (E : FractionalCalculusEvidence F) : FractionalCalculusClosed F := by
  exact And.intro E.fractionalIntegralDefinedClosed
    (And.intro E.fractionalDerivativeDefinedClosed
      (And.intro E.semigroupPropertyClosed E.compositionRuleClosed))

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse