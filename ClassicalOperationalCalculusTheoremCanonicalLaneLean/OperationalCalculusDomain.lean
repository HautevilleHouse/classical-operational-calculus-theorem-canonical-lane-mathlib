import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

structure OperationalCalculusDomain where
  baseSpace : Type u
  topology : TopologicalSpace baseSpace
  measure : Type v
  derivation : Type w
  operatorAlgebra : Type x
  spectralMeasure : Type y
  banachAlgebra : Prop
  derivationClosed : Prop
  spectralMeasureClosed : Prop

structure OperationalCalculusDomainEvidence (D : OperationalCalculusDomain) where
  banachAlgebraClosed : D.banachAlgebra
  derivationClosed : D.derivationClosed
  spectralMeasureClosed : D.spectralMeasureClosed

def OperationalCalculusDomainClosed (D : OperationalCalculusDomain) : Prop :=
  D.banachAlgebra ∧ D.derivationClosed ∧ D.spectralMeasureClosed

theorem operational_calculus_domain_closed_from_evidence
    (D : OperationalCalculusDomain) (E : OperationalCalculusDomainEvidence D) :
    OperationalCalculusDomainClosed D := by
  exact And.intro E.banachAlgebraClosed (And.intro E.derivationClosed E.spectralMeasureClosed)

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse
