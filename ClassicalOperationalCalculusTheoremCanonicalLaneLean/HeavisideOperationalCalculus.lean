import HautevilleHouse.ClassicalOperationalCalculusTheoremCanonicalLaneLean.ConvolutionAlgebra
import HautevilleHouse.ClassicalOperationalCalculusTheoremCanonicalLaneLean.BromwichIntegral

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

structure HeavisideOperationalCalculusPackage {D : OperationalCalculusDomain}
    {L : LaplaceTransformPackage D} {B : BromwichIntegralPackage L}
    {C : ConvolutionAlgebraPackage D} where
  differentialOperatorMapping : Prop
  algebraicSolutionMethod : Prop
  partialFractionDecomposition : Prop
  shiftTheorem : Prop

structure HeavisideOperationalCalculusEvidence {D : OperationalCalculusDomain}
    {L : LaplaceTransformPackage D} {B : BromwichIntegralPackage L}
    {C : ConvolutionAlgebraPackage D}
    (H : HeavisideOperationalCalculusPackage L B C) where
  differentialOperatorMappingClosed : H.differentialOperatorMapping
  algebraicSolutionMethodClosed : H.algebraicSolutionMethod
  partialFractionDecompositionClosed : H.partialFractionDecomposition
  shiftTheoremClosed : H.shiftTheorem

def HeavisideOperationalCalculusClosed {D : OperationalCalculusDomain}
    {L : LaplaceTransformPackage D} {B : BromwichIntegralPackage L}
    {C : ConvolutionAlgebraPackage D}
    (H : HeavisideOperationalCalculusPackage L B C) : Prop :=
  H.differentialOperatorMapping ∧ H.algebraicSolutionMethod ∧
  H.partialFractionDecomposition ∧ H.shiftTheorem

theorem heaviside_operational_calculus_closed_from_evidence
    {D : OperationalCalculusDomain} {L : LaplaceTransformPackage D}
    {B : BromwichIntegralPackage L} {C : ConvolutionAlgebraPackage D}
    (H : HeavisideOperationalCalculusPackage L B C)
    (E : HeavisideOperationalCalculusEvidence H) :
    HeavisideOperationalCalculusClosed H := by
  exact And.intro E.differentialOperatorMappingClosed
    (And.intro E.algebraicSolutionMethodClosed
      (And.intro E.partialFractionDecompositionClosed E.shiftTheoremClosed))

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse