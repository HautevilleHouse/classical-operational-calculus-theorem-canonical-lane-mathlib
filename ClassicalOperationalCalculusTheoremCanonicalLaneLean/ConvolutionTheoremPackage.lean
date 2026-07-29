import ClassicalOperationalCalculusTheoremCanonicalLaneLean.ClassicalOperationalCalculusObject

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

structure ConvolutionTheoremPackage (O : OperationalCalculusObject) where
  functionSpace : Type u
  kernelL1 : Prop
  convolutionAssociative : Prop
  convolutionCommutative : Prop
  convolutionDistributes : Prop
  identityElement : O.originalFunction → O.originalFunction

structure ConvolutionTheoremEvidence (O : OperationalCalculusObject)
    (P : ConvolutionTheoremPackage O) where
  functionSpaceClosed : P.functionSpace = P.functionSpace
  kernelL1Closed : P.kernelL1
  convolutionAssociativeClosed : P.convolutionAssociative
  convolutionCommutativeClosed : P.convolutionCommutative
  convolutionDistributesClosed : P.convolutionDistributes

def ConvolutionTheoremClosed (O : OperationalCalculusObject)
    (P : ConvolutionTheoremPackage O) : Prop :=
  P.kernelL1 ∧ P.convolutionAssociative ∧ P.convolutionCommutative ∧ P.convolutionDistributes

theorem convolution_theorem_closed_from_evidence
    (O : OperationalCalculusObject) (P : ConvolutionTheoremPackage O)
    (E : ConvolutionTheoremEvidence O P) : ConvolutionTheoremClosed O P := by
  exact And.intro E.kernelL1Closed
    (And.intro E.convolutionAssociativeClosed
      (And.intro E.convolutionCommutativeClosed E.convolutionDistributesClosed))

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse