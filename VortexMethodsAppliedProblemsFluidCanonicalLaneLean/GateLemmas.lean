import VortexMethodsAppliedProblemsFluidCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace VortexMethodsAppliedProblemsFluidCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end VortexMethodsAppliedProblemsFluidCanonicalLaneLean
end HautevilleHouse