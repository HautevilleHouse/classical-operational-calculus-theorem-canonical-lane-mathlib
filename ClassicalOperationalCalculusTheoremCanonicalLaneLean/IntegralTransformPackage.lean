import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

structure IntegralTransformPackage where
  kernelFunction : String
  transformDomain : Type u
  transformCodomain : Type v
  inversionFormula : Prop
  analyticContinuation : Prop
  boundednessProperty : Prop

structure IntegralTransformEvidence (I : IntegralTransformPackage) where
  inversionFormulaClosed : I.inversionFormula
  analyticContinuationClosed : I.analyticContinuation
  boundednessPropertyClosed : I.boundednessProperty

def IntegralTransformClosed (I : IntegralTransformPackage) : Prop :=
  I.inversionFormula ∧ I.analyticContinuation ∧ I.boundednessProperty

theorem integral_transform_closed_from_evidence (I : IntegralTransformPackage)
    (E : IntegralTransformEvidence I) : IntegralTransformClosed I := by
  exact And.intro E.inversionFormulaClosed
    (And.intro E.analyticContinuationClosed E.boundednessPropertyClosed)

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse