import canonicalLaneMathlib.AdmissibleClass
import ClassicalOperationalCalculusTheoremCanonicalLaneLean.OperationalCalculusAlgebra

/-!
# Mikusiński's Field of Operators
This module defines Mikusiński's field of operators as an extension of the
operational algebra with a multiplicative inverse for the integration operator,
leading to a field structure.
-/

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

structure MikusinskiField (A : OperationalAlgebra) where
  integrationInverse : A.carrier → A.carrier
  fieldMultiplication : A.carrier → A.carrier → A.carrier
  fieldAddition : A.carrier → A.carrier → A.carrier
  fieldZero : A.carrier
  fieldOne : A.carrier
  invIsInverse : ∀ a : A.carrier, fieldMultiplication (integrationInverse a) (A.integration a) = fieldOne
  fieldAssoc : ∀ a b c : A.carrier, fieldMultiplication (fieldMultiplication a b) c = fieldMultiplication a (fieldMultiplication b c)
  fieldComm : ∀ a b : A.carrier, fieldMultiplication a b = fieldMultiplication b a
  fieldDistrib : ∀ a b c : A.carrier, fieldMultiplication a (fieldAddition b c) = fieldAddition (fieldMultiplication a b) (fieldMultiplication a c)
  fieldInv : ∀ a : A.carrier, a ≠ fieldZero → ∃ b : A.carrier, fieldMultiplication a b = fieldOne

def MikusinskiFieldClosed (A : OperationalAlgebra) (M : MikusinskiField A) : Prop :=
  M.invIsInverse ∧ M.fieldAssoc ∧ M.fieldComm ∧ M.fieldDistrib ∧ M.fieldInv

theorem mikusinski_field_closed_from_proof (A : OperationalAlgebra) (M : MikusinskiField A) :
    MikusinskiFieldClosed A M := by
  exact And.intro M.invIsInverse (And.intro M.fieldAssoc (And.intro M.fieldComm (And.intro M.fieldDistrib M.fieldInv)))

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse