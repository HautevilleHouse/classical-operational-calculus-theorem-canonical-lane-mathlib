import ClassicalOperationalCalculusTheoremCanonicalLaneLean.OperationalCalculusGateLemmas

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

def ConstrainedOperationalClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_operational_endgame (A : AdmissibleClass) :
    ConstrainedOperationalClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse