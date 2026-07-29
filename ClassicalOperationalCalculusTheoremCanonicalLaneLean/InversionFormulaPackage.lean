import ClassicalOperationalCalculusTheoremCanonicalLaneLean.ConvolutionTheoremPackage

namespace HautevilleHouse
namespace ClassicalOperationalCalculusTheoremCanonicalLaneLean

structure InversionFormulaPackage (O : OperationalCalculusObject)
    (C : ConvolutionTheoremPackage O) where
  inversionKernel : O.originalFunction → O.originalFunction
  inversionFormula : Prop
  uniquenessResult : Prop
  inversionFormulaHolds : inversionFormula
  uniquenessResultHolds : uniquenessResult

structure InversionFormulaEvidence (O : OperationalCalculusObject)
    {C : ConvolutionTheoremPackage O} (I : InversionFormulaPackage O C) where
  inversionFormulaClosed : I.inversionFormula
  uniquenessResultClosed : I.uniquenessResult

def InversionFormulaClosed (O : OperationalCalculusObject)
    {C : ConvolutionTheoremPackage O} (I : InversionFormulaPackage O C) : Prop :=
  I.inversionFormula ∧ I.uniquenessResult

theorem inversion_formula_closed_from_evidence
    (O : OperationalCalculusObject) {C : ConvolutionTheoremPackage O}
    (I : InversionFormulaPackage O C) (E : InversionFormulaEvidence O I) :
    InversionFormulaClosed O I := by
  exact And.intro E.inversionFormulaClosed E.uniquenessResultClosed

end ClassicalOperationalCalculusTheoremCanonicalLaneLean
end HautevilleHouse