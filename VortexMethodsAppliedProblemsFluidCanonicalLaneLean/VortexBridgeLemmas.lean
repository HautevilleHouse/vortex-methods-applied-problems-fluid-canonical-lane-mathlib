import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.VortexMethodsAppliedProblemsFluidCanonicalLaneLean.VortexAdmissibleClass

namespace HautevilleHouse
namespace VortexMethodsAppliedProblemsFluidCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  VortexNativeBridgeClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact And.intro A.object.sourceKeyChecked A.object.theoremObjectChecked

end HautevilleHouse.VortexMethodsAppliedProblemsFluidCanonicalLaneLean
end HautevilleHouse
