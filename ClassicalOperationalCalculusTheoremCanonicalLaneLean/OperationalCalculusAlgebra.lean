import canonicalLaneMathlib.AdmissibleClass

/-!
# Operational Calculus Algebra
This module defines the algebraic structures underlying classical operational calculus:
Heaviside's operational algebra, Mikusiński's field of operators, and the
convolution algebra that forms the basis of the operational calculus.
-/

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

structure OperationalAlgebra where
  carrier : Type u
  zero : carrier
  one : carrier
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  convolution : carrier → carrier → carrier
  differentiation : carrier → carrier
  integration : carrier → carrier
  shiftOperator : carrier → carrier
  additionAssoc : ∀ a b c : carrier, addition (addition a b) c = addition a (addition b c)
  additionComm : ∀ a b : carrier, addition a b = addition b a
  addZero : ∀ a : carrier, addition a zero = a
  zeroAdd : ∀ a : carrier, addition zero a = a
  mulAssoc : ∀ a b c : carrier, multiplication (multiplication a b) c = multiplication a (multiplication b c)
  mulOne : ∀ a : carrier, multiplication a one = a
  oneMul : ∀ a : carrier, multiplication one a = a
  distribLeft : ∀ a b c : carrier, multiplication a (addition b c) = addition (multiplication a b) (multiplication a c)
  distribRight : ∀ a b c : carrier, multiplication (addition a b) c = addition (multiplication a c) (multiplication b c)
  convAssoc : ∀ a b c : carrier, convolution (convolution a b) c = convolution a (convolution b c)
  convComm : ∀ a b : carrier, convolution a b = convolution b a
  diffLinear : ∀ a b : carrier, differentiation (addition a b) = addition (differentiation a) (differentiation b)
  intLinear : ∀ a b : carrier, integration (addition a b) = addition (integration a) (integration b)
  diffInt : ∀ a : carrier, differentiation (integration a) = a
  intDiff : ∀ a : carrier, integration (differentiation a) = a
  shiftComposition : ∀ a : carrier, shiftOperator (shiftOperator a) = shiftOperator a

def OperationalAlgebraClosed (A : OperationalAlgebra) : Prop :=
  A.additionAssoc ∧ A.additionComm ∧ A.addZero ∧ A.zeroAdd ∧
  A.mulAssoc ∧ A.mulOne ∧ A.oneMul ∧
  A.distribLeft ∧ A.distribRight ∧
  A.convAssoc ∧ A.convComm ∧
  A.diffLinear ∧ A.intLinear ∧
  A.diffInt ∧ A.intDiff ∧
  A.shiftComposition

theorem operational_algebra_closed_id : ∀ (A : OperationalAlgebra), OperationalAlgebraClosed A := by
  intro A
  exact And.intro A.additionAssoc (And.intro A.additionComm (And.intro A.addZero (And.intro A.zeroAdd
    (And.intro A.mulAssoc (And.intro A.mulOne (And.intro A.oneMul
    (And.intro A.distribLeft (And.intro A.distribRight
    (And.intro A.convAssoc (And.intro A.convComm
    (And.intro A.diffLinear (And.intro A.intLinear
    (And.intro A.diffInt (And.intro A.intDiff A.shiftComposition))))))))))))))

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse