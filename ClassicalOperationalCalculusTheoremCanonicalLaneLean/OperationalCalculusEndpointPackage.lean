import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.SpecialFunctions.Gamma

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

structure OperationalCalculusEndpointPackage where
  targetSpace : Type u
  targetTopology : TopologicalSpace targetSpace
  integralTransformClosure : Prop
  convolutionAlgebraClosure : Prop
  fractionalCalculusClosure : Prop
  endpointMatch : Prop

structure OperationalCalculusEndpointEvidence (E : OperationalCalculusEndpointPackage) where
  integralTransformClosureClosed : E.integralTransformClosure
  convolutionAlgebraClosureClosed : E.convolutionAlgebraClosure
  fractionalCalculusClosureClosed : E.fractionalCalculusClosure
  endpointMatchClosed : E.endpointMatch

def OperationalCalculusEndpointClosed (E : OperationalCalculusEndpointPackage) : Prop :=
  E.integralTransformClosure ∧ E.convolutionAlgebraClosure ∧
  E.fractionalCalculusClosure ∧ E.endpointMatch

theorem operational_calculus_endpoint_closed_from_evidence
    (E : OperationalCalculusEndpointPackage)
    (Ev : OperationalCalculusEndpointEvidence E) : OperationalCalculusEndpointClosed E := by
  exact And.intro Ev.integralTransformClosureClosed
    (And.intro Ev.convolutionAlgebraClosureClosed
      (And.intro Ev.fractionalCalculusClosureClosed Ev.endpointMatchClosed))

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse