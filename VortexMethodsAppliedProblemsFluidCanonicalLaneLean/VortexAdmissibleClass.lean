import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VortexMethodsAppliedProblemsFluidCanonicalLaneLean.VortexCoreObjects

namespace HautevilleHouse
namespace VortexMethodsAppliedProblemsFluidCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure VortexTheoremSpecificObject where
  sourceKey : String
  theoremObject : String
  claimBoundary : String
deriving Repr, DecidableEq

structure VortexAdmittedTheoremObject where
  object : VortexTheoremSpecificObject
  localWitness : String
  bridgeEvidence : String
  sourceKeyChecked : object.sourceKey = sourceRepository
  theoremObjectChecked : object.theoremObject = sourceDescription

def vortexTheoremSpecificObject : VortexTheoremSpecificObject := {
  sourceKey := sourceRepository,
  theoremObject := sourceDescription,
  claimBoundary := "Vortex Methods Applied Problems Fluid"
}

def VortexNativeBridgeClosed (O : VortexAdmittedTheoremObject) : Prop :=
  O.object.sourceKey = sourceRepository ∧ O.object.theoremObject = sourceDescription

end HautevilleHouse.VortexMethodsAppliedProblemsFluidCanonicalLaneLean
end HautevilleHouse
