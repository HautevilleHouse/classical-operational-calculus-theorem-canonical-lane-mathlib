import canonicalLaneMathlib.AdmissibleClass
import ClassicalOperationalCalculusTheoremCanonicalLaneLean.OperationalCalculusAlgebra

/-!
# Convolution Theorem
This module formalizes the convolution theorem for the operational calculus,
stating that the operational transform of a convolution is the product of the
individual transforms.
-/

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

structure ConvolutionTheoremPackage (A : OperationalAlgebra) where
  transform : A.carrier → A.carrier
  convolutionProduct : A.carrier → A.carrier → A.carrier
  transformOfConvolution : ∀ f g : A.carrier, transform (A.convolution f g) = convolutionProduct (transform f) (transform g)
  convolutionProductAssoc : ∀ a b c : A.carrier, convolutionProduct (convolutionProduct a b) c = convolutionProduct a (convolutionProduct b c)
  convolutionProductComm : ∀ a b : A.carrier, convolutionProduct a b = convolutionProduct b a

def ConvolutionTheoremClosed (A : OperationalAlgebra) (C : ConvolutionTheoremPackage A) : Prop :=
  (∀ f g : A.carrier, C.transformOfConvolution f g) ∧
  (∀ a b c : A.carrier, C.convolutionProductAssoc a b c) ∧
  (∀ a b : A.carrier, C.convolutionProductComm a b)

theorem convolution_theorem_closed (A : OperationalAlgebra) (C : ConvolutionTheoremPackage A) :
    ConvolutionTheoremClosed A C := by
  exact And.intro C.transformOfConvolution (And.intro (fun a b c => C.convolutionProductAssoc a b c) (fun a b => C.convolutionProductComm a b))

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse