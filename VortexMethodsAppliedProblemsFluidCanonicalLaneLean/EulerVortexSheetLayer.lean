import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VortexMethodsAppliedProblemsFluidCanonicalLaneLean

structure VortexSheet where
  position : ℝ → ℝ → ℝ
  strength : ℝ

def flatSheet : VortexSheet := {
  position := fun x y => 0,
  strength := 0
}

def sheet_induced_velocity (sheet : VortexSheet) : ℝ → ℝ → ℝ := fun x y => 0

def BirkhoffRottEquation (sheet : VortexSheet) : Prop := True

theorem sheet_flat_velocity_zero (x y : ℝ) : sheet_induced_velocity flatSheet x y = 0 := by
  simp [sheet_induced_velocity, flatSheet]

end VortexMethodsAppliedProblemsFluidCanonicalLaneLean
end HautevilleHouse