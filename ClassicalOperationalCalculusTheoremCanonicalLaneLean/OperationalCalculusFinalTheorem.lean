import canonicalLaneMathlib.AdmissibleClass
import ClassicalOperationalCalculusTheoremCanonicalLaneLean.OperationalCalculusBridgeLemmas

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

def ConstrainedOperationalCalculusClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_operational_calculus_endgame (A : AdmissibleClass) :
    ConstrainedOperationalCalculusClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse