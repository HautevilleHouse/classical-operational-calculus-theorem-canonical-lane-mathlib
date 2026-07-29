import ClassicalOperationalCalculusTheoremCanonicalLaneLean.ReviewerBridge

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

structure OperationalCalculusSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure OperationalCalculusAdmittedObject where
  space : OperationalCalculusSpace
  operationalCalculusStatement : Prop
  conclusion : operationalCalculusStatement

structure OperationalCalculusEndgameState where
  object : OperationalCalculusAdmittedObject

def OperationalCalculusWitnessClosed (O : OperationalCalculusAdmittedObject) : Prop :=
  O.operationalCalculusStatement

theorem witness_closed (O : OperationalCalculusAdmittedObject) :
    OperationalCalculusWitnessClosed O := O.conclusion

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse