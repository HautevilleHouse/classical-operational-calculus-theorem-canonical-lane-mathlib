import canonicalLaneMathlib.AdmissibleClass
import ClassicalOperationalCalculusTheoremCanonicalLaneLean.FunctionalCalculusConstruction

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

structure OperationalCalculusClosurePackage {D : OperationalCalculusDomain}
    {F : OperationalCalculusDomainClosed D}
    (C : FunctionalCalculusConstruction F) where
  bridgeClosed : Prop
  gateClosed : Prop
  bridgeClosedTerm : bridgeClosed
  gateClosedTerm : gateClosed

structure OperationalCalculusClosureEvidence {D : OperationalCalculusDomain}
    {F : OperationalCalculusDomainClosed D}
    {C : FunctionalCalculusConstruction F}
    (P : OperationalCalculusClosurePackage C) where
  bridgeClosedClosed : P.bridgeClosed
  gateClosedClosed : P.gateClosed

def OperationalCalculusClosureClosed {D : OperationalCalculusDomain}
    {F : OperationalCalculusDomainClosed D}
    {C : FunctionalCalculusConstruction F}
    (P : OperationalCalculusClosurePackage C) : Prop :=
  P.bridgeClosed ∧ P.gateClosed

theorem operational_calculus_closure_closed_from_evidence
    {D : OperationalCalculusDomain} {F : OperationalCalculusDomainClosed D}
    {C : FunctionalCalculusConstruction F}
    (P : OperationalCalculusClosurePackage C) (E : OperationalCalculusClosureEvidence P) :
    OperationalCalculusClosureClosed P := by
  exact And.intro E.bridgeClosedClosed E.gateClosedClosed

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse
