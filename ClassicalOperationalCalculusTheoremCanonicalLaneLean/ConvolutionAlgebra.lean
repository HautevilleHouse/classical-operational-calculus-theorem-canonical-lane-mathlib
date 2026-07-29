import HautevilleHouse.ClassicalOperationalCalculusTheoremCanonicalLaneLean.OperationalCalculusDomain

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

structure ConvolutionAlgebraPackage (D : OperationalCalculusDomain) where
  convolutionProduct : Type u
  identityElement : Prop
  associativity : Prop
  commutativityUnderConditions : Prop
  closureUnderTransform : Prop

structure ConvolutionAlgebraEvidence {D : OperationalCalculusDomain}
    (C : ConvolutionAlgebraPackage D) where
  identityElementClosed : C.identityElement
  associativityClosed : C.associativity
  commutativityUnderConditionsClosed : C.commutativityUnderConditions
  closureUnderTransformClosed : C.closureUnderTransform

def ConvolutionAlgebraClosed {D : OperationalCalculusDomain}
    (C : ConvolutionAlgebraPackage D) : Prop :=
  C.identityElement ∧ C.associativity ∧
  C.commutativityUnderConditions ∧ C.closureUnderTransform

theorem convolution_algebra_closed_from_evidence
    {D : OperationalCalculusDomain} (C : ConvolutionAlgebraPackage D)
    (E : ConvolutionAlgebraEvidence C) : ConvolutionAlgebraClosed C := by
  exact And.intro E.identityElementClosed
    (And.intro E.associativityClosed
      (And.intro E.commutativityUnderConditionsClosed E.closureUnderTransformClosed))

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse