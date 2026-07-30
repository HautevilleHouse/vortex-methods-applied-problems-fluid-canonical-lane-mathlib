import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VortexMethodsAppliedProblemsFluidCanonicalLaneLean

def ConstrainedVortexMethodsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_vortex_methods_endgame (A : AdmissibleClass) :
    ConstrainedVortexMethodsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end VortexMethodsAppliedProblemsFluidCanonicalLaneLean
end HautevilleHouse