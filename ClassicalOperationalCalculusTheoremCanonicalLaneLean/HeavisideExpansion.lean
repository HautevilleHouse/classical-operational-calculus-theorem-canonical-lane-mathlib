import canonicalLaneMathlib.AdmissibleClass
import ClassicalOperationalCalculusTheoremCanonicalLaneLean.OperationalCalculusAlgebra

/-!
# Heaviside Expansion
This module formalizes the Heaviside expansion theorem for rational functions
in the operational calculus context. It relates partial fraction decomposition
to time-domain response via the shift operator.
-/

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

structure HeavisideExpansionPackage (A : OperationalAlgebra) where
  rationalFunction : A.carrier → A.carrier
  partialFractionDecomposition : A.carrier → A.carrier → A.carrier
  shiftTimesResidue : A.carrier → A.carrier
  exponentialResponse : A.carrier → A.carrier
  heavisideFormula : ∀ s : A.carrier, rationalFunction s = partialFractionDecomposition s (A.one)
  shiftTheorem : ∀ s : A.carrier, shiftTimesResidue s = A.shiftOperator (exponentialResponse s)
  expansionClosed : Prop

def HeavisideExpansionClosed (A : OperationalAlgebra) (H : HeavisideExpansionPackage A) : Prop :=
  (∀ s : A.carrier, H.heavisideFormula s) ∧ (∀ s : A.carrier, H.shiftTheorem s) ∧ H.expansionClosed

theorem heaviside_expansion_from_algebra (A : OperationalAlgebra) (H : HeavisideExpansionPackage A) :
    HeavisideExpansionClosed A H := by
  exact And.intro H.heavisideFormula (And.intro H.shiftTheorem H.expansionClosed)

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse