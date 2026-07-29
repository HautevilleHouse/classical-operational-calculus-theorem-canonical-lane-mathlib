import HautevilleHouse.ClassicalOperationalCalculusTheoremCanonicalLaneLean.OperationalCalculusDomain

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

structure LaplaceTransformPackage (D : OperationalCalculusDomain) where
  sDomain : Type u
  regionOfConvergence : Prop
  analyticOnHalfPlane : Prop
  inversionFormula : Prop
  uniquenessTheorem : Prop

structure LaplaceTransformEvidence {D : OperationalCalculusDomain}
    (L : LaplaceTransformPackage D) where
  regionOfConvergenceClosed : L.regionOfConvergence
  analyticOnHalfPlaneClosed : L.analyticOnHalfPlane
  inversionFormulaClosed : L.inversionFormula
  uniquenessTheoremClosed : L.uniquenessTheorem

def LaplaceTransformClosed {D : OperationalCalculusDomain}
    (L : LaplaceTransformPackage D) : Prop :=
  L.regionOfConvergence ∧ L.analyticOnHalfPlane ∧
  L.inversionFormula ∧ L.uniquenessTheorem

theorem laplace_transform_closed_from_evidence
    {D : OperationalCalculusDomain} (L : LaplaceTransformPackage D)
    (E : LaplaceTransformEvidence L) : LaplaceTransformClosed L := by
  exact And.intro E.regionOfConvergenceClosed
    (And.intro E.analyticOnHalfPlaneClosed
      (And.intro E.inversionFormulaClosed E.uniquenessTheoremClosed))

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse