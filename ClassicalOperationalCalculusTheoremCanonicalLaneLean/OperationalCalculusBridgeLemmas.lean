import canonicalLaneMathlib.AdmissibleClass
import ClassicalOperationalCalculusTheoremCanonicalLaneLean.ClassicalOperationalCalculusObject

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  OperationalCalculusWitnessClosed (A.object : AdmittedOperationalObject)

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse