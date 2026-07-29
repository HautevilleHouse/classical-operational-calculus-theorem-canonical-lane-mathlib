import canonicalLaneMathlib.AdmissibleClass
import ClassicalOperationalCalculusTheoremCanonicalLaneLean.OperationalCalculusDomain

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

structure FunctionalCalculusConstruction {D : OperationalCalculusDomain}
    (F : OperationalCalculusDomainClosed D) where
  holomorphicFunctionalCalculus : Prop
  boundedBorelFunctionalCalculus : Prop
  spectralMappingTheorem : Prop
  compositionRule : Prop
  holomorphicFunctionalCalculusClosed : holomorphicFunctionalCalculus
  boundedBorelFunctionalCalculusClosed : boundedBorelFunctionalCalculus
  spectralMappingTheoremClosed : spectralMappingTheorem
  compositionRuleClosed : compositionRule

structure FunctionalCalculusEvidence {D : OperationalCalculusDomain}
    {F : OperationalCalculusDomainClosed D}
    (C : FunctionalCalculusConstruction F) where
  holomorphicFunctionalCalculusClosed : C.holomorphicFunctionalCalculus
  boundedBorelFunctionalCalculusClosed : C.boundedBorelFunctionalCalculus
  spectralMappingTheoremClosed : C.spectralMappingTheorem
  compositionRuleClosed : C.compositionRule

def FunctionalCalculusClosed {D : OperationalCalculusDomain}
    {F : OperationalCalculusDomainClosed D}
    (C : FunctionalCalculusConstruction F) : Prop :=
  C.holomorphicFunctionalCalculus ∧ C.boundedBorelFunctionalCalculus ∧
  C.spectralMappingTheorem ∧ C.compositionRule

theorem functional_calculus_closed_from_evidence
    {D : OperationalCalculusDomain} {F : OperationalCalculusDomainClosed D}
    (C : FunctionalCalculusConstruction F) (E : FunctionalCalculusEvidence C) :
    FunctionalCalculusClosed C := by
  exact And.intro E.holomorphicFunctionalCalculusClosed
    (And.intro E.boundedBorelFunctionalCalculusClosed
      (And.intro E.spectralMappingTheoremClosed E.compositionRuleClosed))

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse
