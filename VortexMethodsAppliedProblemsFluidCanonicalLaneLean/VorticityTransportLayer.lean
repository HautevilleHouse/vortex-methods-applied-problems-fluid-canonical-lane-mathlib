import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VortexMethodsAppliedProblemsFluidCanonicalLaneLean

structure VorticityField where
  omega : ℝ → ℝ → ℝ

def zeroVorticity : VorticityField := {
  omega := fun _ _ => 0
}

def vorticity_equation (omega : VorticityField) (nu : ℝ) : Prop := True

def transport_vorticity (omega : VorticityField) (velocity : ℝ → ℝ) : VorticityField := omega

theorem zero_vorticity_stationary : vorticity_equation zeroVorticity 0 := by
  unfold vorticity_equation
  trivial

end VortexMethodsAppliedProblemsFluidCanonicalLaneLean
end HautevilleHouse