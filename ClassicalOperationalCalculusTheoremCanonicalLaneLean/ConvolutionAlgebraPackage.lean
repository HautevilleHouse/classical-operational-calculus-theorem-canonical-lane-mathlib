import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

structure ConvolutionAlgebraPackage where
  algebraCarrier : Type u
  convolutionProduct : algebraCarrier → algebraCarrier → algebraCarrier
  identityElement : algebraCarrier
  associativity : Prop
  commutativity : Prop
  identityLaw : Prop

structure ConvolutionAlgebraEvidence (C : ConvolutionAlgebraPackage) where
  associativityClosed : C.associativity
  commutativityClosed : C.commutativity
  identityLawClosed : C.identityLaw

def ConvolutionAlgebraClosed (C : ConvolutionAlgebraPackage) : Prop :=
  C.associativity ∧ C.commutativity ∧ C.identityLaw

theorem convolution_algebra_closed_from_evidence (C : ConvolutionAlgebraPackage)
    (E : ConvolutionAlgebraEvidence C) : ConvolutionAlgebraClosed C := by
  exact And.intro E.associativityClosed
    (And.intro E.commutativityClosed E.identityLawClosed)

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse