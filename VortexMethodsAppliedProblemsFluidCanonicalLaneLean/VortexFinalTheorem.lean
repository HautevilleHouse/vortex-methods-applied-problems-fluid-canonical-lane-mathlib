import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VortexMethodsAppliedProblemsFluidCanonicalLaneLean.VortexGateLemmas

namespace HautevilleHouse
namespace VortexMethodsAppliedProblemsFluidCanonicalLaneLean

def ConstrainedVortexClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_vortex_endgame (A : AdmissibleClass) :
    ConstrainedVortexClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end HautevilleHouse.VortexMethodsAppliedProblemsFluidCanonicalLaneLean
end HautevilleHouse
